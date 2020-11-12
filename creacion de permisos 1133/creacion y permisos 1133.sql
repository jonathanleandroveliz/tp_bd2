-- creacion de usuarios

create user auditor identified by 'lanus10';
create user 'administrador'@'localhost' identified by 'banfield10'; 
create user 'sitio_web'@'localhost' identified by 'banfield10'; 
create user sitio_web_revisor identified by 'banfield10'; 

-- creacion de permisos para los usuarios

grant select on lol.* to auditor;
revoke insert , update on lol.* from auditor;

grant update , insert on lol.* to 'administrador'@'localhost';
revoke drop on lol.* from 'administrador'@'localhost';

grant select , insert on lol.* to 'sitio_web'@'localhost';
revoke delete , update on lol.* from 'administrador'@'localhost';

grant delete , update , insert on lol.* to sitio_web_revisor;
revoke drop  on lol.* from sitio_web_revisor;







