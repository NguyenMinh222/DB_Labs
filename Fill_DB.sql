//authorization
use shop;

insert authorization(Login, Password, Image, Surname, Name, Patronimyc)
values ('misha@gmail.com','123456', null, 'Nguyen','Misha', null)

insert authorization(Login, Password, Image, Surname, Name, Patronimyc)
values ('dasha@gmail.com','654321', null, 'Sadovskaya','Dasha', 'Olegovna')

//log
use shop;

insert log(id_author, Actions)
values (1, 'продал кофту')

insert log(id_author, Date_Time, Actions)
values (2, current_timestamp(),'купила кофту')

//contact
use shop;

insert contact(email, urAdress, phoneNumber)
values ('organization@mail.ru','ул. Машерова','+375257894523')

insert contact(email, urAdress, phoneNumber)
values ('individual@mail.ru','ул. В. Гостинец','+375258888899')

//ip
use shop;

insert ip(id_contact)
values (2)

//organization_name
use shop;

insert organization_name(organization_name, id_contact)
values ('ОАО Аист',1)

//passport
use mainshop

insert passport(passportNumber, dateRelease, validUntil)
values ('VC51358','22.10.2000','10.12.2022')

insert passport(passportNumber, dateRelease, validUntil)
values ('MC15684','12.10.2000','12.12.2022')

//postavshchik
use mainshop;

insert postavshchik(id_author,id_passport, id_status_ip, INN, checkingAcc)
values(1,1,1,'5165156165','1315618615353')

//zakazchik
use mainshop;

insert zakazchik(email, id_author,id_passport)
values('dasha@gmail.com',2,2)

//user
use mainshop;

insert user(id_post)
values (1)

insert user(id_zakazchik)
values (1)

//zakaz
use mainshop

insert zakaz(id_zakazchik, Product_Description, Place_of_delivery, price_of_delivery,Sum)
values(1,'Кофта очень высокого качества. Сделано из не знаю чего, но все ок!','Белпочта',0,55)

//type_of_tovar
insert type_of_tovar(type_of_tovar)
values ('Женская верхняя одежда')
 
//manufactor
insert manufactor(manufactor,adress,telephoneNumber)
values('ABFactory','Немига 23','+333333333')

//quality
 insert quality(quality)
 values('хорошее')
 
 //viewofproduct
 insert viewofproduct(nameofproduct,id_type,id_izg,id_quality)
 values('Кофта осенняя',1,1,1)
 
 //product
 insert product(id_view)
values(1)

//proceofproduct
 
insert priceofproduct(id_product,price,id_post)
values(1,55,1)
