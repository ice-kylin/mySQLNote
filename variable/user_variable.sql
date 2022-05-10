/*
# 用户变量

- 会话用户变量
  - 使用 `@` 开头，作用域为当前的会话
  - 作用域和会话变量一样，只对当前连接有效
- 局部变量
  - 使用 DECLARE 声明
  - 声明并使用在 BEGIN END 中（使用在存储过程和存储函数中）
  - DECLARE 的方式声明的局部变量必须声明在 BEGIN 中的首行的位置

## 会话用户变量

### 变量的声明和赋值
 */
# 方式 1
SET @m1 := 1;
SET @m2 := 2;
SET @sum := @m1 + @m2;

SELECT
    @m1,
    @m2,
    @sum
    FROM
        dual;

CREATE DATABASE IF NOT EXISTS dbtest16;

USE dbtest16;

CREATE TABLE IF NOT EXISTS employees AS
SELECT *
    FROM
        atguigudb.employees;

SELECT *
    FROM
        employees;

CREATE TABLE IF NOT EXISTS departments AS
SELECT *
    FROM
        atguigudb.departments;

SELECT *
    FROM
        departments;

# 方式 2
SELECT
    @count := COUNT(*)
    FROM
        employees;

SELECT
    @count
    FROM
        dual;

SELECT
    AVG(IFNULL(salary, 0))
    INTO @avg_sal
    FROM
        employees;

SELECT
    @avg_sal
    FROM
        dual;

/*
## 局部变量
 */
DELIMITER //

CREATE PROCEDURE test_var()
BEGIN
    # 声明
    DECLARE a INT DEFAULT 0;
    DECLARE b INT;
    DECLARE c, d INT DEFAULT 0;
    DECLARE emp_name VARCHAR(25);

    # 赋值
    SET a := 1;
    SET b := 2;

    SELECT
        last_name
        INTO emp_name
        FROM
            employees
        WHERE
            employee_id = 101;

    SELECT
        a,
        b,
        c,
        d,
        emp_name
        FROM
            dual;
END //

DELIMITER ;

CALL test_var();

# 声明局部变量，并分别赋值为 employees 表中 employee_id 为 102 的 last_name 和 salary
DELIMITER //

CREATE PROCEDURE test_pro()
BEGIN
    # 声明
    DECLARE emp_name VARCHAR(25);
    DECLARE emp_salary DOUBLE;

    # 赋值
    SELECT
        last_name,
        salary
        INTO
            emp_name,
            emp_salary
        FROM
            employees
        WHERE
            employee_id = 102;

    SELECT
        emp_name,
        emp_salary
        FROM
            dual;
END //

DELIMITER ;

CALL test_pro();

# 声明 2 个变量，求和并打印
# 方式 1：使用会话用户变量
SET @i1 := 10;
SET @i2 := 20;
SET @rst := @i1 + @i2;

SELECT
    @rst
    FROM
        dual;

# 方式 2：使用局部变量
DELIMITER //

CREATE PROCEDURE add_int()
BEGIN
    # 声明
    DECLARE i1, i2, rst INT;

    # 赋值
    SET i1 := 10;
    SET i2 := 20;
    SET rst := i1 + i2;

    SELECT
        rst
        FROM
            dual;
END //

DELIMITER ;

CALL add_int();

# 创建存储过程 different_salary() 查询某员工和他领导的薪资差距
# 并用 IN 参数 emp_id 接收员工 id，用 OUT 参数 dif_salary 输出薪资差距结果
DELIMITER //

CREATE PROCEDURE different_salary(IN emp_id INT, OUT dif_salary DOUBLE)
BEGIN
    SELECT
        m.salary - e.salary
        INTO dif_salary
        FROM
            employees e
                JOIN employees m ON e.manager_id = m.employee_id
        WHERE
            e.employee_id = emp_id;
END //

DELIMITER ;

SET @emp_id = 103;

CALL different_salary(@emp_id, @dif_salary);

SELECT
    @dif_salary
    FROM
        dual;
