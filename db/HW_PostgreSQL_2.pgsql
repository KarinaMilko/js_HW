CREATE DATABASE courses_and_students;

DROP TABLE exams
DROP TABLE students
DROP TABLE courses

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR (50) NOT NULL,
    description VARCHAR(100),
    hours REAL NOT NULL CHECK(hours>0)
);

INSERT INTO courses (title, description, hours) 
VALUES
('Математика', 'Основи математичного аналізу', 60),
('Фізика', 'Основи класичної механіки', 45),
('Хімія', 'Основи органічної хімії', 30),
('Біологія', 'Введення в біологічні науки', 40),
('Інформатика', 'Програмування на Python', 50),
('Мистецтво', 'Історія мистецтв', 30),
('Література', 'Сучасна українська література', 35),
('Історія', 'Історія України', 40);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthday date NOT NULL CHECK(birthday<CURRENT_DATE),
    phone_number CHAR(13),
    group_name CHAR(3) NOT NULL,
    gender CHAR(1),
    entered_at date NOT NULL CHECK(entered_at<CURRENT_DATE),
    department VARCHAR(50) NOT NULL
);

INSERT INTO students (first_name, last_name, birthday, phone_number, group_name, gender, entered_at, department) 
VALUES
('Іван', 'Петров', '2001-05-14', '+380501234567', '101', 'M', '2020-09-01', 'Комп’ютерні науки'),
('Олена', 'Сидорова', '2000-12-20', '+380502345678', '101', 'F', '2021-09-01', 'Фізика'),
('Андрій', 'Коваленко', '2001-07-10', '+380503456789', '101', 'M', '2022-09-01', 'Хімія'),
('Наталія', 'Іванова', '2000-03-30', '+380504567890', '101', 'F', '2020-09-01', 'Біологія'),
('Сергій', 'Степаненко', '2001-09-25', '+380505678901', '101', 'M', '2023-09-01', 'Математика'),
('Юлія', 'Гришко', '2000-11-11', '+380506789012', '102', 'F', '2020-09-01', 'Мистецтво'),
('Олег', 'Коваль', '2001-04-05', '+380507890123', '102', 'M', '2021-09-01', 'Література'),
('Анна', 'Федорова', '2000-06-17', '+380508901234', '102', 'F', '2022-09-01', 'Історія'),
('Віктор', 'Павленко', '2001-10-01', '+380509012345', '102', 'M', '2020-09-01', 'Комп’ютерні науки'),
('Софія', 'Кузьменко', '2001-08-15', '+380501234678', '103', 'F', '2021-09-01', 'Фізика'),
('Микола', 'Дмитренко', '2001-03-22', '+380502345789', '103', 'M', '2022-09-01', 'Хімія'),
('Ірина', 'Циганкова', '2000-02-19', '+380503456890', '103', 'F', '2023-09-01', 'Біологія'),
('Павло', 'Зінченко', '2001-01-30', '+380504567901', '104', 'M', '2020-09-01', 'Математика'),
('Людмила', 'Черненко', '2000-04-13', '+380505678012', '104', 'F', '2021-09-01', 'Мистецтво'),
('Євген', 'Бондаренко', '2001-05-25', '+380506789123', '104', 'M', '2022-09-01', 'Література'),
('Тетяна', 'Петрик', '2000-07-07', '+380507890234', '104', 'F', '2023-09-01', 'Історія'),
('Василь', 'Ткаченко', '2001-09-12', '+380508901345', '105', 'M', '2020-09-01', 'Комп’ютерні науки'),
('Катерина', 'Захарченко', '2001-02-28', '+380509012456', '105', 'F', '2021-09-01', 'Фізика'),
('Денис', 'Сушко', '2000-10-10', '+380501234789', '105', 'M', '2022-09-01', 'Хімія'),
('Оксана', 'Крут', '2001-11-18', '+380502345890', '105', 'F', '2023-09-01', 'Біологія'),
('Максим', 'Савченко', '2001-05-05', '+380503456901', '105', 'M', '2020-09-01', 'Математика'),
('Антон', 'Клименко', '2000-08-20', '+380504567012', '105', 'M', '2021-09-01', 'Мистецтво'),
('Яна', 'Гнатенко', '2001-04-30', '+380505678123', '106', 'F', '2022-09-01', 'Література'),
('Роман', 'Левченко', '2001-03-15', '+380506789234', '106', 'M', '2023-09-01', 'Історія'),
('Ольга', 'Мельник', '2000-12-25', '+380507890345', '106', 'F', '2020-09-01', 'Комп’ютерні науки'),
('Тимур', 'Бобров', '2001-07-21', '+380508901456', '106', 'M', '2021-09-01', 'Фізика'),
('Влада', 'Гордієнко', '2001-01-11', '+380509012567', '106', 'F', '2022-09-01', 'Хімія'),
('Артем', 'Шевченко', '2000-09-19', '+380501234890', '106', 'M', '2023-09-01', 'Біологія'),
('Діана', 'Савченко', '2001-05-14', '+380502345901', '107', 'F', '2020-09-01', 'Математика'),
('Станіслав', 'Гринь', '2000-12-01', '+380503456012', '107', 'M', '2021-09-01', 'Мистецтво'),
('Вікторія', 'Братко', '2001-02-25', '+380504567123', '107', 'F', '2022-09-01', 'Література'),
('Геннадій', 'Капустін', '2000-11-11', '+380505678234', '107', 'M', '2023-09-01', 'Історія');

CREATE TABLE exams(
id SERIAL PRIMARY KEY,
mark REAL CHECK(mark >= 0 AND mark <= 100),
id_stud INTEGER REFERENCES students(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
id_course INTEGER REFERENCES courses(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO exams (mark, id_stud, id_course) 
VALUES
(NULL, 1, 1),   -- Іван Петров, Математика (без оцінки)
(NULL, 1, 2),   -- Іван Петров, Фізика (без оцінки)
(85, 1, 3),     -- Іван Петров, Хімія (оцінка)
(NULL, 2, 1),   -- Олена Сидорова, Математика (без оцінки)
(90, 2, 2),     -- Олена Сидорова, Фізика (оцінка)
(NULL, 3, 3),   -- Андрій Коваленко, Хімія (без оцінки)
(78, 3, 1),     -- Андрій Коваленко, Математика (оцінка)
(95, 4, 2),     -- Наталія Іванова, Фізика (оцінка)
(NULL, 4, 4),   -- Наталія Іванова, Біологія (без оцінки)
(NULL, 5, 1),   -- Сергій Степаненко, Математика (без оцінки)
(88, 5, 3),     -- Сергій Степаненко, Хімія (оцінка)
(NULL, 6, 2),   -- Юлія Гришко, Фізика (без оцінки)
(76, 6, 4),     -- Юлія Гришко, Історія (оцінка)
(92, 7, 1),     -- Олег Коваль, Математика (оцінка)
(NULL, 7, 5),   -- Олег Коваль, Біологія (без оцінки)
(70, 8, 3),     -- Анна Федорова, Хімія (оцінка)
(NULL, 8, 2),   -- Анна Федорова, Фізика (без оцінки)
(85, 9, 4),     -- Віктор Павленко, Історія (оцінка)
(NULL, 9, 1),   -- Віктор Павленко, Математика (без оцінки)
(NULL, 10, 5),  -- Софія Кузьменко, Біологія (без оцінки)
(82, 10, 2),    -- Софія Кузьменко, Фізика (оцінка)
(NULL, 11, 1),  -- Микола Дмитренко, Математика (без оцінки)
(91, 11, 3),    -- Микола Дмитренко, Хімія (оцінка)
(NULL, 12, 4),  -- Ірина Циганкова, Історія (без оцінки)
(76, 12, 5),    -- Ірина Циганкова, Біологія (оцінка)
(94, 13, 2),    -- Павло Зінченко, Фізика (оцінка)
(NULL, 13, 1),   -- Павло Зінченко, Математика (без оцінки)
(NULL, 14, 3),   -- Людмила Черненко, Хімія (без оцінки)
(88, 14, 4),     -- Людмила Черненко, Історія (оцінка)
(NULL, 15, 2),   -- Євген Бондаренко, Фізика (без оцінки)
(90, 15, 1),     -- Євген Бондаренко, Математика (оцінка)
(73, 16, 5),     -- Тетяна Петрик, Біологія (оцінка)
(NULL, 16, 4),   -- Тетяна Петрик, Історія (без оцінки)
(NULL, 17, 2),   -- Василь Ткаченко, Фізика (без оцінки)
(85, 17, 3),     -- Василь Ткаченко, Хімія (оцінка)
(NULL, 18, 1),   -- Катерина Захарченко, Математика (без оцінки)
(82, 18, 5),     -- Катерина Захарченко, Біологія (оцінка)
(90, 19, 3),     -- Денис Сушко, Хімія (оцінка)
(NULL, 19, 2),   -- Денис Сушко, Фізика (без оцінки)
(NULL, 20, 1),   -- Оксана Крут, Математика (без оцінки)
(88, 20, 4);     -- Оксана Крут, Історія (оцінка)

-- Реалізувати такі запити (звертайте увагу на те, що потрібно вивести):
-- Спойлер: 1 -  агрегатна функція MIN, 
-- 2 - групування GROUP BY + агрегатна функція COUNT, 
-- 3 - фільтрація WHERE + агрегатна функція COUNT

-- Відобразити, коли відбувся перший набір (мінімальний рік ступу).
SELECT min(entered_at)
FROM students;

-- Відобразити кількість студентів, які навчаються у кожній групі.
SELECT group_name, count(id)
FROM students
GROUP BY group_name
ORDER BY group_name;

-- Відобразити загальну кількість студентів, які вступили 2020 року.
SELECT count(id)
FROM students
WHERE EXTRACT (YEAR FROM entered_at)=2020;

-- *Відобразити середній вік студентів жіночої статі кожного факультету. 
-- Список впорядкувати за зменшенням віку. Стовпчик із середнім віком назвати avg_age.
SELECT  AVG(EXTRACT(YEAR FROM AGE(birthday))) AS avg_age,department 
FROM students
WHERE gender='F'
GROUP BY department
ORDER BY avg_age DESC;

-- (З’єднання таблиць:)

-- Відобразити імена та прізвища студентів та назви курсів, що ними вивчаються.
SELECT s.first_name || ' ' || s.last_name AS student, title, description
FROM students s 
    LEFT JOIN exams e ON s.id=e.id_stud
    LEFT JOIN courses c ON c.id=e.id_course;

-- Відобразити бали студента Віктор Павленко з дисципліни «Введення в біологічні науки».
SELECT s.first_name, s.last_name, c.description, e.mark
FROM students s
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course
WHERE s.first_name='Віктор' AND s.last_name='Павленко' AND c.description='Введення в біологічні науки';

-- Відобразити студентів, які мають бали нижче 90.
SELECT s.first_name || ' ' || s.last_name AS student, e.mark
FROM students s
    INNER JOIN exams e ON s.id=e.id_stud
WHERE e.mark < 90;

-- Відобразити студентів, які прослухали дисципліну «Програмування на Python» та мають за неї оцінку.
SELECT s.first_name || ' ' || s.last_name AS student, c.description, e.mark
FROM students s
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course
WHERE c.description='Програмування на Python' AND e.mark>0;

-- Відобразити середній бал та кількість курсів, які відвідав кожен студент.
SELECT s.first_name || ' ' || s.last_name AS student, AVG(e.mark), count(c.id)
FROM students s
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course
GROUP BY student;

-- Відобразити студентів, які мають середній бал вище 90.
SELECT s.first_name || ' ' || s.last_name AS student, AVG(e.mark) AS avg_mark
FROM students s
   INNER JOIN exams e ON s.id=e.id_stud
GROUP BY student
HAVING AVG(e.mark)>90;

-- *Відобразити дисципліни, які ще не прослухав жоден студент.
SELECT c.title
FROM students s
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course
WHERE mark IS NOT NULL;

-- (Підзапити:)

-- Отримати список студентів, у яких день народження збігається 
-- із днем народження Микола Дмитренко.
SELECT *
FROM students
WHERE EXTRACT(YEAR FROM birthday) IN (
   SELECT EXTRACT(YEAR FROM birthday) 
   FROM students
   WHERE first_name = 'Микола' AND last_name = 'Дмитренко' 
);

-- Відобразити студентів, які мають середній бал вище, ніж Микола Дмитренко.
SELECT first_name, last_name, avg(mark)
FROM students s INNER JOIN exams e ON s.id=e.id_stud
GROUP BY first_name, last_name
HAVING avg(mark) > (
    SELECT avg(mark)
    FROM students s INNER JOIN exams e ON s.id=e.id_stud
    WHERE s.first_name = 'Микола' AND s.last_name = 'Дмитренко'
);

-- Отримати список предметів, у яких кількість годин більше, 
-- ніж у "Фізика".
SELECT title
FROM courses
WHERE hours > (
    SELECT hours
    FROM courses
    WHERE title = 'Фізика'
);

-- Отримати список
-- студент | предмет | оцінка
-- де оцінка має бути більшою за будь-яку оцінку Микола Дмитренко.
SELECT s.first_name, s.last_name, c.title, e.mark
FROM students s 
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course
WHERE e.mark > (
        SELECT max(mark)
        FROM exams e INNER JOIN students s ON s.id=e.id_stud
        WHERE first_name = 'Микола' AND last_name = 'Дмитренко'
    );

-- *Отримати перелік студентів, які ще не вивчали жодного предмету 
-- (спробуйте це зробити різними способами).
SELECT first_name, last_name, description
FROM students s 
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course
WHERE mark IS NOT NULL;

-- (Умовні вирази:)

-- Вивести
-- студент | предмет | оцінка
-- щоб оцінка виводилася у літерному вигляді "відмінно", "добре" або "задовільно".
-- (за шкалою переведення, наприклад, 
-- 	0-59 – незадовільно	
-- 60-74 б – задовідно
-- 75-89 б – добре
-- 90-100 б – відмінно)

SELECT s.first_name || ' ' || s.last_name AS name, c.description, 
    CASE
        WHEN e.mark BETWEEN 0 AND 59 THEN 'незадовільно'
        WHEN e.mark BETWEEN 60 AND 74 THEN 'задовільно'
        WHEN e.mark BETWEEN 75 AND 89 THEN 'добре'
        WHEN e.mark BETWEEN 90 AND 100 THEN 'відмінно'
    END 
FROM students s 
    INNER JOIN exams e ON s.id=e.id_stud
    INNER JOIN courses c ON c.id=e.id_course;
