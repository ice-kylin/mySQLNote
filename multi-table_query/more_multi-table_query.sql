/*
# 多表查询的分类

- 角度一：等值连接 vs 非等值连接
- 角度二：自连接 vs 非自连接
- 角度三：内连接 vs 外连接
 */

/*
## 等值连接 vs 非等值连接
 */
SELECT *
    FROM
        job_grades;

SELECT
    e.employee_id,
    e.last_name,
    e.salary,
    j.grade_level
    FROM
        employees e,
        job_grades j
    WHERE
        e.salary BETWEEN j.lowest_sal AND j.highest_sal;

/*
## 自连接 vs 非自连接
 */
#
查询员工 id
，员工姓名以及管理者 id 和姓名
SELECT
    e.employee_id,
    e.last_name,
    m.employee_id,
    m.last_name
    FROM
        employees e,
        employees m
    WHERE
        e.manager_id = m.employee_id;

/*
## 内连接 vs 外连接

- 内连接：合并具有同一列的两个以上的表的行，结果集中不包含一个表与另一个表不匹配的行
- 外连接：合并具有同一列的两个以上的表的行，结果集中除了包含一个表与另一个表匹配的行之外，还查询到了左表或右表中不匹配的行
  - 左外连接
  - 右外连接
  - 满外连接
 */
/*
### SQL99 语法实现内连接
 */
SELECT
    e.last_name,
    d.department_name,
    l.city
    FROM
        employees e
            INNER JOIN departments d ON e.department_id = d.department_id
            INNER JOIN locations l ON d.location_id = l.location_id;

/*
### SQL99 语法实现外连接
 */
#
左外连接
# 查询所有员工的 `last_name`
、`department_name` 信息
SELECT
    e.last_name,
    d.department_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id;

#
右外连接
SELECT
    last_name,
    department_name
    FROM
        employees e
            RIGHT JOIN departments d ON d.department_id = e.department_id;
