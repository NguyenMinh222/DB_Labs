1. a)
use mainshop;
select Login, Password 
from authorization 
where Name like '%sha' and  id_author>2;

b) Получаем поле содержащее максимальную сумму
select * from zakaz 
where Sum = (select max(Sum) from zakaz);

c)
select * from priceofproduct
where price between 50 and 100;

2. Join-запросы
   a) INNER JOIN
   
use mainshop;
SELECT zakazchik.id_zakazchik, passport.passportNumber
FROM zakazchik
INNER JOIN passport ON zakazchik.id_passport = passport.id_passport;
   
   b) LEFT OUTER JOIN
   
use mainshop;
SELECT zakazchik.id_zakazchik, passport.passportNumber
FROM passport
LEFT JOIN zakazchik ON passport.id_passport = zakazchik.id_passport
ORDER BY passport.passportNumber;
 
   c)  SELF JOIN
   
use mainshop;
SELECT A.Name AS UserName1, B.Name AS UserName2, A.Surname
FROM authorization A, authorization B
WHERE A.id_author <> B.id_author
AND A.Name = B.Name
ORDER BY A.Name;
