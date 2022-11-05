mysql> create table authorization(
    -> id_author int auto_increment primary key,
    -> Login varchar(32) unique not null,
    -> Password varchar(32) unique not null,
    -> Image longblob,
    -> Surname varchar(16) not null,
    -> Name varchar(16) not null,
    -> Patronimyc varchar(16)
    -> );
 
create table type_of_tovar
 (id_type int(4) auto_increment primary key,
 type_of_tovar varchar(64) not null);
 
create table manufactor(
id_izg int(4) auto_increment primary key,
manufactor varchar(32) not null,
adress varchar(32) not null,
telephoneNumber varchar(16),
 constraint check_telephoneNumber check (telephoneNumber in ('+','1','2','3','4','5','6','7','8','9','0')));
 
 create table quality
 (id_quality int(4) auto_increment primary key,
 quality varchar(32) not null);
 
 
