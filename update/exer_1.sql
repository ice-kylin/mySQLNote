/*
# 课后练习
 */
# 1. 创建数据库 dbtest11

CREATE DATABASE IF NOT EXISTS dbtest11 CHARACTER SET 'utf8';

# 2. 运行以下脚本创建表 my_employees

USE dbtest11;

CREATE TABLE my_employees
(
    id         INT(10),
    first_name VARCHAR(10),
    last_name  VARCHAR(10),
    userid     VARCHAR(10),
    salary     DOUBLE(10, 2)
);

CREATE TABLE users
(
    id            INT,
    userid        VARCHAR(10),
    department_id INT
);

# 3. 显示表 my_employees 的结构
DESC my_employees;

# 4. 向 my_employees 表中插入数据
INSERT INTO
    my_employees(id, first_name, last_name, userid, salary)
    VALUES
        (1, 'patel', 'Ralph', 'Rpatel', 895),
        (2, 'Dancs', 'Betty', 'Bdancs', 860),
        (3, 'Biri', 'Ben', 'Bbiri', 1100),
        (4, 'Newman', 'Chad', 'Cnewman', 750),
        (5, 'Ropeburn', 'Audrey', 'Aropebur', 1550);

SELECT *
    FROM
        my_employees;

# 5. 向 users 表中插入数据
INSERT INTO
    users(id, userid, department_id)
    VALUES
        (1, 'Rpatel', 10),
        (2, 'Bdancs', 10),
        (3, 'Bbiri', 20),
        (4, 'Cnewman', 30),
        (5, 'Aropebur', 40);

SELECT *
    FROM
        users;

# 6. 将 3 号员工的 last_name 修改为 drelxer
UPDATE my_employees
SET
    last_name = 'drelxer'
    WHERE
        id = 3;

SELECT *
    FROM
        my_employees;

# 7. 将所有工资少于 900 的员工的工资修改为 1000
UPDATE my_employees
SET
    salary = 1000
    WHERE
        salary < 900;

SELECT *
    FROM
        my_employees;

# 8. 将 userid 为 Bbiri 的 user 表和 my_employees 表的记录全部删除
# 方式一
DELETE
    FROM
        users
    WHERE
        userid = 'Bbiri';

DELETE
    FROM
        my_employees
    WHERE
        userid = 'Bbiri';

# 方式二
DELETE m, u
    FROM
        my_employees m
            JOIN users u ON m.userid = u.userid
    WHERE
        m.userid = 'Bbiri';

# 9. 删除 my_employees、users 表所有数据
TRUNCATE TABLE my_employees;

TRUNCATE TABLE users;

# 10. 检查所作的修正
SELECT *
    FROM
        my_employees;

SELECT *
    FROM
        users;
