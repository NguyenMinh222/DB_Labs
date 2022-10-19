# Продажа товаров (Одежды)
Нгуен Ба Куанг Минь, гр. 053503

# Функциональные требования к проекту

## Роль пользователей 
   1. Поставщик (Продавец)
   2. Заказчик (Покупатель)
   
## Авторизация пользователя
   1. Зарегистрироваться с помощью электронной почты
   2. Войти/выйти в/из аккаунт(а)
 
## Возможности пользователей 
    1. Поставщика
       * Регистрация на сайт
       * Войти и выйти из своего аккаунта
       * Создание, редактирование, обновление, удаление страницы/товаров
       * Подтвердить или отклонить заявку на заказ
       * Отвечать на отзывы
       * Журналирование действий
       
    2. Покупателя   
       * Регистрация на сайт
       * Войти и выйти из своего аккаунта
       * Создание, редактирование, обновление, удаление страницы (информации)
       * Делать заказ
       * Сохранить/удалять товары в/из корзину
       * Оценить продавца/организацию
       * Оставлять отзыв
       * Журналирование действий
    
 ## Описание схемы
  
 - UserRole (Свзяь с сущностями "Заказчик" и "Поставщик" с типом связи - one to one)
   - ID - уникальный индификатор (тип: int(4); ограничение: обязательное поле)
   - ID_Post - внешний ключ к "Поставщик" (тип: int(16); ограничение: обязательное поле)
   - ID_Zakazchika - внешний ключ к "Заказчик" (тип: int(16); ограничение: обязательное поле)
 
 - Поставщик (Связь с сущностями "PriceOfTovar" с типом связи - one to many, "Организация" ; "ИП" , "Паспорт" и "UserRole" с типом свзяи - one to one)
   1. Id_Post - уникальный индификатор пользователя, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Статус (ID_Org, ID_IP) - описание того, кем является пользователь: продавцом в организации или ИП (тип: varchar(32) ; ограничение: обязательное поле для выборки, внешний ключ)
   3. ИНН - индентификационный номер налогоплательщика (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод символов и букв)
   4. Расчетный счет - банковский счет пользователя (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод символов и букв)
   5. ID_Passport - внешний ключ (тип: int(16))
        
 - Организация (Связь с сущностью "Поставщик" с типом связи - one to many)
   1. Id_Org - уникальный индификатор организации , первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Название организации - имя организации (тип: varchar(64) ; ограничение: обязательное поле)
   3. ID_Contact - уникальный индификатор контакта, внешний ключ (тип: int (4); ограничение: обязательное поле)
        
 - ИП (Связь с сущностью "Поставщик" с типом связи - one to one)
   1. Id_Ip - уникальный индификатор предпринимателя , первичный ключ (тип: int(16); ограничение: обязательное поле)
   2. ID_Contact - уникальный индификатор контакта, внешний ключ (тип: int (4); ограничение: обязательное поле)
   
 - Contact 
   1. e-mail - почта предпринимателя (тип: varchar(32) ; ограничение: обязательное поле)
   2. Юр. адрес - адрес предпринимателя (тип: varchar(32) ; ограничение: обязательное поле)
   3. Номер телефона - (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод букв)
   4. ID_Contact - уникальный индификатор контакта, первичный ключ (тип: int (4); ограничение: обязательное поле)
        
 - Товар (Связь с сущностями "PriceOfTovar" с типом связи - one to many, "Вид товара" с типом связи - one to many)
   1. Id_Tovar - уникальный индификатор товара , первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Товар (ID_Vid) - имя товара, внешний ключ (тип: varchar(32) ; ограничение: обязательное поле)
   3. Поставщик - имя поставщика (тип: varchar(32) ; ограничение: обязательное поле)
        
 - Вид товара (Связь с сущностями "Тип товара" и "Завод изготовитель" с типом связи - one to many)
   1. Id_Vid - уникальный индификатор вида товара (int(4))
   2. Название товара - наименование товара (тип: varchar(32) ; ограничение: обязательное поле)
   3. Тип товара (ID_Type) - категория, к которой относится товар. Внешний ключ (тип: varchar(32) ; ограничение: обязательное поле)
   4. Завод изготовитель (ID_Izg) - название завода, выпустившего данный товар. Внешний ключ (тип: varchar(32) ; ограничение: обязательное поле)
  
 - Качество
   1. ID_Quality - уникальный индификаторб, первичный ключ (тип: int(4), ограничение: обязательное поле)
   2. Качество - состояние товара (тип: varchar(32) ; ограничение: обязательное поле)
        
 - Тип товара (Связь с сущностями "Вид товара" с типом связи - one to many)
   1. Id_Type - уникальный индификатор типа товара, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Тип товара - классификация товара(тип: varchar(64) ; ограничение: обязательное поле)
        
 - Завод изготовитель (Связь с сущностями "Вид товара" с типом связи - one to many)
   1. Id_Izg - уникальный индификатор завода изготовителя товара , первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Завод изготовитель - намеинование завода (тип: varchar(32) ; ограничение: обязательное поле)
   3. Адрес - адрес завода (тип: varchar(64) ; ограничение: обязательное поле)
   4. Телефон - телефон диспетчерской завода (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод букв)
        
 - Заказ (Связь с сущностями "Заказчик" с типом связи - one to many)
   1. Id_Zakaz - уникальный индификатор доступа заказа , первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. ФИО заказчика (ID_Zakazchika) - фио заказчика. Внешний ключ (тип: varchar(32) ; ограничение: обязательное поле)
   3. Описание товара - подробное описание товара, которое приобретают (тип: varchar(64) ; ограничение: обязательное поле)
   4. Место доставки - местоположение, куда доставят товар адрес организации (тип: varchar(32) ; ограничение: обязательное поле)
   5. Стоимость товара - сумма за доставку товара адрес организации (тип: int(16) ; ограничение: не допуск букв и других символов)
   6. Стоимость всего - сумма всего товара вместо с суммой доставки (тип: int(16) ; ограничение: не допуск букв и других символов)
        
 - Заказчик (Связь с сущностями "Заказ" и "UserRole" с типом связи - one to many, "Паспорт" и "UserRole" с типом свзяи - one to one)
   1. Id_Zakazchika - уникальный индификатор пользователя, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. e-mail - электронная/ые почты пользователя (тип: varchar(32) ; ограничение: обязательное поле)
   3. Image - фотка пользователя (тип: Image ; ограничение: нет)
   4. ID_Passport - внешний ключ (тип: int(16))
        
 - Паспорт (Связь с сущностями "Заказчик" и "Поставщик" с типом связи - one to one)
   1. ID_Passport - уникальный индификатор, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Дата выпуска - дата (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод букв и других символов кроме точки)
   3. Действителен до - срок годности паспорта (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод букв и других символов кроме точки)
   
 - Авторизация (Связь с сущностями "Поставщик" и "Заказчик" с типом связи - one to one )
   1. Логин - электронная почта своей учетной записи (тип: varchar(32) ; ограничение: обязательное поле)
   2. Пароль - набор букв или слова с числами для входа в свою учетную запись (тип: varchar(32) ; ограничение: обязательное поле)
   3. Image - фотка пользователя (тип: Image ; ограничение: нет)
   
 - FIO (связь с сущностями "Заказчик" и "Поставщик с типом связи - one to one, связь с сущностью "Log" - one to many)
   1. ID_FIO -уникальный индификатор, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. Фамилия - фамилия пользователя определенной длины (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод чисел)
   3. Имя - имя пользователя (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод чисел)
   4. Отчество - отчество пользователя (тип: varchar(32) ; ограничение: обязательное поле, запрет на ввод чисел)

 - Log (связь с сущностью "FIO" - one to many)
   1. ID_Log - уникальный индификатор, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. ID_FIO - уникальный индификатор, внешний ключ (тип: int(4); ограничение: обязательное поле)
   3. DateTime - время операции (тип: time; ограничений: нет)
   4. Action - какая операция была произведена (тип: varchar(32); ограничение: нет)
   
 - PriceOfTovar (связь с сущностями "Товар" и "Поставщик" с типом связи - one to many)
   1. ID_Price - уникальный индификатор, первичный ключ (тип: int(4); ограничение: обязательное поле)
   2. ID_Tovar - уникальный индификатор товара , внешний ключ (тип: int(4); ограничение: обязательное поле)
   3. ID_Post - уникальный индификатор пользователя, внешний ключ (тип: int(4); ограничение: обязательное поле)
   4. Цена - цена товара (тип: int(16); ограничение: обязательное поле, запрет на ввод букв)

![image](https://user-images.githubusercontent.com/79207246/195423698-0d7a4162-de06-4025-945e-dd26a9a28e33.png)

 ## Нормализованная схема
![БД(МБИ)](https://user-images.githubusercontent.com/79207246/196667784-8decc442-c546-4e29-abec-5dc289d72a32.png)



   
 Старая:
![image](https://user-images.githubusercontent.com/79207246/195278613-f7fea5a7-d1a1-4378-8ada-eb7b59425074.png)


