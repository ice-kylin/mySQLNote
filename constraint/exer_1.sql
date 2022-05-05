/*
# 课后练习

## 练习 1
 */
CREATE DATABASE IF NOT EXISTS test04_emp;

USE test04_emp;

CREATE TABLE emp2
(
    id       INT,
    emp_name VARCHAR(15)
);

DESC emp2;

CREATE TABLE dept2
(
    id        INT,
    dept_name VARCHAR(15)
);

DESC dept2;

# 1. 向表 emp2 的 id 列中添加 PRIMARY KEY 约束
DESC emp2;

ALTER TABLE emp2
    ADD PRIMARY KEY (id);

DESC emp2;

# 2. 向表 dept2 的 id 列中添加 PRIMARY KEY 约束
DESC emp2;

ALTER TABLE dept2
    ADD PRIMARY KEY (id);

DESC emp2;

# 3. 向表 emp2 中添加列 dept_id，并在其中定义 FOREIGN KEY 约束，与之相关联的列是 dept2 表中的 id 列
DESC emp2;

ALTER TABLE emp2
    ADD COLUMN dept_id INT;

ALTER TABLE emp2
    ADD CONSTRAINT fk_emp2_dept_id FOREIGN KEY (dept_id) REFERENCES dept2 (id);

DESC emp2;

/*
## 练习 2
 */
USE test01_library;

# 1. 使用 ALTER 语句给 books 增加相应的约束
DESC books;

ALTER TABLE books
    MODIFY id INT(11) PRIMARY KEY AUTO_INCREMENT;

ALTER TABLE books
    MODIFY `name` VARCHAR(50) NOT NULL;

ALTER TABLE books
    MODIFY `authors` VARCHAR(100) NOT NULL;

ALTER TABLE books
    MODIFY price FLOAT NOT NULL;

ALTER TABLE books
    MODIFY pubdate YEAR NOT NULL;

ALTER TABLE books
    MODIFY num INT(11) NOT NULL;

DESC books;

/*
## 练习 3
 */
# 1. 创建数据库 test04_company
CREATE DATABASE IF NOT EXISTS test04_company;

USE test04_company;

# 2. 按照下表给出的表结构在 test04_company 数据库中创建两个数据表 offices 和 employees
CREATE TABLE IF NOT EXISTS offices
(
    office_code INT(10) PRIMARY KEY,
    city        VARCHAR(50) NOT NULL,
    address     VARCHAR(50),
    country     VARCHAR(50) NOT NULL,
    postal_code VARCHAR(15) UNIQUE
);

DESC offices;

CREATE TABLE IF NOT EXISTS employees
(
    employee_number INT(11) PRIMARY KEY AUTO_INCREMENT,
    last_name       VARCHAR(50) NOT NULL,
    first_name      VARCHAR(50) NOT NULL,
    mobile          VARCHAR(25) UNIQUE,
    office_code     INT(10)     NOT NULL,
    job_title       VARCHAR(50) NOT NULL,
    birth           DATETIME    NOT NULL,
    note            VARCHAR(255),
    sex             VARCHAR(5),
    CONSTRAINT fk_employees_office_code FOREIGN KEY (office_code) REFERENCES offices (office_code)
);

DESC employees;

# 3. 将表 employees 的 mobile 字段修改到 office_code 字段后面
ALTER TABLE employees
    MODIFY mobile VARCHAR(25) UNIQUE AFTER office_code;

DESC employees;

# 4. 将表 employees 的 birth 字段改名为 employee_birth
ALTER TABLE employees
    CHANGE birth employee_birth DATETIME NOT NULL;

DESC employees;

# 5. 修改 sex 字段，数据类型为 CHAR(1)，非空约束
ALTER TABLE employees
    MODIFY sex CHAR(1) NOT NULL;

DESC employees;

# 6. 删除字段 note
ALTER TABLE employees
    DROP note;

DESC employees;

# 7. 增加字段名 favorite_activity，数据类型为 VARCHAR(100)
ALTER TABLE employees
    ADD COLUMN favorite_activity VARCHAR(100);

DESC employees;

# 8. 将表 employees 名称修改为 employees_info
RENAME TABLE employees TO employees_info;

DESC employees_info;
