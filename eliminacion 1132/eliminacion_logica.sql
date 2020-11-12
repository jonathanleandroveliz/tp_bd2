-- creo el procedimiento para la eliminacion logica

delimiter $$
create procedure eliminacion_logica(IN id_l int , IN id_p int)
BEGIN
SELECT @var1 := id_cliente,@var2 := id_proyecto, @var3 := id_legajo,
 @var4 := rol ,@var5 := fecha ,
@var6 := horas_operativas ,@var7 := 1
  FROM horas_trabajadas_dia
where id_legajo = id_l AND
 id_proyecto = id_p;
 
 DELETE FROM horas_trabajadas_dia
 WHERE id_legajo = id_l AND 
 id_proyecto = id_p;
 
INSERT INTO horas_trabajadas_dia (id_cliente,id_proyecto,id_legajo,rol,fecha,horas_operativas,eliminacion)
select @var1,@var2,@var3,@var4,@var5,@var6,@var7;


END

$$


