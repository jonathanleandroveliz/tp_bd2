-- Elimino los datos si hay dentro de las tablas

delete from  cliente;
delete from  proyecto;
delete from  roles;
delete from  legajo;
delete from  participantes;
delete from  centro_costos;
delete from  centro_facturacion;
delete FROM  horas_trabajadas_dia;



-- Empieso a ingresar datos en las tablas creadas

insert into cliente (nombre,direccion) values ('Repsol','Av.La plata 2030 CABA');


insert into proyecto (nombre_project,fecha_inicio,fecha_finalizcion,id_cliente) values ('azul','2009/12/14','2010/02/09','1');
insert into proyecto (nombre_project,fecha_inicio,fecha_finalizcion,id_cliente) values ('violeta','2010/03/14','2010/11/09','1');
insert into proyecto (nombre_project,fecha_inicio,fecha_finalizcion,id_cliente) values ('naranja','2019/06/14','2019/10/09','1');
insert into proyecto (nombre_project,fecha_inicio,fecha_finalizcion,id_cliente) values ('rojo','2009/12/14','2010/02/09','1');
insert into proyecto (nombre_project,fecha_inicio,fecha_finalizcion,id_cliente) values ('verde','2009/12/14','2010/02/09','1');
insert into proyecto (nombre_project,fecha_inicio,fecha_finalizcion,id_cliente) values ('amarillo','2009/12/14','2010/02/09','1');


insert into roles (rol,sector,id_proyecto,legajo,fecha_ingreso) values ('desarrollador','tegnologia','3','B03945','2009/12/14');
insert into roles (rol,sector,id_proyecto,legajo,fecha_ingreso) values ('tester','tegnologia','1','B03445','2009/12/14');
insert into roles (rol,sector,id_proyecto,legajo,fecha_ingreso) values ('devOps','tegnologia','4','B02945','2009/12/14');
insert into roles (rol,sector,id_proyecto,legajo,fecha_ingreso) values ('project manager','tegnologia','6','B02345','2009/12/14');


insert into legajo (legajo,nombre_apellido,email,num_telefono) values ('B03945','Fernando Perez','ferpere@hotmail.com','1231545');
insert into legajo (legajo,nombre_apellido,email,num_telefono) values ('B03445','Juam Fran','juam@hotmail.com','1231545');
insert into legajo (legajo,nombre_apellido,email,num_telefono) values ('B02945','Enrique Casio','Casenri@hotmail.com','1231545');
insert into legajo (legajo,nombre_apellido,email,num_telefono) values ('B02345','Cecilia Dominguez','cecido@hotmail.com','1231545');


insert into participantes (id_legajo,id_proyecto,rol) values ('1','3','desarrollador');
insert into participantes (id_legajo,id_proyecto,rol) values ('2','3','desarrollador');
insert into participantes (id_legajo,id_proyecto,rol) values ('3','5','desarrollador');
insert into participantes (id_legajo,id_proyecto,rol) values ('4','2','desarrollador');



insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','3','1','desarrollador','2010/11/04','21','04');
insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','21','12');
insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','5','3','desarrollador','2010/11/04','21','04');
insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','21','08');
insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','21','12');
insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','3','1','desarrollador','2010/11/04','21','07');
insert into centro_costos (id_cliente,id_proyecto,id_legajo,rol,fecha,iva,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','21','10');


insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','1','desarrollador','2010/11/04','04');
insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','12');
insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','5','3','desarrollador','2010/11/04','04');
insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','08');
insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','12');
insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','1','desarrollador','2010/11/04','07');
insert into centro_facturacion (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','10');



insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','12');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','5','3','desarrollador','2010/11/04','04');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','08');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','12');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','1','desarrollador','2010/11/04','07');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','10');


-- Compruebo si se cargaron de forma correcta los datos si las horas operativas es menor o igual a cero se cargaron con error los datos de lo contrario se cargo con exito 


delimiter $$
create procedure testers() 
BEGIN

SELECT @var1 := sum(horas_operativas) INTO @lol FROM centro_costos;

if @var1 <= 0 
then
 SIGNAL SQLSTATE '34000'
 SET MESSAGE_TEXT = 'Error al cargar los datos';
 else
 SIGNAL SQLSTATE '34000'
 SET MESSAGE_TEXT = 'Se cargaron con exitos los datos';
end if;

ENDlol

$$


call testers();
