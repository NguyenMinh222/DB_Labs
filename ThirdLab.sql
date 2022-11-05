create table manufactor(
id_izg int(4) auto_increment primary key,
manufactor varchar(32) not null,
adress varchar(32) not null,
telephoneNumber varchar(16),
 constraint check_telephoneNumber check (telephoneNumber in ('+','1','2','3','4','5','6','7','8','9','0')));
 
 create table quality
 (id_quality int(4) auto_increment primary key,
 quality varchar(32) not null);