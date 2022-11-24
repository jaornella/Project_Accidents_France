/*

FASE 2 Equipo 2: Rafael, Marcela y Pablo

Este equipo debe realizar un procedimiento llamado 
"load_stage_vehicles" que haga lo siguiente:

1- Hacer una copia de la tabla [dbo].[vehicles], que muestre
estos campos (columnas):

[vehicle.AccidentId]: Este es el mismo que actualmente se llama ["Num_Acc"]

[vehicle.Category]: Este es el mismo que actualmente se llama ["catv"]

[vehicle.NumberVeh]: Este es el mismo que actualmente se llama ["num_veh"]



Notas de interés:
- Para copiar una tabla en otra utilizamos:
select * 
into stage.users
from dbo.users

- De la forma anterior, estamos creando una tabla nueva con todas las columnas
de la tabla users.

- En este ejercicio, en vez de usar el "*", que selecciona todos las columnas,
seleccionaremos las columnas con el nombre que les puse anteriormente.


*/