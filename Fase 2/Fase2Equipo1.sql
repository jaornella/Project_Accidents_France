/*

FASE 2 Equipo 1: Anita, David y Lidia

Este equipo debe realizar un procedimiento llamado 
"load_stage_users" que haga lo siguiente:

1- Hacer una copia de la tabla [dbo].[users], que muestre
estos campos (columnas):

[user.AccidentId]: Este es el mismo que actualmente se llama ["Num_Acc"]

[user.Category]: Este es el mismo que actualmente se llama ["catu"]

[user.Category_text]: Este será creado a partir del anterior teniendo en cuenta que:
	Si es 1 - poner: 'Driver'
	Si es 2 - poner: 'Passenger'
	Si es 3 - poner: 'Pedestrian'
	Si es 4 - poner: 'Pedestrian in rollerblade or scooter'
	En otro caso - poner: ' '

[user.Severity]: Este es el mismo que actualmente se llama ["grav"]
	Si es 1 - poner: 'Unscathed'
	Si es 2 - poner: 'Killed'
	Si es 3 - poner: 'Hospitalized wounded'
	Si es 4 - poner: 'Light injury'


[user.Sex]: Este es el mismo que actualmente se llama ["sexe"], pero tendremos en cuenta que
	Si es 1 - poner: 'Male'
	Si es 2 - poner: 'Female'
	En otro caso - poner: ' '

[user.YearBirth]: Este es el mismo que actualmente se llama ["an_nais"]

[user.SecurityEquipment]: Este es el mismo que actualmente se llama ["secu"]

[user.ExistEquipment]: Es el primer caracter de la columna ["secu"], teniendo en cuenta que:
	Si es 1 - poner: 'Belt'
	Si es 2 - poner: 'Helmet'
	Si es 3 - poner: 'Children's device'
	Si es 4 - poner: 'Reflective equipment'
	Si es 9 - poner: 'Other'
	En otro caso - poner: ' '

[user.UsedEquipment]: Es el segundo caracter de la columna ["secu"], teniendo en cuenta que:
	Si es 1 - poner: 'Yes'
	Si es 2 - poner: 'No'
	Si es 3 - poner: 'Not determinable'
	En otro caso - poner: ' '


[user.ReasonTraveling]: Este es el mismo que actualmente se llama ["trajet"]

[user.ReasonTraveling_text]: Este es el mismo que actualmente se llama ["trajet"]
	Si es 1 - poner: 'Home - work'
	Si es 2 - poner: 'Home - school'
	Si es 3 - poner: 'Shopping - Shopping'
	Si es 4 - poner: 'Professional use'
	Si es 5 - poner: 'Promenade - leisure'
	Si es 9 - poner: 'Other'
	En otro caso - poner: ' '

[user.NumVeh]: Este es el mismo que actualmente se llama ["num_veh"]




Notas de interés:
- Para copiar una tabla en otra utilizamos:
select * 
into stage.users
from dbo.users

- De la forma anterior, estamos creando una tabla nueva con todas las columnas
de la tabla users.

- En este ejercicio, en vez de usar el "*", que selecciona todos las columnas,
seleccionaremos las columnas con el nombre que les puse anteriormente y las nuevas
columnas usando la condicional "if"

- La sentencia para la condicional "if" es: iif(<condition>, TRUE, FALSE)

*/