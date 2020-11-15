delimiter $$
CREATE PROCEDURE eliminacion_logica1 (IN dato INT, IN dato2 INT , IN dato3 VARCHAR(255))
BEGIN

update horas_trabajadas_dia
SET horas_ = 1
WHERE rol = dato3 AND id_proyecto = dato2 AND id_legajo = dato;

END 
$$

