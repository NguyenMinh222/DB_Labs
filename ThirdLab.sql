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
 (
 id_type int(4) auto_increment primary key,
 type_of_tovar varchar(64) not null
 );
 
create table manufactor
(
id_izg int(4) auto_increment primary key,
manufactor varchar(32) not null,
adress varchar(32) not null,
telephoneNumber varchar(16),
 constraint check_telephoneNumber check (telephoneNumber in ('+','1','2','3','4','5','6','7','8','9','0'))
);
 
 create table quality
 (
 id_quality int(4) auto_increment primary key,
 quality varchar(32) not null
 );
 
 create table passport
 (
id_passport int(4) auto_increment primary key,
dateRelease varchar(16) not null,
 constraint check_dateRelease check (dateRelease in ('.','1','2','3','4','5','6','7','8','9','0')),
validUntil varchar(16) not null,
  constraint  check_validUntil check (validUntil in ('.','1','2','3','4','5','6','7','8','9','0'))
 );
 
create table contact
(
id_contact int(4) auto_increment primary key,
email varchar(32) not null unique,
urAdress varchar(32) not null,
phoneNumber varchar(16) not null unique
  constraint  check_phoneNumber check (phoneNumber in ('+','1','2','3','4','5','6','7','8','9','0'))
);

create table viewofproduct
(
id_view int(4) auto_increment primary key,
nameofproduct varchar(32) not null,
id_type int(4),
foreign key (id_type) references type_of_tovar (id_type) on delete cascade,
id_izg int(4),
foreign key (id_izg) references manufactor(id_izg) on delete cascade,
id_quality int(4),
foreign key (id_quality) references quality(id_quality) on delete cascade
); 

create table product
(
id_product int(4) auto_increment primary key,
id_view int(4),
foreign key (id_view) references viewofproduct (id_view) on delete cascade
); 
