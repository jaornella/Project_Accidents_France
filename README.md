# Project_Accidents_France

## Fase 1: (TODOS los colaboradores)

1- Crear la BD AccidentesFrancia

2- Importar las tablas al esquema dbo
	- dbo.caracterists
	- dbo.places
	- dbo.vehicles

3- Crear dos esquemas
	- stage
	- export

4- Crearle índices a las tablas importadas por el campo que identifica
a los accidentes.




## Fase 2: (Por equipos)
	* Hacer las stage de:
		- tabla "users" resultando -> [stage].[users]
		- tabla "vehicles" resultando -> [stage].[vehicles]
		- tabla "caracterists" resultando -> [stage].[acc_france]

	* Crearle índices a las tablas del esquema "stage" por el campo que identifica
	a los accidentes

	Para este trabajo se deberán hacer 3 procedimientos:
			- load_stage_users (Equipo 1) Anita, David y Lidia
			- load_stage_vehicles (Equipo 2) Rafael, Marcela y Pablo
			- load_stage_acc_france (Equipo 3) Joaquin y Mar 


Una vez concluida la fase 2 cada uno deberá de tener los scripts de cada procedimiento
y ser capaz de correr satisfactoriamente
el procedimiento: load_stage

## Fase 3: (Por equipos)
	* Hacer las tablas exports:
		- [export].[accidents_france]
		- [export].[detalil_acc]
	* Crearle índices a las tablas del esquema "export" por el campo que identifica
	a los accidentes
	
	Para este trabajo se deberán hacer 2 procedimientos:
			- load_accidents_france (Equipo 1: Anita, David, Lidia y Mar)
			- load_detalil_acc (Equipo 2: Rafael, Marcela, Pablo y Joaquin)

Una vez concluida la fase 3 cada uno deberá de ser capaz de correr satisfactoriamente
el procedimiento: load_all
