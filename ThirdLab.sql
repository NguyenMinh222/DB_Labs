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
passportNumber varchar(16) unique,
dateRelease date not null ,
validUntil date not null
 );
 
create table contact
(
id_contact int(4) auto_increment primary key,
email varchar(32) not null unique,
urAdress varchar(32) not null,
phoneNumber varchar(16) not null unique
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

create table ip
(
id_ip int(4) auto_increment primary key,
id_contact int(4),
foreign key (id_contact) references contact (id_contact) on delete cascade
); 

create table organization_name 
(
 id_org int(4) auto_increment primary key,
 organization_name varchar(32) not null unique,
 id_contact int(4), foreign key (id_contact) references contact (id_contact) on delete cascade
 );
 
 create table postavshchik
(
id_post int(4) auto_increment primary key,
id_author int(4),
foreign key (id_author) references authorization (id_author) on delete cascade,
id_passport int(4),
foreign key (id_passport) references passport (id_passport) on delete cascade,
id_status_org int(4),
foreign key (id_status_org) references organization_name (id_org) on delete cascade,
id_status_ip int(4),
foreign key (id_status_ip) references ip (id_ip) on delete cascade,
INN  varchar(16) not null unique,
checkingAcc varchar(16) not null unique
);

create table zakazchik
(
id_zakazchik int(4) auto_increment primary key,
email varchar(32) not null unique,
id_author int(4),
foreign key (id_author) references authorization (id_author) on delete cascade,
id_passport int(4),
foreign key (id_passport) references passport (id_passport) on delete cascade
);

create table user
(
id_user int(4) auto_increment primary key,
id_post int(4),
foreign key (id_post) references postavshchik (id_post) on delete cascade,
id_zakazchik int(4),
foreign key (id_zakazchik) references zakazchik (id_zakazchik) on delete cascade
);

create table priceofproduct
(
id_price int(4) auto_increment primary key,
id_product int(4),
foreign key (id_product) references product (id_product) on delete cascade,
price int(16) not null,
constraint positive_price check (price>=0),
id_post int(4),
foreign key (id_post) references postavshchik (id_post) on delete cascade
);

create table log
(
id_log int(4) auto_increment primary key,
id_author int(4),
foreign key (id_author) references authorization (id_author) on delete cascade,
Date_Time timestamp,
Actions varchar(64)
);

create table zakaz
(
id_zakaz int(4) auto_increment primary key,
id_zakazchik int(4),
foreign key (id_zakazchik) references zakazchik (id_zakazchik) on delete cascade,
Product_Description varchar(64) not null,
Place_of_delivery varchar(32) not null,
Price_of_delivery int(16),
constraint positive_Price_of_delivery check (Price_of_delivery >=0),
Sum int(16) not null,
constraint positive_Sum check (Sum >=0)
);
