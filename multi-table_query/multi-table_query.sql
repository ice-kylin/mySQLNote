/*
# 多表查询
 */

USE atguigudb;

DESC employees;
DESC departments;
DESC locations;

/*
## 出现笛卡尔积的错误

- 错误的原因：缺少了多表的连接条件
- 错误的实现方式：每个员工都与每个部门匹配了一遍
 */
SELECT
    employee_id,
    department_name
    FROM
        employees,
        departments;

SELECT
    employee_id,
    department_name
    FROM
        employees
            CROSS JOIN departments;

/*
## 多表查询的正确方式

- 需要有连接条件
  - 如果有 n 个表实现多表的查询，则至少需要 n - 1 个条件
- 如果查询语句中出现了多个表中都存在的字段，则必须指明此字段所在的表
  - 从 SQL 优化的角度，建议多表查询时，每个字段前都指明其所在的表
 */
SELECT
    employees.employee_id,
    employees.department_id,
    departments.department_name
    FROM
        employees,
        departments
    WHERE
        employees.department_id = departments.department_id;

/*
## 表的别名

- 可以给表起别名，在 `SELECT` 和 `WHERE` 中使用表的别名
- 如果给表起了别名，一旦在 `SELECT` 和 `WHERE` 中使用表名的话
  - 则必须使用表的别名
  - 而不能再使用表的原名
 */
SELECT
    emp.employee_id,
    emp.last_name,
    emp.department_id,
    dept.department_name
    FROM
        employees emp,
        departments dept
    WHERE
        emp.department_id = dept.department_id;

# 查询员工的 `employee_id`、`last_name`、`department_name`、`city`
SELECT
    e.employee_id,
    e.last_name,
    d.department_name,
    l.city
    FROM
        employees e,
        departments d,
        locations l
    WHERE
        e.department_id = d.department_id && d.location_id = l.location_id;
