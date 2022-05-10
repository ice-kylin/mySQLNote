/*
# 课后练习
 */
USE test15_pro_func;

CREATE TABLE employees
AS
SELECT *
    FROM
        atguigudb.employees;

DESC employees;

CREATE TABLE departments
AS
SELECT *
    FROM
        atguigudb.departments;

DESC departments;

# 1. 创建函数 get_count()，返回公司的员工个数
# 无参有返回
DELIMITER //

CREATE FUNCTION get_count()
    RETURNS INT
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

# 2. 创建函数 ename_salary()，根据员工姓名，返回它的工资
# 有参有返回
DELIMITER //

CREATE FUNCTION ename_salary(l_name VARCHAR(25))
    RETURNS DOUBLE(8, 2)
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                salary
                FROM
                    employees
                WHERE
                    last_name = l_name);
END //

DELIMITER ;

SELECT
    ename_salary('Abel')
    FROM
        dual;

# 3. 创建函数 dept_sal()，根据部门名，返回该部门的平均工资
DELIMITER //

CREATE FUNCTION dept_sal(d_name VARCHAR(30))
    RETURNS DOUBLE(8, 2)
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                AVG(IFNULL(e.salary, 0))
                FROM
                    employees e
                        JOIN departments d ON e.department_id = d.department_id
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
    RETURN (f1 + f2);
END;

DELIMITER ;

SELECT
    add_float(233.33, 666.66)
    FROM
        dual;
