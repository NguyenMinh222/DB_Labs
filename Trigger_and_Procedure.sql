use mainshop;

//TRIGGER for priceofproduct
CREATE TRIGGER priceofproduct_BEFORE_INSERT BEFORE INSERT ON priceofproduct
FOR EACH ROW
BEGIN
if(new.price > 100)
then set new.price = new.price + new.price * 0.2; 
end if;
END

//For authorization and Log
CREATE TRIGGER authorization_AFTER_UPDATE AFTER UPDATE ON authorization
FOR EACH ROW
BEGIN
insert into log
set Actions = 'Update data',
id_log = id_log,
id_author = OLD.id_author,
Date_Time = now();
END

update authorization set Name = 'Daria' where Login =  'dasha12@gmail.com';
select * from log;
