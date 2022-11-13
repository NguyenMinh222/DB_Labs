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

    d) CROSS JOIN
    
use mainshop;
SELECT authorization.Name, zakazchik.id_zakazchik, zakazchik.email
FROM authorization
CROSS JOIN zakazchik;

3. a) Group By

SELECT COUNT(id_author), Name
FROM authorization
GROUP BY Name
ORDER BY COUNT(id_author) DESC;
 
   b) Having

SELECT COUNT(id_author), Name
FROM authorization
GROUP BY Name
Having COUNT(id_author) > 1;
 
   c) Union

SELECT email FROM zakazchik
UNION
SELECT email FROM contact
ORDER BY email;

4. a) EXISTS
SELECT INN
FROM postavshchik
WHERE EXISTS (SELECT price FROM priceofproduct 
WHERE priceofproduct.id_post = postavshchik.id_post AND Price < 60);

    b)CASE 
SELECT id_price, price,
CASE
    WHEN price > 100 THEN 'The price is greater than 100'
    WHEN price < 100 THEN 'The price is less than 100'
    ELSE 'The price is 100'
END AS priceText
FROM priceofproduct;
