 CREATE DATABASE COTIZADOR_DE_SEGUROS;
use cotizador_de_seguros;

CREATE TABLE usuarios_c (
    id int primary key not null auto_increment,
    nombres VARCHAR(50),
    apellidos VARCHAR(50) ,
    sexo varchar(50)
);

insert into usuarios_c values (null, "Frank","Valencia","Masculino");

select * from usuarios_c;

CREATE TABLE usuarios (
    id int primary key NOT NULL auto_increment,
    id_usuarios int not null, 
    nombres VARCHAR(50),
    apellidos VARCHAR(50) ,
    cedula varchar(50),
    fecha_de_nacimiento varchar (50),
    email VARCHAR(100) ,
    contraseña VARCHAR(100) NOT NULL
);

    


CREATE TABLE marca (  
   id int primary key not null auto_increment,
  id_marca int not null,
  Nombre_marca VARCHAR(45) NOT NULL
);
CREATE TABLE linea_vehiculo (  
  id int primary key not null auto_increment,
 id_lineavehiculo int not null, 
  Nombre_linea VARCHAR(45),
  id_marca int,
  foreign key (id_marca) references marca (id)

);
CREATE TABLE Tipo_vehiculo (  
  id int primary key not null auto_increment,
  id_tipovehiculo int not null,
  Nombre_tipovehiculo VARCHAR(45) 
);
CREATE TABLE coberturas (  
  id int primary key not null auto_increment,
  id_coberturas int not null,
  Nombre_coberturas VARCHAR(45) 
);
CREATE TABLE cotizador (  
  id int primary key not null auto_increment,
  id_cotizador int not null,
  fecha_cotizador VARCHAR(45), 
  hora_cotizador VARCHAR(45), 
  placa_automovil varchar(45),
  id_automovil int,
  foreign key (id_automovil) references automovil (id)
);

CREATE TABLE oferta_cobertura (  
  id int primary key not null auto_increment,
  id_ofertacobertura int not null,
  valor_coberturas VARCHAR(45) ,
  deducible varchar(45) ,
  gastos_expedicion varchar(45) ,
  iva varchar(45) ,
  total varchar(45),
   id_coberturas int ,
  foreign key (id_coberturas) references coberturas (id)
);
CREATE TABLE aseguradora (  
   id int primary key not null auto_increment,
  id_aseguadora int not null,
  nombre_aseguradora VARCHAR(45) ,
  telefono_aseguradora VARCHAR(45),
  id_ofertacobertura int,
  foreign key (id_ofertacobertura) references oferta_cobertura (id)
);

CREATE TABLE automovil (  
  id int primary key NOT NULL auto_increment,
  id_automovil int not null,
  modelo_automovil VARCHAR(45) ,
  id_marca int,
  id_lineavehiculo int,
  id_tipovehiculo int,
  id_usuarios int,
  foreign key (id_marca) references marca (id),
  foreign key (id_lineavehiculo) references linea_vehiculo (id),
  foreign key (id_tipovehiculo) references tipo_vehiculo (id),
  foreign key (id_usuarios) references usuarios (id)
);

create table aseguradora_mapfre (
  tipo_vehiculo varchar(10) not null,
  nombres_apellidos varchar(30) not null,
  placa_vehiculo varchar(6) not null,
  cedula tinyint(20) unsigned not null
) ENGINE=InnoDB comment='Almacena los datos de la aseguradora_mapfre.';

insert into aseguradora_mapfre (tipo_vehiculo, nombres_apellidos, placa_vehiculo, cedula) VALUES
('SPARK', 'DECLAN MCKENNA', 'SDL456', 1004578963 ),
('TWINGO', 'TYLER JOSEPH', 'GRG741' , 456741852),
('X5', 'JOSH DUNN', 'HRH963', 987632541);
select * from aseguradora_mapfre;


