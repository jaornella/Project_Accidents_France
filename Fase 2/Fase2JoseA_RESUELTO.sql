Use AccidentesFrancia
go

DROP PROCEDURE IF EXISTS [dbo].[load_stage_places]
go

CREATE PROCEDURE [dbo].[load_stage_places]
AS
begin

drop table if exists AccidentesFrancia.[stage].[places]

Select
	p.["catr"] as [place.CategoryRoad],
	
	iif(p.["catr"]='1','Highway',
		iif(p.["catr"]='2','National Road',
			iif(p.["catr"]='3','Departmental Road',
				iif(p.["catr"]='4','Communal Way',
					iif(p.["catr"]='5','Off public network',
						iif(p.["catr"]='6','Parking lot open to public traffic',
							iif(p.["catr"]='9','other',
								' '))))))) as [place.CategoryRoad_text],
	
	p.["voie"] as [place.RoadNumber],
	
	p.["surf"] as [place.SurfaceCondition],
	
	iif(p.["surf"]='1','normal',
		iif(p.["surf"]='2','wet',
			iif(p.["surf"]='3','puddles',
				iif(p.["surf"]='4','flooded',
					iif(p.["surf"]='5','snow',
						iif(p.["surf"]='6','mud',
							iif(p.["surf"]='7','icy',
								iif(p.["surf"]='8','fat - oil',
									iif(p.["surf"]='9','other',
										' '))))))))) as [place.SurfaceCondition_text],
	
	p.["infra"] as [place.DevelopmentInfrastructure],

	iif(p.["infra"]='1','Underground - tunnel',
		iif(p.["infra"]='2','Bridge - autopont',
			iif(p.["infra"]='3','Exchanger or connection brace',
				iif(p.["infra"]='4','Railway',
					iif(p.["infra"]='5','Carrefour arranged',
						iif(p.["infra"]='6','Pedestrian area',
							iif(p.["infra"]='7','Toll zone',
								' '))))))) as [place.DevelopmentInfrastructure_text],

	p.["situ"] as [place.SituationoftheAccident],

	iif(p.["situ"]='1','On the road',
		iif(p.["situ"]='2','On emergency stop band',
			iif(p.["situ"]='3','On the verge',
				iif(p.["situ"]='4','On the sidewalk',
					iif(p.["situ"]='5','On bike path',
						' '))))) as [place.SituationoftheAccident_text],
	
	p.["nbv"] as [place.TotalLanes],

	p.["vosp"] as [place.ReservedLane],

	iif(p.["vosp"]='1','Bike path',
		iif(p.["vosp"]='2','Cycle Bank',
			iif(p.["vosp"]='3','Reserved channel',
				' '))) as [place.ReservedLane_text],

	p.["plan"] as [place.DrawingPlan],

	iif(p.["plan"]='1','Straight part',
		iif(p.["plan"]='2','Curved on the left',
			iif(p.["plan"]='3','Curved right',
				iif(p.["plan"]='4','In S',
					' ')))) as [place.DrawingPlan_text],

	p.["prof"] as [place.GradientRoad],

	iif(p.["prof"]='1','Dish',
		iif(p.["prof"]='2','Slope',
			iif(p.["prof"]='3','Hilltop',
				iif(p.["prof"]='4','Hill bottom',
					' ')))) as [place.GradientRoad_text]

into AccidentesFrancia.[stage].[places]
from AccidentesFrancia.dbo.places as p

end