/*
FASE 2 Jose Angel

Realizaré un procedimiento llamado 
"load_stage_places" que haga lo siguiente:

1- Hacer una copia de la tabla [dbo].[places], que muestre
estos campos (columnas):

[place.CategoryRoad]: Este es el mismo que actualmente se llama ["catr"]


[place.CategoryRoad_text]: Este es el mismo que actualmente se llama ["catr"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Highway'
	Si es 2 - poner: 'National Road'
	Si es 3 - poner: 'Departmental Road'
	Si es 4 - poner: 'Communal Way'
	Si es 5 - poner: 'Off public network'
	Si es 6 - poner: 'Parking lot open to public traffic'
	Si es 9 - poner: 'other'
	En otro caso - poner: ' '

[place.RoadNumber]: Este es el mismo que actualmente se llama ["voie"]


[place.SurfaceCondition]: Este es el mismo que actualmente se llama ["surf"]


[place.SurfaceCondition_text]: Este es el mismo que actualmente se llama ["surf"], pero teniendo en cuenta que:
	Si es 1 - poner: 'normal'
	Si es 2 - poner: 'wet'
	Si es 3 - poner: 'puddles'
	Si es 4 - poner: 'flooded'
	Si es 5 - poner: 'snow'
	Si es 6 - poner: 'mud'
	Si es 7 - poner: 'icy'
	Si es 8 - poner: 'fat - oil'
	Si es 9 - poner: 'other'
	En otro caso - poner: ' '


[place.DevelopmentInfrastructure]: Este es el mismo que actualmente se llama ["infra"]



[place.DevelopmentInfrastructure_text]: Este es el mismo que actualmente se llama ["infra"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Underground - tunnel'
	Si es 2 - poner: 'Bridge - autopont'
	Si es 3 - poner: 'Exchanger or connection brace'
	Si es 4 - poner: 'Railway'
	Si es 5 - poner: 'Carrefour arranged'
	Si es 6 - poner: 'Pedestrian area'
	Si es 7 - poner: 'Toll zone'
	En otro caso - poner: ' '


[place.SituationoftheAccident]: Este es el mismo que actualmente se llama ["situ"]



[place.SituationoftheAccident]: Este es el mismo que actualmente se llama ["situ"], pero teniendo en cuenta que:
	Si es 1 - poner: 'On the road'
	Si es 2 - poner: 'On emergency stop band'
	Si es 3 - poner: 'On the verge'
	Si es 4 - poner: 'On the sidewalk'
	Si es 5 - poner: 'On bike path'
	En otro caso - poner: ' '

[place.TotalLanes]: Este es el mismo que actualmente se llama ["nbv"]


[place.ReservedLane]: Este es el mismo que actualmente se llama ["vosp"]


[place.ReservedLane_text]: Este es el mismo que actualmente se llama ["vosp"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Bike path'
	Si es 2 - poner: 'Cycle Bank'
	Si es 3 - poner: 'Reserved channel'
	En otro caso - poner: ' '


[place.DrawingPlan]: Este es el mismo que actualmente se llama ["plan"]


[place.DrawingPlan_text]: Este es el mismo que actualmente se llama ["plan"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Straight part'
	Si es 2 - poner: 'Curved on the left'
	Si es 3 - poner: 'Curved right'
	Si es 4 - poner: 'In S'
	En otro caso - poner: ' '


[place.GradientRoad]: Este es el mismo que actualmente se llama ["prof"]


[place.GradientRoad_text]: Este es el mismo que actualmente se llama ["prof"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Dish'
	Si es 2 - poner: 'Slope'
	Si es 3 - poner: 'Hilltop'
	Si es 4- poner: 'Hill bottom'
	En otro caso - poner: ' '






*/