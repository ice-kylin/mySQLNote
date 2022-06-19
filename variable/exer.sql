/*
# 课后练习
 */
# 0. 准备工作
CREATE DATABASE test16_var_cur;

USE test16_var_cur;

CREATE TABLE employees
AS
SELECT *
    FROM
        atguigudb.employees;

CREATE TABLE departments
AS
SELECT *
    FROM
        atguigudb.departments;

# 无参有返回
# 1. 创建函数 get_count()，返回公司的员工个数
DELIMITER //

CREATE FUNCTION get_count()
    RETURNS INT
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                COUNT(*)
                FROM
                    employees);
END //

DELIMITER ;

SELECT
    get_count()
    FROM
        dual;

# 有参有返回
# 2. 创建函数 e_name_salary()，根据员工姓名，返回它的工资
DELIMITER //

CREATE FUNCTION e_name_salary(e_name VARCHAR(25))
    RETURNS DOUBLE
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                salary
                FROM
                    employees
                WHERE
                    last_name = e_name
                LIMIT 0, 1);
END //

DELIMITER ;

SELECT
    e_name_salary('Abel')
    FROM
        dual;

# 3. 创建函数 dept_sal()，根据部门名，返回该部门的平均工资
DELIMITER //

CREATE FUNCTION dept_sal(d_name VARCHAR(25))
    RETURNS DOUBLE
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                AVG(IFNULL(e.salary, NULL))
                FROM
                    employees e
                        RIGHT JOIN departments d ON e.department_id = d.department_id
                WHERE
                    d.department_name = d_name);
END //

DELIMITER ;

SELECT
    dept_sal('Marketing')
    FROM
        dual;

# 4. 创建函数 add_float()，实现传入两个 float，返回二者之和
DELIMITER //

CREATE FUNCTION add_float(f1 FLOAT, f2 FLOAT)
    RETURNS FLOAT
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                f1 + f2
                FROM
                    dual);
END //

DELIMITER ;

SELECT
    add_float(12.2, 2.3)
    FROM
        dual;
