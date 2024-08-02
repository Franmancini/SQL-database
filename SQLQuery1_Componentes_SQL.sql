--Uso del componente de los DCL(Lenguaje de control de datos)
--activiar la base de datos master
use master
go
--crear un login en la databases general, luego verificar en security y logins
create login secretaria with password='123'
go
--verificar el usuario creado en la databases general
use master
go
--desconectar el servidor actual
--conectarse con la autenticación SQL Server y el usuario secretaria
--Cerrar el archivo de la analizador de consultas
go
--activar la bdmemorykings
use bdmemorykings
go
--crear el usuario en la bdmemorykings y asignar le el acceso del usuario(secretaria)
CREATE USER secretaria FOR LOGIN secretaria
--desconectar el servidor actual
--conectarse con la autenticación SQL Server y el usuario secretaria
go
use bdmemorykings
go
--verificar el resultado de la consulta
select * from categoria
go
--desconectar el servidor actual
--conectarse con la autenticación window
use bdmemorykings
go
--asignar permisos de solo lectura a la tabla categoria
GRANT select ON categoria TO secretaria
go
--desconectar el servidor y volver a conectar con el usuario secretaria
--y la autenticación de sql server
go
--visualizar los datos de la tabla producto
select * from categoria
go
--insertar una nueva categiria(no se puede insertar un nuevo registro)
insert into categoria
values(7,'micrófono')
go
--desconectar el servidor actual
--conectarse con la autenticación window
use master
go
use bdmemorykings
go
--asginar permisos para insertar datos en la tabla categoria
GRANT insert ON categoria TO secretaria
go
use bdmemorykings
go
--insertar una nueva categoria(no se puede insertar un nuevo registro)
insert into categoria
values(7,'micrófono')
go
--verificar la inserción de una nueva categoria
select * from categoria 
go
--desconectar el servidor actual
--conectarse con la autenticación window
use master
go
use bdmemorykings
go
--asginar permisos para insertar datos en la tabla categoria
GRANT update ON categoria TO secretaria
GRANT delete ON categoria TO secretaria
go
--desconectar el servidor y volver a conectar con el usuario secretaria
--y la autenticación de sql server
--insertar una nueva categiria(no se puede insertar un nuevo registro)
go
use bdmemorykings
go
select * from categoria
go
--actualizar un registro de la tabla catagoría
update categoria
set nomcat='monitor led'
where codcat=4
go
--verificar el registro
select * from categoria
go
--eliminar el registro de monitor led
delete from categoria
where codcat=4
go
use master
go
use bdmemorykings
go
--negar el permiso para insertar datos en la tabla categoria
deny insert to secretaria
--desconectar el servidor actual
--conectarse con la autenticación window
use master
go
use bdmemorykings
go
