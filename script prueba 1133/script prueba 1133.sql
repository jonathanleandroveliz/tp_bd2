-- veo los usuarios que tengo en la db suponiendo que entramos como root 

 SELECT user FROM mysql.user;

-- veo los privilegios que tiene cada usuario

show grants for auditor;
show grants for 'administrador'@'localhost';
show grants for 'sitio_web'@'localhost';
show grants for sitio_web_revisor;

-- salgo del usuario root y me conecto con el usuario a probar auditor 

select * from centro_facturacion;

update horas_trabajadas_semanales
set horas_operativas = 13 
where rol = 'tester' and id_proyecto = 5
and id_legajo = 3;

alter table horas_trabajadas_semanales
drop column id_legajo;

insert into cliente (nombre,direccion) values ('Fravega','Mendoza 213 CABA');


