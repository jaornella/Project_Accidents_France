/*

FASE 2 Equipo 3: Joaquin y Mar

Este equipo debe realizar un procedimiento llamado 
"load_stage_acc_france" que haga lo siguiente:

1- Hacer una copia de la tabla [dbo].[caracterists], que muestre
estos campos (columnas):

[AccidentId]: Este es el mismo que actualmente se llama ["Num_Acc"]

[Year]: Para crear esta columna coger el año de la columna ["Num_Acc"]

[Month]: Este es el mismo que actualmente se llama ["mois"], pero habrá
que ponerle 0 delante de los meses de un solo dígito: 01, 02, etc.

[Day]: Este es el mismo que actualmente se llama ["jour"], y ocurre lo mismo
que con el mes, que habrá que ponerle 0 delante de los dias de un solo dígito: 01, 02, etc.

[HH:MM:SS]: Este es el mismo que actualmente se llama ["hrmn"] y ocurre algo similar. 
Crear esta estructura hh:mm:00

[Date]: Concatenar [Year], [Month] y [Day] y convertirlo en tipo de datos de Fecha.

[DateTime]: Igual que la columna anterior, pero que coja las horas y los minutos.

[caract.Lum]: Este es el mismo que actualmente se llama ["lum"]

[caract.Lum_text]: Este es el mismo que actualmente se llama ["lum"] pero teniendo en cuenta que:
	Si es 1 - poner: 'Full day'
	Si es 2 - poner: 'Twilight or dawn'
	Si es 3 - poner: 'Night without public lighting'
	Si es 4 - poner: 'Night with public lighting not lit'
	Si es 5 - poner: 'Night with public lighting on'
	En otro caso - poner: ' '

[caract.Localization]: Este es el mismo que actualmente se llama ["agg"]


[caract.Localization_text]: Este es el mismo que actualmente se llama ["agg"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Out of agglomeration'
	Si es 2 - poner: 'In built-up areas'
	En otro caso - poner: ' '

[caract.Intersection]: Este es el mismo que actualmente se llama ["int"]


[caract.Intersection_text]: Este es el mismo que actualmente se llama ["int"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Out of intersection'
	Si es 2 - poner: 'Intersection in X'
	Si es 3 - poner: 'Intersection in T'
	Si es 4 - poner: 'Intersection in Y'
	Si es 5 - poner: 'Intersection with more than 4 branches'
	Si es 6 - poner: 'Giratory'
	Si es 7 - poner: 'Place'
	Si es 8 - poner: 'Level crossing'
	Si es 9 - poner: 'Other intersection'
	En otro caso - poner: ' '


[caract.AtmCondition]: Este es el mismo que actualmente se llama ["atm"]


[caract.AtmCondition_text]: Este es el mismo que actualmente se llama ["atm"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Normal'
	Si es 2 - poner: 'Light rain'
	Si es 3 - poner: 'Heavy rain'
	Si es 4 - poner: 'Snow - hail'
	Si es 5 - poner: 'Fog - smoke'
	Si es 6 - poner: 'Strong wind - storm'
	Si es 7 - poner: 'Dazzling weather'
	Si es 8 - poner: 'Cloudy weather'
	Si es 9 - poner: 'Other'
	En otro caso - poner: ' '


[caract.Colision]: Este es el mismo que actualmente se llama ["col"], pero teniendo en cuenta que:
	Si es 1 - poner: 'Two vehicles - frontal'
	Si es 2 - poner: 'Two vehicles - from the rear'
	Si es 3 - poner: 'Two vehicles - by the side'
	Si es 4 - poner: 'Three vehicles and more - in chain'
	Si es 5 - poner: 'Three or more vehicles - multiple collisions'
	Si es 6 - poner: 'Other collision'
	Si es 7 - poner: 'Without collision'
	En otro caso - poner: ' '

[caract.GpsCoding]: Este es el mismo que actualmente se llama ["gps"], pero teniendo en cuenta que:
	Si es M = poner: 'Métropole
	Si es A = poner: 'Antilles (Martinique or Guadeloupe)
	Si es G = poner: 'Guyane
	Si es R = poner: 'Réunion
	Si es Y = poner: 'Mayotte


[caract.Latitud]: Este es el mismo que actualmente se llama ["lat"] 


[caract.Longitud]: Este es el mismo que actualmente se llama ["long"]


[caract.Adress]: Este es el mismo que actualmente se llama ["adr"]








*/