/*
# 7 种 `JOIN` 的实现

## `UNION` 和 `UNION ALL` 的使用

- `UNION` 会执行去重的操作
- `UNION ALL` 不会执行去重的操作
  - 如果明确知道合并后的结果数据不存在重复数据，或者不需要去重重复的数据
  - 则尽量使用 `UNION ALL` 语句，以提高数据查询的效率
 */

#
中图
：内连接
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            JOIN departments d ON e.department_id = d.department_id;

#
左图
：左外连接
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id;

#
右上图
：右外连接
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            RIGHT JOIN departments d ON d.department_id = e.department_id;

#
左中图
：
SELECT
    e.employee_id,
    d.department_name,
    e.department_id,
    d.department_id
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id
    WHERE
        d.department_id IS NULL;

#
右中图
SELECT
    employee_id,
    department_name
    FROM
        employees e
            RIGHT JOIN departments d ON e.department_id = d.department_id
    WHERE
        e.department_id IS NULL;

#
左下图
：满外连接
# 方式 1
：左上图 UNION ALL 右中图
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id
UNION ALL
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            RIGHT JOIN departments d ON e.department_id = d.department_id
    WHERE
        e.department_id IS NULL;

#
方式二
：左中图 UNION ALL 右上图
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id
    WHERE
        d.department_id IS NULL
UNION ALL
SELECT
    e.employee_id,
    d.department_name
    FROM
        employees e
            RIGHT JOIN departments d ON d.department_id = e.department_id;
