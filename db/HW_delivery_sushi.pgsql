CREATE DATABASE delivery_sushi;

CREATE TABLE sushi (
    id SERIAL PRIMARY KEY,
    name_sushi VARCHAR (50) NOT NULL,
    weight REAL NOT NULL,
    price DECIMAL (7,2)
);

INSERT INTO sushi (name_sushi, weight, price) 
VALUES
    ('Сяке', 200.0, 160.00),
    ('Креветки', 150.0, 220.00),
    ('Тунець', 180.0, 250.00),
    ('Лосось', 220.0, 240.00),
    ('Нігірі', 100.0, 90.00),
    ('Масаго', 200.0, 130.00),
    ('Рол з куркою', 250.0, 140.00),
    ('Сет "Універсальний"', 500.0, 400.00),
    ('Фурукаке', 150.0, 110.00),
    ('Суші з вугром', 120.0, 200.00),
    ('Рол з лососем', 250.0, 200.00),
    ('Рол з тунцем', 250.0, 210.00),
    ('Спайсі креветки', 200.0, 230.00),
    ('Нігірі з лососем', 120.0, 150.00),
    ('Темпура з овочами', 200.0, 160.00),
    ('Каліфорнія з крабом', 300.0, 190.00),
    ('Суші з куркою', 180.0, 130.00),
    ('Рол "Текка" з тунцем', 200.0, 170.00),
    ('Сет "Романтичний"', 600.0, 500.00),-- виручку за день
    id SERIAL PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    tel CHAR(13) NOT NULL UNIQUE CHECK (tel LIKE '+380_________')
);

INSERT INTO customers (first_name, last_name, tel) 
VALUES
    ('Сергій', 'Нечитайло', '+380501234571'),
    ('Тетяна', 'Лисенко', '+380501234572'),
    ('Дмитро', 'Шевченко', '+380501234573'),
    ('Катерина', 'Сердюк', '+380501234574'),
    ('Олег', 'Тимошенко', '+380501234575'),
    ('Анастасія', 'Павленко', '+380501234576'),
    ('Юрій', 'Гончар', '+380501234577'),
    ('Вікторія', 'Супрун', '+380501234578'),
    ('Андрій', 'Козак', '+380501234579'),
    ('Оксана', 'Куліш', '+380501234580'),
    ('Ірина', 'Панченко', '+380501234581'),
    ('Станіслав', 'Климчук', '+380501234582'),
    ('Світлана', 'Ковалевська', '+380501234583'),
    ('Максим', 'Гусак', '+380501234584'),
    ('Людмила', 'Печерська', '+380501234585'),
    ('Денис', 'Соловей', '+380501234586'),
    ('Ольга', 'Терещенко', '+380501234587'),
    ('Тимур', 'Федоренко', '+380501234588'),
    ('Аліна', 'Дяченко', '+380501234589'),
    ('Вадим', 'Саприкін', '+380501234590');

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customers(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    date TIMESTAMP NOT NULL CHECK (date <= CURRENT_TIMESTAMP) DEFAULT CURRENT_TIMESTAMP,
    delivery_address VARCHAR (200) NOT NULL,
    status VARCHAR (20) NOT NULL CHECK (status IN ('pending', 'delivered'))   
);

INSERT INTO orders (customer_id, date, delivery_address, status) 
VALUES
    (5, '2023-09-01 10:00:00', 'вул. Зелена, 12', 'delivered'),
    (6, '2023-08-15 14:30:00', 'вул. Синя, 8', 'delivered'),
    (7, '2023-07-20 18:00:00', 'вул. Червона, 3', 'delivered'),
    (8, '2023-06-05 12:00:00', 'вул. Жовта, 4', 'delivered'),
    (9, '2023-05-25 16:45:00', 'вул. Білої, 6', 'delivered'),
    (10, '2023-04-10 19:15:00', 'вул. Чорна, 1', 'delivered'),
    (1, '2023-03-15 13:30:00', 'вул. Сірий, 2', 'delivered'),
    (2, '2023-02-22 15:00:00', 'вул. Фіолетова, 7', 'delivered'),
    (3, '2023-01-30 11:30:00', 'вул. Оранжева, 5', 'delivered'),
    (4, '2022-12-25 17:00:00', 'вул. Рожева, 9', 'delivered'),
    (11, '2024-01-01 09:00:00', 'вул. Квіткова, 15', 'delivered'),
    (12, '2024-01-05 14:30:00', 'вул. Лісова, 22', 'delivered'),
    (13, '2024-01-10 19:00:00', 'вул. Осіння, 11', 'delivered'),
    (14, '2024-01-15 12:15:00', 'вул. Сніжна, 4', 'delivered'),
    (15, '2024-01-20 18:45:00', 'вул. Липнева, 18', 'delivered'),
    (16, '2024-01-25 17:30:00', 'вул. Ясенева, 7', 'delivered'),
    (17, '2024-10-01 16:00:00', 'вул. Водна, 3', 'pending'),
    (18, '2024-10-01 15:00:00', 'вул. Весняна, 8', 'pending'),
    (19, '2024-10-01 10:30:00', 'вул. Зимова, 6', 'pending'),
    (20, '2024-10-01 13:00:00', 'вул. Осіння, 9', 'pending'); 

CREATE TABLE sushi_to_orders (
    id SERIAL PRIMARY KEY,
    sushi_id INTEGER NOT NULL REFERENCES sushi(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,  
    order_id INTEGER NOT NULL REFERENCES orders(id)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    quantity SMALLINT NOT NULL CHECK (quantity >= 1)
);

INSERT INTO sushi_to_orders (sushi_id, order_id, quantity) 
VALUES
    (1, 18, 2),  -- Рол з лососем для замовлення 18
    (2, 18, 1),  -- Рол з тунцем для замовлення 18
    (3, 19, 3),  -- Спайсі креветки для замовлення 19
    (4, 19, 1),  -- Нігірі з лососем для замовлення 19
    (5, 20, 2),  -- Темпура з овочами для замовлення 20
    (6, 20, 2),  -- Каліфорнія з крабом для замовлення 20
    (7, 21, 1),  -- Суші з куркою для замовлення 21
    (8, 21, 1),  -- Рол "Текка" з тунцем для замовлення 21
    (9, 22, 2),  -- Сет "Романтичний" для замовлення 22
    (10, 22, 3), -- Вегетаріанський сет для замовлення 22
    (11, 23, 1), -- Рол з лососем для замовлення 23
    (12, 23, 1), -- Рол з тунцем для замовлення 23
    (13, 24, 3), -- Спайсі креветки для замовлення 24
    (14, 25, 2), -- Нігірі з лососем для замовлення 25
    (15, 26, 4), -- Темпура з овочами для замовлення 26
    (16, 27, 2), -- Каліфорнія з крабом для замовлення 27
    (1, 28, 1),  -- Рол з лососем для замовлення 28
    (2, 29, 2),  -- Рол з тунцем для замовлення 29
    (3, 30, 1),  -- Спайсі креветки для замовлення 30
    (4, 31, 2),  -- Нігірі з лососем для замовлення 31
    (5, 32, 1),  -- Темпура з овочами для замовлення 32
    (6, 33, 1),  -- Каліфорнія з крабом для замовлення 33
    (1, 34, 3),  -- Рол з лососем для замовлення 34
    (2, 35, 2),  -- Рол з тунцем для замовлення 35
    (3, 36, 1),  -- Спайсі креветки для замовлення 36
    (4, 37, 2);  -- Нігірі з лососем для замовлення 37

-- склад та вартість (певного) замовлення
SELECT c.first_name, c.last_name, c.tel, o.date, o.delivery_address, o.status, SUM (sto.quantity*s.price) AS cost_order
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
    INNER JOIN customers c ON c.id=o.customer_id
GROUP BY c.first_name, c.last_name, c.tel, o.date, o.delivery_address, o.status;
    
-- перелік замовлень на сьогодні
SELECT c.first_name, c.last_name, c.tel, o.date, o.delivery_address, o.status, SUM (sto.quantity*s.price) AS cost_order
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
    INNER JOIN customers c ON c.id=o.customer_id
WHERE DATE (o.date) = CURRENT_DATE
GROUP BY c.first_name, c.last_name, c.tel, o.date, o.delivery_address, o.status;

-- перелік замовлень за певний тиждень
SELECT c.first_name, c.last_name, c.tel, o.date, o.delivery_address, o.status, SUM (sto.quantity*s.price) AS cost_order
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
    INNER JOIN customers c ON c.id=o.customer_id
WHERE o.date BETWEEN '2024-01-01' AND '2024-01-20 '
GROUP BY c.first_name, c.last_name, c.tel, o.date, o.delivery_address, o.status;

-- виручку за день
SELECT SUM (sto.quantity*s.price) AS cost_order
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
WHERE o.date BETWEEN '2024-10-01 00:00:00' AND '2024-10-02 00:00:00';

-- виручку за місяць (сума всіх замовлень за місяць)
SELECT SUM (sto.quantity*s.price) AS cost_order
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
WHERE EXTRACT(YEAR FROM o.date) = 2023 AND EXTRACT(MONTH FROM o.date) = 9; 

-- список клієнтів, які обслуговувалися цього місяця
SELECT c.first_name, c.last_name, o.date
FROM customers c
    INNER JOIN orders o ON c.id=o.customer_id
WHERE EXTRACT(YEAR FROM o.date) = 2024 AND EXTRACT(MONTH FROM o.date) = 10;

-- топ 3 страв на місяць
SELECT s.name_sushi
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
WHERE EXTRACT(YEAR FROM o.date)=2024 AND EXTRACT(MONTH FROM o.date) = 10
ORDER BY sto.quantity DESC
LIMIT 3;

-- Ваш прибуток від продажу за місяць, за умови, що Ваш застосунок отримує 3% від суми замовлення
SELECT SUM(s.price*sto.quantity*0.03)
FROM orders o 
    INNER JOIN sushi_to_orders sto ON o.id=sto.order_id
    INNER JOIN sushi s ON s.id=sto.sushi_id
WHERE EXTRACT(YEAR FROM o.date)=2024 AND EXTRACT(MONTH FROM o.date) = 10






























