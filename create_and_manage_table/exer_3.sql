/*
# 课后练习
 */
# 1. 创建数据库 test03_company
CREATE DATABASE IF NOT EXISTS test03_company;

SHOW DATABASES;

USE test03_company;

# 2. 创建表 offices
CREATE TABLE IF NOT EXISTS offices
(
    office_code INT,
    city        VARCHAR(30),
    address     VARCHAR(50),
    country     VARCHAR(50),
    postal_code VARCHAR(25)
);

DESC offices;

# 3. 创建表 employees
CREATE TABLE IF NOT EXISTS employees
(
    emp_num    INT,
    last_name  VARCHAR(50),
    first_name VARCHAR(50),
    mobile     VARCHAR(25),
    `code`     INT,
    job_title  VARCHAR(50),
    birth      DATE,
    note       VARCHAR(255),
    sex        VARCHAR(5)
);

DESC employees;

# 4. 将表 employees 的 mobile 字段修改到 code 字段后面
ALTER TABLE employees
    MODIFY mobile VARCHAR(25) AFTER `code`;

DESC employees;

# 5. 将表 employees 的 birth 字段改名为 birthday
ALTER TABLE employees
    CHANGE birth birthday DATE;

DESC employees;

# 6. 修改 sex 字段，数据类型为 char(1)
ALTER TABLE employees
    MODIFY sex CHAR(1);

DESC employees;

# 7. 删除字段 note
ALTER TABLE employees
    DROP COLUMN note;

DESC employees;

# 8. 增加字段名 favorite_activity，数据类型为 VARCHAR(100)
ALTER TABLE employees
    ADD COLUMN favorite_activity VARCHAR(100);

DESC employees;

# 9. 将表 employees 的名称修改为 employees_info
RENAME TABLE employees TO employees_info;

SHOW TABLES FROM test03_company;
