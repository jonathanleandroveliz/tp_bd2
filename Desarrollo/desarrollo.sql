-- Estrucura para realizar modificacion de horas trabajada por falla del personal , por dia , mes o semanas

delimiter $$
create procedure ajuste_xdia (IN realizado DATETIME ,IN hs_modify INT ,IN proyecto1 int , IN roles1 VARCHAR(255), 
IN nombre int)

BEGIN

update horas_trabajadas_dia
set horas_operativas = hs_modify 
where rol = roles1 and id_proyecto = proyecto1 AND id_legajo = nombre AND fecha=realizado;
END

$$


delimiter $$
create procedure ajuste_xmes (IN realizado DATETIME ,IN hs_modify INT ,IN proyecto1 int , IN roles1 VARCHAR(255), 
IN nombre int)

BEGIN

update horas_trabajadas_mes
set horas_operativas = hs_modify 
where rol = roles1 and id_proyecto = proyecto1 AND id_legajo = nombre AND fecha=realizado;
END

$$


delimiter $$
create procedure ajuste_xsemanas(IN realizado DATETIME ,IN hs_modify INT ,IN proyecto1 int , IN roles1 VARCHAR(255), 
IN nombre int)

BEGIN

update horas_trabajadas_semanales
set horas_operativas = hs_modify 
where rol = roles1 and id_proyecto = proyecto1 AND id_legajo = nombre AND fecha=realizado;
END

$$


-- Liquidacion cierre del mes x dia 
-- En el ejemplo se inserta 4 filas a la cual mi pregunta es porque genera 4 filas si solo inserto una linea a la tabla facturacion_total 


delimiter $$
create procedure facturacion_xdia (IN num_proyecto INT ,out sal5 INT   )
BEGIN
declare desarrollador_precio int default 50;
declare tester_precio int default 83;
declare devOps_precio int default 105;
declare project_manager_precio int default 123;
DECLARE total INT DEFAULT 0;
DECLARE sal1 INT DEFAULT 0;
DECLARE sal2 INT DEFAULT 0;
DECLARE sal3 INT DEFAULT 0;
DECLARE sal4 INT DEFAULT 0;


SELECT @var1 := sum(horas_operativas) * desarrollador_precio ,
(SELECT @var2 :=  sum(horas_operativas) * tester_precio from centro_costos where id_proyecto = 3 and rol LIKE '%test%') AS tabla_1 , 
(select @var3 := sum(horas_operativas) * devOps_precio  from centro_costos where id_proyecto = 3 and rol LIKE '%devO%') AS tabla_2,
(select @var4 := sum(horas_operativas) * project_manager_precio from centro_costos where id_proyecto = 3 and rol LIKE '%project%') AS tabla_3
FROM centro_costos where id_proyecto = 3 and rol LIKE '%desarr%';

if @var1 IS NULL 
then
SET @var1 = 0;
ELSEIF @var2 IS NULL
then 
SET @var2 = 0;

END if; 

if @var3 IS NULL
then 
SET @var3 = 0;
END if;

IF @var4 IS NULL
then 
SET @var4 = 0;

END if;

SET sal1=@var1;
SET sal2=@var2;
SET sal3=@var3;
SET sal4=@var4;

if @total IS NULL
then
SET total= @var1+@var2+@var3+@var4;

END if;


SET sal5 = @total;

INSERT INTO facturacion_final (id_cliente,id_proyecto,fecha,totalapagar)
SELECT '1',id_proyecto,NOW(),@sal5
FROM centro_costos
WHERE id_proyecto = num_proyecto;


END
$$





