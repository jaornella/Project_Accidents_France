Use AccidentesFrancia
go

-- Indices a las tablas de origen
 IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'CaractNumAccIndex')
	CREATE CLUSTERED INDEX CaractNumAccIndex ON [dbo].[caracteristics] (["Num_Acc"] ASC)
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'UserNumAccIndex')
	CREATE CLUSTERED INDEX UserNumAccIndex ON [dbo].[users] (["Num_Acc"] ASC)
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'PlacesNumAccIndex')
	CREATE CLUSTERED INDEX PlacesNumAccIndex ON [dbo].[places] (["Num_Acc"] ASC)
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'VehiclesNumAccIndex')
	CREATE CLUSTERED INDEX VehiclesNumAccIndex ON [dbo].[vehicles] (["Num_Acc"] ASC)
	drop table if exists AccidentesFrancia.dbo.acc_france

-- Crear stage de la tabla características con campo de fecha 
drop table if exists AccidentesFrancia.stage.acc_france
select 
	c.["Num_Acc"] as AccidentId,
	left(c.["Num_Acc"],4) as [Year],
	iif(len(c.["mois"])=1, '0'+convert(varchar,c.["mois"]),c.["mois"]) as [Month],
	c.["jour"] as [Day],
	iif(len(c.["hrmn"])=4,left(c.["hrmn"],2)+':'+ right(c.["hrmn"],2)+':'+'00',
			+' 0'+ left(c.["hrmn"],1)+':'+ right(c.["hrmn"],2)+':'+'00') as [HH:MM:SS],
	cast(
		left(c.["Num_Acc"],4)+'-'+
		iif(len(c.["mois"])=1, '0'+convert(varchar,c.["mois"]),c.["mois"]) +'-'+
		c.["jour"] 
		as date) as [Date],
	iif(len(c.["hrmn"])=4,
		cast(
			left(c.["Num_Acc"],4)+'-'+
			iif(len(c.["mois"])=1, '0'+convert(varchar,c.["mois"]),c.["mois"]) +'-'+
			c.["jour"]+' '+left(c.["hrmn"],2)+':'+ right(c.["hrmn"],2)+':'+'00' 
			as datetime),
		cast(
			left(c.["Num_Acc"],4)+'-'+
			iif(len(c.["mois"])=1, '0'+convert(varchar,c.["mois"]),c.["mois"]) +'-'+
			c.["jour"]+' '+' 0'+ left(c.["hrmn"],1)+':'+ right(c.["hrmn"],2)+':'+'00' 
			as datetime)) as [caract.datetime],
	c.["lum"] as [caract.Lum],
	c.["agg"] as [caract.Localization],
	c.["int"] as [caract.Intersection],
	c.["atm"] as [caract.AtmCondition],
	c.["col"] as [caract.Colision],
	c.["gps"] as [caract.GpsCoding],
	c.["lat"] as [caract.Latitud],
	c.["long"] as [caract.Longitud],
	c.["adr"] as [caract.Adress],
	p.["catr"] as [place.CategoryRoad],
	p.["voie"] as [place.RoadNumber],
	p.["surf"] as [place.SurfaceCondition],
	p.["infra"] as [place.DevelopmentInfrastructure],
	p.["situ"] as [place.SituationoftheAccident],
	p.["nbv"] as [place.TotalLanes],
	p.["vosp"] as [place.ReservedLane],
	p.["plan"] as [place.DrawingPlan],
	p.["prof"] as [place.GradientRoad]
into AccidentesFrancia.stage.acc_france
from AccidentesFrancia.[dbo].[caracteristics] c
 join AccidentesFrancia.[dbo].places p on c.["Num_Acc"]=p.["Num_Acc"]
 go

-- Crear índice de la tabla de stage de característica
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'AccFranceNumAccIndex')
	CREATE CLUSTERED INDEX AccFranceNumAccIndex ON stage.acc_france ([AccidentId] ASC)
go
-- Crear stage de vehículos
drop table if exists AccidentesFrancia.stage.vehicles
select 
	["Num_Acc"] as [vehicle.AccidentId],
	["catv"] as [vehicle.Category],
	["num_veh"] [vehicle.NumberVeh]
into AccidentesFrancia.stage.vehicles
from AccidentesFrancia.dbo.vehicles

-- Crear índice de la tabla de stage de Vehículos
 IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'StageVehiclesNumAccIndex')
	CREATE CLUSTERED INDEX StageVehiclesNumAccIndex ON AccidentesFrancia.stage.vehicles ([vehicle.AccidentId] ASC)

-- Crear stage de usuarios
drop table if exists AccidentesFrancia.stage.users
select 
	["Num_Acc"] as [user.AccidentId],
	["catu"] as [user.Category],
	["grav"] as [user.Severity],
	["sexe"] as [user.Sex],
	["an_nais"] as [user.YearBirth],
	["secu"] as [user.SecurityEquipment],
	["trajet"] as [user.ReasonTraveling],
	["num_veh"] as [user.NumVeh]
into AccidentesFrancia.stage.users
from AccidentesFrancia.dbo.users

-- Crear índice de la tabla de stage de usuarios
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'StageusersNumAccIndex')
	CREATE CLUSTERED INDEX StageusersNumAccIndex ON AccidentesFrancia.stage.users ([user.AccidentId] ASC)



-- Crear índice de la tabla export  
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'ExportAccIndex')
	CREATE CLUSTERED INDEX ExportAccIndex ON AccidentesFrancia.export.detalil_acc ([user.AccidentId] ASC)


drop table if exists AccidentesFrancia.export.accidents_france
select  
	a.[AccidentId],
	a.[Year],
	a.[Month],
	a.[Day],
	a.[HH:MM:SS],
	a.[Date],
	a.[caract.datetime],
	a.[caract.Lum],
	iif(a.[caract.Lum]=1,'Full day',
		iif(a.[caract.Lum]=2,'Twilight or dawn',
			iif(a.[caract.Lum]=3,'Night without public lighting',
				iif(a.[caract.Lum]=4,'Night with public lighting not lit',
					iif(a.[caract.Lum]=5,'Night with public lighting on',
						' '))))) as [caract.Lum_text],
	a.[caract.Localization],
	iif(a.[caract.Localization]=1,'Out of agglomeration',
		iif(a.[caract.Localization]=2,'In built-up areas',
			' ')) as [caract.Localization_text],
	a.[caract.Intersection],
	iif(a.[caract.Intersection]=1,'Out of intersection',
		iif(a.[caract.Intersection]=2,'Intersection in X',
			iif(a.[caract.Intersection]=3,'Intersection in T',
				iif(a.[caract.Intersection]=4,'Intersection in Y',
					iif(a.[caract.Intersection]=5,'Intersection with more than 4 branches',
						iif(a.[caract.Intersection]=6,'Giratory',
							iif(a.[caract.Intersection]=7,'Place',
								iif(a.[caract.Intersection]=8,'Level crossing',
									iif(a.[caract.Intersection]=9,'Other intersection',
										' '))))))))) as [caract.Intersection_text],
	a.[caract.AtmCondition],
	iif(a.[caract.AtmCondition]='1','Normal',
		iif(a.[caract.AtmCondition]='2','Light rain',
			iif(a.[caract.AtmCondition]='3','Heavy rain',
				iif(a.[caract.AtmCondition]='4','Snow - hail',
					iif(a.[caract.AtmCondition]='5','Fog - smoke',
						iif(a.[caract.AtmCondition]='6','Strong wind - storm',
							iif(a.[caract.AtmCondition]='7','Dazzling weather',
								iif(a.[caract.AtmCondition]='8','Cloudy weather',
									iif(a.[caract.AtmCondition]='9','Other',
										' '))))))))) as [caract.AtmCondition_text],
	a.[caract.Colision],
	iif(a.[caract.Colision]='1','Two vehicles - frontal',
		iif(a.[caract.Colision]='2','Two vehicles - from the rear',
			iif(a.[caract.Colision]='3','Two vehicles - by the side',
				iif(a.[caract.Colision]='4','Three vehicles and more - in chain',
					iif(a.[caract.Colision]='5','Three or more vehicles - multiple collisions',
						iif(a.[caract.Colision]='6','Other collision',
							iif(a.[caract.Colision]='7','Without collision',
								' '))))))) as [caract.Colision_text],
	a.[caract.GpsCoding],
	iif(a.[caract.GpsCoding]='"M"','Métropole',
		iif(a.[caract.GpsCoding]='"A"','Antilles (Martinique or Guadeloupe)',
			iif(a.[caract.GpsCoding]='"G"','Guyane',
				iif(a.[caract.GpsCoding]='"R"','Réunion',
					iif(a.[caract.GpsCoding]='"Y"','Mayotte',
						' '))))) as [caract.GpsCoding_text],
	a.[caract.Latitud],
	a.[caract.Longitud],
	a.[caract.Adress],
	a.[place.CategoryRoad],
	iif(a.[place.CategoryRoad]='1','Highway',
		iif(a.[place.CategoryRoad]='2','National Road',
			iif(a.[place.CategoryRoad]='3','Departmental Road',
				iif(a.[place.CategoryRoad]='4','Communal Way',
					iif(a.[place.CategoryRoad]='5','Off public network',
						iif(a.[place.CategoryRoad]='6','Parking lot open to public traffic',
							iif(a.[place.CategoryRoad]='9','other',
								' '))))))) as [place.CategoryRoad_text],
	a.[place.RoadNumber],
	a.[place.SurfaceCondition],
	iif(a.[place.SurfaceCondition]='1','normal',
		iif(a.[place.SurfaceCondition]='2','wet',
			iif(a.[place.SurfaceCondition]='3','puddles',
				iif(a.[place.SurfaceCondition]='4','flooded',
					iif(a.[place.SurfaceCondition]='5','snow',
						iif(a.[place.SurfaceCondition]='6','mud',
							iif(a.[place.SurfaceCondition]='7','icy',
								iif(a.[place.SurfaceCondition]='8','fat - oil',
									iif(a.[place.SurfaceCondition]='9','other',
										' '))))))))) as [place.SurfaceCondition_text],
	a.[place.DevelopmentInfrastructure],
	iif(a.[place.DevelopmentInfrastructure]='1','Underground - tunnel',
		iif(a.[place.DevelopmentInfrastructure]='2','Bridge - autopont',
			iif(a.[place.DevelopmentInfrastructure]='3','Exchanger or connection brace',
				iif(a.[place.DevelopmentInfrastructure]='4','Railway',
					iif(a.[place.DevelopmentInfrastructure]='5','Carrefour arranged',
						iif(a.[place.DevelopmentInfrastructure]='6','Pedestrian area',
							iif(a.[place.DevelopmentInfrastructure]='7','Toll zone',
								' '))))))) as [place.DevelopmentInfrastructure_text],
	a.[place.SituationoftheAccident],
	iif(a.[place.SituationoftheAccident]='1','On the road',
		iif(a.[place.SituationoftheAccident]='2','On emergency stop band',
			iif(a.[place.SituationoftheAccident]='3','On the verge',
				iif(a.[place.SituationoftheAccident]='4','On the sidewalk',
					iif(a.[place.SituationoftheAccident]='5','On bike path',
						' '))))) as [place.SituationoftheAccident_text],
	a.[place.TotalLanes],
	a.[place.ReservedLane],
	iif(a.[place.ReservedLane]='1','Bike path',
		iif(a.[place.ReservedLane]='2','Cycle Bank',
			iif(a.[place.ReservedLane]='3','Reserved channel',
				' '))) as [place.ReservedLane_text],
	a.[place.DrawingPlan],
	iif(a.[place.DrawingPlan]='1','Straight part',
		iif(a.[place.DrawingPlan]='2','Curved on the left',
			iif(a.[place.DrawingPlan]='3','Curved right',
				iif(a.[place.DrawingPlan]='4','In S',
					' ')))) as [place.DrawingPlan_text],
	a.[place.GradientRoad],
	iif(a.[place.GradientRoad]='1','Dish',
		iif(a.[place.GradientRoad]='2','Slope',
			iif(a.[place.GradientRoad]='3','Hilltop',
				iif(a.[place.GradientRoad]='4','Hill bottom',
					' ')))) as [place.GradientRoad_text]
into AccidentesFrancia.export.accidents_france
from AccidentesFrancia.[stage].[acc_france] a

-- Crear índice de la tabla de export de accidents_france
IF NOT EXISTS(SELECT * FROM sys.indexes WHERE Name = 'ExportAccFranceNumAccIndex')
	CREATE CLUSTERED INDEX ExportAccFranceNumAccIndex 
	ON AccidentesFrancia.export.accidents_france ([AccidentId] ASC)


-- Crear tabla export con los detalles de cada accidentes (usuarios y vehículos implicados)
drop table if exists AccidentesFrancia.export.detalil_acc
select * 
into AccidentesFrancia.export.detalil_acc
from AccidentesFrancia.stage.users u
left join AccidentesFrancia.stage.vehicles v on u.[user.AccidentId]=v.[vehicle.AccidentId]
left join AccidentesFrancia.export.accidents_france a on a.[AccidentId] = u.[user.AccidentId]
where u.[user.NumVeh]=v.[vehicle.NumberVeh] --and u.[AccidentId] in (200500000001,200500000002)