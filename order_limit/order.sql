/*
# 排序

- 如果没有使用排序操作，默认情况下查询返回的数据是按照添加数据的顺序显示的
- 使用 `ORDER BY` 对查询到的数据进行排序操作
  - ASC：升序（ascend）
  - DESC：降序（descend）
  - 如果在 `ORDER BY` 后没有显式地指明排序的方式的话，则默认按照升序排列
  - 可以使用列的别名进行排序
    - 列的别名只能在 `ORDER BY` 中使用，不能在 `WHERE` 中使用
    - `WHERE` 需要声明在 `FROM` 后，`ORDER BY` 之前
 */
USE
atguigudb;

#
按照 salary 从高到低的顺序降序排列
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    ORDER BY
        salary DESC;

#
按照 salary 从低到高的顺序降序排列
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    ORDER BY
        salary;

#
可以使用列的别名进行排序
SELECT
    last_name,
    salary,
    salary * (1 + ifnull(commission_pct, 0)) * 12 AS annual_salary
    FROM
        employees
    ORDER BY
        annual_salary DESC;

/*
## 二级排序
 */
#
显示员工信息
，按照 department_id 的降序排列
、salary 的升序排列
SELECT
    employee_id,
    salary,
    department_id
    FROM
        employees
    ORDER BY
        department_id DESC, salary;
