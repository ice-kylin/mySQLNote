/*
# 表的创建、修改和删除

## 创建表

- 需要用户具备创建表的权限
 */
USE atguigudb;
SHOW CREATE DATABASE atguigudb;
SHOW TABLES FROM atguigudb;

# 方式一
CREATE TABLE IF NOT EXISTS my_emp_1
(
    id        INT,
    emp_name  VARCHAR(15), # 使用 VARCHAR 来定义字符串，必须在使用 VARCHAR 时指明其长度
    hire_date DATE
);

# 查看表结构
DESC my_emp_1;

# 查看创建表的语句结构
SHOW CREATE TABLE my_emp_1;
# 如果创建表时没有指明使用的字符集，则默认使用表所在的数据库的字符集

# 查看表数据
SELECT *
    FROM
        my_emp_1;

# 方式二：基于现有的表创建新的表，同时导入数据
CREATE TABLE my_emp_2 AS
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees;

DESC my_emp_2;

SELECT *
    FROM
        my_emp_2;

/*
- 查询语句中字段的别名可以作为新创建的表的字段的名称
- 此时的查询语句结构可以比较丰富
 */
CREATE TABLE IF NOT EXISTS my_emp_3 AS
SELECT
    e.employee_id     AS emp_id,
    e.last_name       AS l_name,
    d.department_name AS dept_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id;

DESC my_emp_3;

SELECT *
    FROM
        my_emp_3;

# 创建一个表 emp_copy，实现对 employees 表的复制，包括表数据
CREATE TABLE IF NOT EXISTS emp_copy AS
SELECT *
    FROM
        employees;

DESC emp_copy;

SELECT *
    FROM
        emp_copy;

# 创建一个表 emp_blank，实现对 employees 表的复制，不包括表数据
CREATE TABLE IF NOT EXISTS emp_blank AS
SELECT *
    FROM
        employees
    WHERE
        FALSE;

DESC emp_blank;

SELECT *
    FROM
        emp_blank;
