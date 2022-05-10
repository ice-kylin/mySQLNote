/*
# 存储函数
 */
USE dbtest15;

# 创建存储函数 email_by_name()，参数定义为空，该函数查询 Abel 的 email，并返回
DELIMITER $

CREATE FUNCTION email_by_name()
    RETURNS VARCHAR(25)
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                email
                FROM
                    emps
                WHERE
                    last_name = 'Abel');
END $

DELIMITER ;

SELECT
    email_by_name()
    FROM
        dual;

# 创建存储函数，名称为 email_by_id()，传入参数 emp_id，该函数查询 emp_id 的 email 并返回，数据类型为字符串类型
DELIMITER $

CREATE FUNCTION email_by_id(emp_id INT)
    RETURNS VARCHAR(25)
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                email
                FROM
                    emps
                WHERE
                    employee_id = emp_id);
END $

DELIMITER ;

SET @emp_id := 102;

SELECT
    email_by_id(@emp_id)
    FROM
        dual;

# 创建存储函数 count_by_id()，参数传入 dept_id，该函数查询 dept_id 部门的员工人数，并返回，数据类型为整型
DELIMITER $

CREATE FUNCTION count_by_id(dept_id INT)
    RETURNS INT
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    RETURN (SELECT
                COUNT(*)
                FROM
                    emps
                WHERE
                    department_id = dept_id);
END $

DELIMITER ;

SET @dept_id := 30;

SELECT
    count_by_id(30)
    FROM
        dual;
