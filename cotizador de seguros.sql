
create database cotizador_seguros;
use cotizador_seguros;
show databases;
-- Eliminar objetos de la base de datos, como tablas, vistas, índices, 
-- procedimientos almacenados, entre otros. 
drop  database cotizador_seguros; 

-- Seleccionar una base de datos específica en la que trabajar.
-- USE nombre_base_de_datos;
use asistencia;
show tables;

-- Crear una nueva tabla en una base de datos. 
-- CREATE TABLE nombre_tabla (
--    columna1 tipo_dato_restricciones,
--    columna2 tipo_dato_restricciones,
--    columna3 tipo_dato_restricciones,
--    ...
-- );

CREATE TABLE usuarios (
    id int primary key not null auto_increment,
    id_usuarios int not null, 
    nombres VARCHAR(50),
    apellidos VARCHAR(50) ,
    cedula varchar(50),
    fecha_de_nacimiento varchar (50),
    email VARCHAR(100) ,
    contraseña VARCHAR(100) NOT NULL
);
    
	

show estados_civiles;
-- Crear vistas 
create view prueba as
select abreviacion, descripcion
from tipos_documentos;

create table estados_civiles(
    id int primary key not null auto_increment,
    descripcion varchar(40)
);

create table aprendices(
    id int primary key not null auto_increment,
    id_tipoDocumento int not null,
    numero_documento int not null,
    nombres varchar(60),
    apellidos varchar(60),
    id_estadoCivil int,
    foreign key (id_tipoDocumento) references tipos_documentos (id),
    foreign key (id_estadoCivil) references estados_civiles (id)
);

show columns from estados_civiles;

create table municipios(
    id int,
    codigo varchar(6) not null,
    descripcion varchar(40)
);
show columns from municipios;

alter table municipios add primary key auto_increment (id);

-- ******************************************************************************************** --
-- SCRIP_02
-- ******************************************************************************************** --
drop table aprendices;

rename table aprendices to alumnos;

-- Mostrar una lista de las tablas presentes en la base de datos actual.
show tables;

-- Mostrar la estructura de las columnas de una tabla específica.
show columns from municipios;
-- o
show fields from municipios;
-- o
describe municipios;

show columns from alumnos;

-- Realizar modificaciones en la estructura de una tabla existente, como 
-- añadir, modificar o eliminar columnas, cambiar el nombre de la tabla y más. 
alter table municipios add primary key (id);

alter table alumnos add id_municipio int not null;

alter table alumnos add foreign key (id_municipio) references municipios(id);

-- ******************************************************************************************** --
-- SCRIP_03
-- ******************************************************************************************** --
-- Sentencias DML (Data Manipulation Language)
-- Estas sentencias se utilizan para manipular los datos dentro de las tablas.
-- Algunos ejemplos de sentencias DML son:
--   * INSERT: Inserta filas de datos en las tablas.
--   * SELECT: Recupera información de una o más tablas según las condiciones especificadas.
--   * UPDATE: Modifica registros existentes en una tabla.
--   * DELETE: Elimina registros de una tabla.

show columns from tipos_documentos;
insert into tipos_documentos(abreviacion, descripcion)
	values('CC', 'Cédula de Ciudadanía');
insert into tipos_documentos(abreviacion, descripcion)
	values('TI', 'Tarjeta de Identidad');
insert into tipos_documentos(abreviacion, descripcion)
	values('PS', 'Pasaporte');
insert into tipos_documentos(abreviacion, descripcion)
	values('PPT', 'Permiso por Protección Temporal');
insert into tipos_documentos(abreviacion, descripcion)
	values('CE', 'Cédula de Extranjeria');
    
select * from tipos_documentos;

-- ******************************************************************************************** --
-- SCRIP_04
-- ******************************************************************************************** --
insert into estados_civiles(descripcion) Values 
	('SOLTERO(A)'),
	('CASADO(A)'),
    ('DIVORCIADO(A)'),
    ('VIUDO(A)'),
    ('UNION LIBRE');
    
select * from estados_civiles;

insert into estados_civiles (descripcion) Values ('SEPARADO(A)');


-- ******************************************************************************************** --
-- SCRIP_05
-- ******************************************************************************************** --
select * from municipios;

insert into municipios (id, codigo, descripcion) values ('1' ,'5001' ,'MEDELLÍN');
insert into municipios (id, codigo, descripcion) values ('2' ,'5002' ,'ABEJORRAL');
insert into municipios (id, codigo, descripcion) values ('3' ,'5004' ,'ABRIAQUÍ');
insert into municipios (id, codigo, descripcion) values ('4' ,'5021' ,'ALEJANDRÍA');
insert into municipios (id, codigo, descripcion) values ('5' ,'5030' ,'AMAGÁ');
insert into municipios (id, codigo, descripcion) values ('6' ,'5031' ,'AMALFI');
insert into municipios (id, codigo, descripcion) values ('7' ,'5034' ,'ANDES');
insert into municipios (id, codigo, descripcion) values ('8' ,'5036' ,'ANGELÓPOLIS');


select * from municipios;

show columns from alumnos;

-- ******************************************************************************************** --
-- SCRIP_06
-- ******************************************************************************************** --
select * from alumnos;
insert into alumnos
	(id_tipoDocumento, numero_documento, nombres, apellidos, id_estadoCivil, id_municipio) 
values
	(1, 1047852145, 'CARLOS ARTURO', 'MENDEZ GRISALES', 2, 1),
	(1, 52854875, 'MARIA COSNTANTINA', 'CABALLERO PEREZ', 1, 1),
	(2, 1047852145, 'CARLOS JOSE', 'MENDEZ GRISALES', 1, 1),
	(3, 5932510, 'LEONARDO', 'PERALTA DIAZ', 3, 2),
	(3, 156852414, 'PEPITO', 'DCHARDI CARDENAS', 2, 1),
	(1, 1058458488, 'MARCELA', 'CASAS', 2, 1);


/*  ERROR PUES NO ENCUENTRA EL TIPO DE DOCUMENTO
insert into alumnos
	(id_tipoDocumento, numero_documento, nombres, apellidos, id_estadoCivil, id_municipio) 
values
	(8, 1047852145, 'CARLOS ARTURO', 'MENDEZ GRISALES', 2, 1);*/
    
select * from alumnos;    
show columns from alumnos;

select id_tipoDocumento, nombres, apellidos from alumnos 
	where id_tipoDocumento = 1 or id_tipoDocumento = 3; 

insert into alumnos
	(id_tipoDocumento, numero_documento, nombres, apellidos, id_estadoCivil, id_municipio) 
values
	(1, 1047852145, 'CARLOS ARTURO',' ', 2, 1);
    
-- ******************************************************************************************** --
-- SCRIP_07
-- ******************************************************************************************** --
select numero_documento, nombres, apellidos from alumnos 
	where nombres = "LEONARDO"; 

select nombres, apellidos from alumnos 
	where numero_documento = 156852414; 
    
select *  from alumnos;

use asistencia;
show tables;

show columns from alumnos;

select numero_documento, nombres, apellidos from alumnos 
	where id_tipoDocumento = 1 or id_tipoDocumento = 3; 

 
select * from alumnos
	where (id_tipoDocumento = 2 or id_tipoDocumento = 1) and id_estadoCivil = 1;
    
update alumnos 
	set nombres = 'MARIA DE LOS ANGELES' 
where id = 2;   

select * from alumnos;

update alumnos 
	set 
    nombres = 'CARLOS NAURICIO',
    apellidos = 'MENDOZA POLANIA' 
where id = 8;   


insert into alumnos
	(id_tipoDocumento, numero_documento, nombres, apellidos, id_estadoCivil, id_municipio) 
values
	(2, 1047852145, 'CARLOS JOSE', 'MENDEZ GRISALES', 1, 1);
    
delete from alumnos
	where id = 3;

-- No se realiza pues tiene registros con este municipio
select * from municipios;
delete from municipios
	where id = 1;

select * from alumnos;
select * from tipos_documentos;
delete from tipos_documentos	
	where id = 5;

UPDATE alumnos SET id = 7 WHERE alumnos.id = 8;

-- ******************************************************************************************** --
-- SCRIP_08
-- ******************************************************************************************** --
select * from alumnos;

select * from alumnos where nombres like 'C%';

select nombres, apellidos from alumnos
	where apellidos like 'M%'
	order by nombres;
    
select numero_documento + 50000, nombres from alumnos;

create table estados
	select * FROM municipios
	WHERE codigo = 5002;

SELECT tipos_documentos.abreviacion, alumnos.numero_documento, alumnos.nombres,  
    estados_civiles.descripcion  
FROM alumnos 
INNER JOIN tipos_documentos
	ON alumnos.id_tipoDocumento = tipos_documentos.id
INNER JOIN estados_civiles
	ON alumnos.id_estadoCivil = estados_civiles.id;
    
select alumnos.nombres, alumnos.apellidos, municipios.descripcion
	from alumnos
    inner join municipios
		on alumnos.id_municipio = municipios.id;
        
use asistencia;        