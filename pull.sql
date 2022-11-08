//operator distinct, in, not in
use mainshop;
select distinct nameofproduct from viewofproduct;

select * from viewofproduct
where id_view in (2);

select * from viewofproduct
where id_view not in (2);

//operator between,not between
use mainshop;
select * from priceofproduct
where price between 65 and 1125;	

select * from priceofproduct
where price not between 65 and 1125;	

//operator like,not like
use mainshop;
select * from authorization
where Name like '%sha'; 

select * from authorization
where Name not like 'M%'; 

//operator regexp
use mainshop;

select * from contact
where phoneNumber regexp '94';

//operator is null
use mainshop;
select * from log 
where Date_Time is null;

//operator order by , desc
use mainshop;
select * from passport
order by dateRelease;

select * from passport
order by passportNumber desc;

//operator limit
use mainshop;
select * from priceofproduct
limit 2, 3;
