-- Agrego columna para eliminacion --

ALTER TABLE horas_trabajadas_mes
ADD COLUMN eliminado BINARY DEFAULT 0; 

-- Procedimiento de eliminacion y auditoria --

delimiter $$
CREATE PROCEDURE eliminacion_logicafinal (IN rol_delete VARCHAR(255), IN proyect_delete INT , IN legajo_delete INT , IN horas_modificada int )
BEGIN
DECLARE var1 INT DEFAULT 0;

SELECT @var1 := horas_operativas FROM horas_trabajadas_mes
WHERE rol = rol_delete AND id_proyecto = proyect_delete AND id_legajo = legajo_delete;

insert into auditoria_ajustes_horas (fecha, tabla, hs_ingresada, hs_modificada, tipo_accion, usuario)
values (NOW(), 'horas_trabajadas_mes', @var1 ,horas_modificada , 'A', CURRENT_USER());

update horas_trabajadas_mes
SET eliminado = 1
WHERE rol = rol_delete AND id_proyecto = proyect_delete AND id_legajo = legajo_delete;

END 
$$
