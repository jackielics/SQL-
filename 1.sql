-- Active: 1678698108483@@192.168.157.130@3306@test_db
/* 表: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id是该表的主键列。
该表的每一行包含一封电子邮件。电子邮件将不包含大写字母。
 

编写一个 SQL 删除语句来 删除 所有重复的电子邮件，只保留一个id最小的唯一电子邮件。

以 任意顺序 返回结果表。 （注意： 仅需要写删除语句，将自动对剩余结果进行查询）

查询结果格式如下所示。 */

CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(255)
);
INSERT INTO Person (id, email) VALUES
    (1, 'john@example.com'),
    (2, 'bob@example.com'),
    (3, 'john@example.com');

DROP TABLE Person;

/* 编写一个 SQL 删除语句来 删除 所有重复的电子邮件，只保留一个id最小的唯一电子邮件。
以 任意顺序 返回结果表。 */
delete from Person where id not in
(
    select id from 
    (
        select min(id) as id, count(*) as num from Person group by Email
    ) t
)

select * from Person

select RIGHT('hello',-1)

select MID('1234567890', 2) # 234567890

select user_id,concat(UPPER(substring(name,1,1)), LOWER(substr(name,2))) as name
from Users
ORDER BY user_id

select substr('user_id',1,1)

CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Salaries (
  employee_id INT PRIMARY KEY,
  salary INT
);

INSERT INTO Employees (employee_id, name)
VALUES
  (1, 'John'),
  (2, 'Crew'),
  (4, 'Haven'),
  (5, 'Kristian');

INSERT INTO Salaries (employee_id, salary)
VALUES
  (1, 22517),
  (4, 63539),
  (5, 76071);

/* 取出Employees和Salaries表中所有不重复的employee_id */
select distinct employee_id fro
WITH RECURSIVE cte (n) AS (
SELECT 1
UNION ALL
SELECT n + 1 FROM cte WHERE n < 8) SELECT * FROM cte;m Employees
union
select distinct employee_id from Salaries;

WITH RECURSIVE cte(n) AS (
    SELECT 2
    UNION ALL
    SELECT n + 1 FROM cte WHERE n < 8)
SELECT * FROM cte;