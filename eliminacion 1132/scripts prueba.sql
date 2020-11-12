-- Elimino contenido de la tabla

delete FROM  horas_trabajadas_dia;

-- Realizo un scrips de prueba

insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','12');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','5','3','desarrollador','2010/11/04','04');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','08');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','2','4','desarrollador','2010/11/04','12');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','1','desarrollador','2010/11/04','07');
insert into horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas) values ('1','3','2','desarrollador','2010/11/04','10');


CALL eliminacion_logica (1,3);

SELECT * FROM horas_trabajadas_dia;