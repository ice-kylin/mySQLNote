/*
# 存储过程和存储函数

## 存储过程

- 分类
  - 没有参数（无参数无返回）
  - 仅仅带 IN 类型（有参数无返回）
  - 仅仅带 OUT 类型（无参数有返回）
  - 既带 IN 又带 OUT（有参数有返回）
  - 带 INOUT（有参数有返回）
 */
CREATE DATABASE IF NOT EXISTS dbtest15;

USE dbtest15;

CREATE TABLE IF NOT EXISTS emps AS
SELECT *
    FROM
        atguigudb.employees;

SELECT *
    FROM
        emps;

CREATE TABLE IF NOT EXISTS depts AS
SELECT *
    FROM
        atguigudb.departments;

SELECT *
    FROM
        depts;

/*
## 创建存储过程

### 类型 1：无参数，无返回值类型
 */
# 创建存储过程 select_all_date()，查看 emps 表的所有数据
DELIMITER $

CREATE PROCEDURE select_all_date()
BEGIN
    SELECT *
        FROM
            emps;
END $

DELIMITER ;

/*
## 存储过程的调用
 */
CALL select_all_date();

# 创建存储过程 avg_employee_salary()，返回所有员工的平均工资
DELIMITER //

CREATE PROCEDURE avg_employee_salary()
BEGIN
    SELECT
        AVG(IFNULL(salary, 0)) AS avg_sal
        FROM
            emps;
END //

DELIMITER ;

CALL avg_employee_salary();

# 创建存储过程 show_max_salary()，用来查看 emps 表的最高薪资值
DELIMITER $

CREATE PROCEDURE show_max_salary()
BEGIN
    SELECT
        MAX(salary)
        FROM
            emps;
END $

DELIMITER ;

CALL show_max_salary();

/*
### 类型 2：带 OUT
 */
# 创建存储过程 show_min_salary()，查看 emps 表的最低薪资值，并将最低薪资通过 OUT 参数 ms 输出
DELIMITER $

CREATE PROCEDURE show_min_salary(OUT ms DOUBLE)
BEGIN
    SELECT
        MIN(salary)
        INTO ms
        FROM
            emps;
END $

DELIMITER ;

CALL show_min_salary(@ms);

SELECT
    @ms
    FROM
        dual;

/*
### 类型 3：带 IN
 */
# 创建存储过程 show_someone_salary()，查看 emps 表的某个员工的薪资，并用 IN 参数 empname 输入员工姓名
DELIMITER $

CREATE PROCEDURE show_someone_salary(IN empname VARCHAR(20))
BEGIN
    SELECT
        salary
        FROM
            emps
        WHERE
            last_name = empname;
END $

DELIMITER ;

CALL show_someone_salary('Abel');

SET @empname := 'Abel';

CALL show_someone_salary(@empname);

/*
### 类型 4：带 IN 和 OUT
 */
# 创建存储过程 show_someone_salary2()，查看 emps 表的某个员工的薪资
# 并用 IN 参数 empname 输入员工姓名，用 OUT 参数 empsalary 输出员工薪资
DELIMITER $

CREATE PROCEDURE show_someone_salary2(IN empname VARCHAR(20), OUT empsalary DOUBLE)
BEGIN
    SELECT
        salary
        INTO empsalary
        FROM
            emps
        WHERE
            last_name = empname;
END $

DELIMITER ;

SET @empname := 'Abel';

CALL show_someone_salary2(@empname, @empsalary);

SELECT
    @empsalary
    FROM
        dual;

/*
### 类型 5：带 INOUT
 */
# 创建存储过程 show_mgr_name()，查询某个员工领导的姓名
# 并用 INOUT 参数 empname 参数输入员工姓名、输出领导姓名
DELIMITER $

CREATE PROCEDURE show_mgr_name(INOUT empname VARCHAR(25))
BEGIN
    SELECT
        m.last_name
        INTO empname
        FROM
            emps e
                JOIN emps m ON e.manager_id = m.employee_id
        WHERE
            e.last_name = empname;
END $

DELIMITER ;

SET @empname := 'Abel';

CALL show_mgr_name(@empname);

SELECT
    @empname
    FROM
        dual;
