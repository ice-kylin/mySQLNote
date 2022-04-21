/*
# 分页

- 使用 `LIMIT` 实现数据的分页显示
 */

USE atguigudb;

SELECT
    employee_id,
    last_name
    FROM
        employees;

# 每页显示 20 条记录，此时显示第 1 页的数据
SELECT
    employee_id,
    last_name
    FROM
        employees
    LIMIT 0,20;

# 每页显示 20 条记录，此时显示第 2 页的数据
SELECT
    employee_id,
    last_name
    FROM
        employees
    LIMIT 20,20;

# 每页显示 20 条记录，此时显示第 3 页的数据
SELECT
    employee_id,
    last_name
    FROM
        employees
    LIMIT 40,20;

/*
## 公式

- `LIMIT (pageNum - 1) * pageSize, pageSize;`

## 格式

- `LIMIT 位置偏移量, 条目数`
- 当位置偏移量是 `0` 时可以省略

## 声明顺序
 */
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    WHERE
        salary > 6000
    ORDER BY
        salary DESC
    LIMIT 0,20;

# 只显示第 `32` 和 `33` 条数据
SELECT
    employee_id,
    last_name
    FROM
        employees
    LIMIT 31,2;

/*
## 8.0 新特性
 */
SELECT
    employee_id,
    last_name
    FROM
        employees
    LIMIT 2 OFFSET 31;

# 查询员工中工资最高的员工信息
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    ORDER BY
        salary DESC
    LIMIT 1;
