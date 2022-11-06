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
