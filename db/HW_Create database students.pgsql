-- Створення таблиці

-- Створити базу даних та таблицю за наступною схемою:
-- STUDENTS(id, first_name, last_name, birthday, phone_number, group, avg_mark, gender, entered_at, department)
-- Продумати типи даних та обмеження для зазначених полів (стовпців).


CREATE DATABASE students;

      CREATE TABLE students (
      id SERIAL PRIMARY KEY, 
      first_name VARCHAR(20) NOT NULL, 
      last_name VARCHAR(40) NOT NULL, 
      birthday DATE NOT NULL CHECK(birthday <= CURRENT_DATE), 
      phone_number CHAR(13) UNIQUE NOT NULL 
CHECK(phone_number LIKE'0__-___-__-__'), 
      group_number CHAR(3) NOT NULL, 
      avg_mark REAL NOT NULL, 
      is_mail BOOLEAN , 
      entered_at DATE NOT NULL 
CHECK(entered_at<=CURRENT_DATE), 
      department VARCHAR(40) NOT NULL, CHECK(department<>'')
      );

        -- Заповнити таблиці тестовими даними.

      INSERT INTO students (first_name, last_name, birthday, phone_number, group_number, avg_mark, is_mail, entered_at, department)
      VALUES ('Anna', 'Ivanova', '2001-03-15', '068-111-22-33', '101', 4.5, FALSE, '2019-09-01', 'Engineering'),
             ('Maksym', 'Petrenko', '2000-05-21', '063-222-33-44', '101', 3.9, TRUE, '2019-09-01', 'Engineering'),
             ('Oksana', 'Sidorova', '2002-01-10', '098-333-44-55', '102', 4.8, FALSE, '2020-09-01', 'Philology'),
             ('Vasya', 'Kozak', '2001-11-30', '067-444-55-66', '102', 4.0, TRUE, '2020-09-01', 'Philology'),
             ('Daria', 'Grishchenko', '2003-07-22', '096-555-66-77', '201', 4.2, FALSE, '2021-09-01', 'Computer Science'),
             ('Ivan', 'Shcherbak', '2000-09-05', '067-666-77-88', '201', 3.5, TRUE, '2021-09-01', 'Computer Science'),
             ('Kateryna', 'Bondarenko', '2001-12-15', '098-777-88-99', '202', 4.7, FALSE, '2021-09-01', 'Economics'),
             ('Anton', 'Antonov', '2000-04-04', '098-888-99-00', '202', 3.8, TRUE, '2021-09-01', 'Economics'),
             ('Viktoria', 'Koval', '2002-08-18', '098-999-00-11', '301', 4.1, FALSE, '2022-09-01', 'Law'),
             ('Andriy', 'Fedorov', '2000-10-10', '098-101-12-13', '301', 4.6, TRUE, '2022-09-01', 'Law'),
             ('Volodymyr', 'Kravchuk', '2003-06-12', '067-303-14-15', '302', 3.7, TRUE, '2022-09-01', 'Journalism'),
             ('Yulia', 'Shevchenko', '2005-07-30', '098-404-15-16', '401', 4.9, FALSE, '2023-09-01', 'Mathematics'),
             ('Artem', 'Holovko', '2005-09-18', '063-505-16-17', '401', 3.6, TRUE, '2023-09-01', 'Mathematics'),
             ('Natalia', 'Palamar', '2005-03-03', '098-606-17-18', '402', 4.0, FALSE, '2023-09-01', 'Biology'),
             ('Ihor', 'Semykin', '2005-12-01', '098-707-18-19', '402', 3.8, TRUE, '2023-09-01', 'Biology'),
             ('Valeria', 'Markova', '2006-05-15', '050-808-19-20', '501', 4.4, FALSE, '2024-09-01', 'Chemistry'),
             ('Yevhen', 'Shevtsov', '2006-08-22', '098-909-20-21', '501', 3.9, TRUE, '2024-09-01', 'Chemistry'),
             ('Alina', 'Lysenko', '2006-01-14', '063-012-21-22', '502', 4.5, FALSE, '2024-09-01', 'Physics'),
             ('Mykola', 'Romanenko', '2006-04-07', '098-123-22-23', '502', 4.7, TRUE, '2024-09-01', 'Physics');

-- Отримати інформацію про студентів (ім'я+прізвище *через пробіл, дата народження) 
-- у порядку від найстаршого до наймолодшого.

SELECT first_name ||' '|| last_name AS name, birthday
FROM students
ORDER BY birthday;

-- Отримати список шифрів груп, що не повторюються.

SELECT DISTINCT group_number
FROM students;

-- Отримати рейтинговий список студентів (ім'я (*або ініціал)+прізвище, середній бал): 
-- спочатку студентів із найвищим середнім балом, наприкінці з найменшим.

SELECT first_name ||' '|| last_name AS name, avg_mark
FROM students
ORDER BY avg_mark DESC;

-- Отримати другу сторінку списку студентів під час перегляду по 6 студентів на сторінці.

SELECT *
FROM students
ORDER BY id
LIMIT 6 OFFSET 6;

-- Отримати список 3-х найуспішніших студентів (ім'я, прізвище, середній бал, група).

SELECT first_name, last_name, avg_mark, group_number
FROM students
ORDER BY avg_mark DESC
LIMIT 3;

-- * Отримати інфо про студентів (ініціал+прізвище, номер телефону), де номер телефону буде частково прихований 
-- та представлений у форматі: +38012******* (тобто видно код оператора, але не сам номер). 



-- Відобразити студентів на ім'я Anton та прізвище Antonov.

SELECT *
FROM students
WHERE first_name ='Anton'
  AND last_name = 'Antonov';

-- Відобразити студентів, які народилися в період із 2005 по 2008 рік.

SELECT *
FROM students
WHERE EXTRACT(YEAR FROM birthday) BETWEEN 2005 AND 2008;

-- Відобразити студентів на ім'я Mykola із середніми балами більше 4.5.

SELECT *
FROM students
WHERE first_name LIKE 'Mykola'
  AND avg_mark>=4.5;

-- *Відобразити студентів, які користуються послугами оператора Київстар. (тобто код 098 або 096 або ...)

SELECT *
FROM students
WHERE phone_number LIKE '098-___-__-__'
        OR phone_number LIKE '096-___-__-__'
        OR phone_number LIKE '068-___-__-__';

-- Для всіх студентів з ім'ям Vasya змінити написання імені Vasia.

UPDATE students
SET first_name='Vasia'
WHERE first_name='Vasya';

-- *Додати до таблиці стовпець з інформацією про номер студентського білету студента 
-- (2 букви - 5 цифр 1 буква: AA-00000A). Додати дані в цей стовпець (мінімум в один рядок).
 
ALTER TABLE students
ADD COLUMN student_ID_number CHAR (8) UNIQUE CHECK (student_ID_number~'^[A-Z]{2}\d{5}[A-Z]{1}$');

UPDATE students
SET student_ID_number='AA12345A'
WHERE id=1;

UPDATE students
SET student_ID_number='AS12346B'
WHERE id=2;

UPDATE students
SET student_ID_number='EF12347M'
WHERE id=3;

-- Видалити інформацію про студентів, що вступили 2020 року.

DELETE
FROM students
WHERE EXTRACT(YEAR from entered_at)=2020;