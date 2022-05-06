/*
# 视图

## 常见的数据库对象

- 表（TABLE）
- 数据字典
- 约束（CONSTRAINT）
- 视图（VIEW）
- 索引（INDEX）
- 存储过程（PROCEDURE）
- 存储函数（FUNCTION）
- 触发器（TRIGGER）

## 关于视图的理解

- 试图可以看作是一个虚拟表，本身是不存储数据的
  - 视图的本质可以看作是存储起来的 SELECT 语句
- 视图中 SELECT 语句中涉及到的表称为基表
- 针对视图做 DML 操作，会影响到对应的基表中的数据，反之亦然
- 视图本身的删除不会导致基表中数据的删除
- 视图应用的场景
  - 针对小型项目，不推荐使用视图
  - 针对于大型项目，可以考虑使用视图
- 视图的优点
  - 简化查询
  - 控制数据的访问
*/
CREATE DATABASE IF NOT EXISTS dbtest14;

SHOW CREATE DATABASE dbtest14;

USE dbtest14;

CREATE TABLE emps AS
SELECT *
    FROM
        atguigudb.employees;

SELECT *
    FROM
        emps;

CREATE TABLE depts AS
SELECT *
    FROM
        atguigudb.departments;

SELECT *
    FROM
        depts;

/*
## 创建视图

### 针对于单表
 */
# 情况 1：视图中的字段与基表中的字段有对应关系
CREATE VIEW vu_emp1 AS
SELECT
    employee_id,
    last_name,
    salary
    FROM
        emps;

SELECT *
    FROM
        vu_emp1;

# 确定视图中字段的方式 1
CREATE VIEW vu_emp2 AS
SELECT
    employee_id AS emp_id,
    last_name   AS l_name,
    salary      AS sal
    FROM
        emps;

SELECT *
    FROM
        vu_emp2;

# 确定视图中字段的方式 2
CREATE VIEW vu_emp3(emp_id, l_name, sal) AS # 小括号内字段个数与 SELECT 中字段个数相同
SELECT
    employee_id,
    last_name,
    salary
    FROM
        emps
    WHERE
        salary >= 8000;

SELECT *
    FROM
        vu_emp3;

# 情况 2：视图中的字段在基表中可能没有对应的字段
CREATE VIEW vu_emp_sal AS
SELECT
    department_id          AS dept_id,
    AVG(IFNULL(salary, 0)) AS avg_sal
    FROM
        emps
    WHERE
        department_id IS NOT NULL
    GROUP BY
        department_id
    ORDER BY
        department_id;

SELECT *
    FROM
        vu_emp_sal;

/*
### 针对于多表
 */
CREATE VIEW vu_emp_dept AS
SELECT
    e.employee_id,
    e.last_name       AS l_name,
    e.department_id   AS dept_id,
    d.department_name AS dept_name
    FROM
        emps e
            JOIN depts d ON e.department_id = d.department_id;

SELECT *
    FROM
        vu_emp_dept;

/*
### 利用视图对数据进行格式化
 */
CREATE VIEW vu_emp_dept1 AS
SELECT
    CONCAT(e.last_name, '(', d.department_name, ')') AS emp_info
    FROM
        emps e
            JOIN depts d ON e.department_id = d.department_id;

SELECT *
    FROM
        vu_emp_dept1;

/*
### 基于视图创建视图
 */
CREATE VIEW vu_emp4 AS
SELECT
    employee_id,
    last_name
    FROM
        vu_emp1;

SELECT *
    FROM
        vu_emp4;

/*
## 查看视图
 */
# 语法 1：查看数据库的表对象、视图对象
SHOW TABLES;

# 语法 2：查看视图的结构
DESC vu_emp1;

# 语法 3：查看视图的属性信息
SHOW TABLE STATUS LIKE 'vu_emp1';

# 语法 4：查看视图的详细定义信息
SHOW CREATE VIEW vu_emp1;
