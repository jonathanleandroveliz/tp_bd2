-- creo trigger para auditoria 

delimiter $$

create trigger auditoria_ajuste_horass
after update
on horas_trabajadas_dia
for each row
begin
insert into auditoria_ajustes_horas (fecha, tabla, hs_ingresada, hs_modificada, tipo_accion, usuario)
values (NOW(), 'horas_trabajadas_dia', old.horas_operativas, new.horas_operativas, 'A', CURRENT_USER());
end
$$


-- realizo un scripts de prueba

update horas_trabajadas_dia
set horas_operativas = 22
where id_proyecto = 3 and id_legajo = 1;

update horas_trabajadas_dia
set horas_operativas = 13
where id_proyecto = 5 and id_legajo = 3;


select * from auditoria_ajustes_horas;

-- Luego elimino el contenido de la prueba realizada

DELETE FROM auditoria_ajustes_horas;


