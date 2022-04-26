/*
# 相关子查询
 */
USE atguigudb;

# 查询员工中工资大于公司平均工资的员工的 last_name、salary 和其 department_id
SELECT
    last_name,
    salary,
    department_id
    FROM
        employees
    WHERE
            salary > (SELECT
                          AVG(salary)
                          FROM
                              employees);

# 查询员工中工资大于本部门平均工资的员工的 last_name、salary 和其 department_id
SELECT
    e1.last_name,
    e1.salary,
    e1.department_id
    FROM
        employees e1
    WHERE
            salary > (SELECT
                          AVG(e2.salary)
                          FROM
                              employees e2
                          WHERE
                              department_id = e1.department_id);

SELECT
    e1.last_name,
    e1.salary,
    e1.department_id
    FROM
        employees e1,
        (SELECT
             e2.department_id AS di,
             AVG(e2.salary)   AS avg
             FROM
                 employees e2
             GROUP BY
                 department_id) AS ea
    WHERE
          e1.salary > ea.avg
      AND e1.department_id = ea.di;

# 查询员工的 id、salary，按照 department_name 排序
SELECT
    e.employee_id,
    e.salary,
    d.department_name
    FROM
        employees e
            LEFT JOIN
            departments d ON e.department_id = d.department_id
    ORDER BY
        d.department_name;

SELECT
    e.employee_id,
    e.salary
    FROM
        employees e
    ORDER BY
        (SELECT
             d.department_name
             FROM
                 departments d
             WHERE
                 d.department_id = e.department_id);

/*
## 结论

- 在 `SELECT` 中，除了 GROUP BY 和 LIMIT 之外，其它位置都可以声明子查询

SELECT ..., ..., ... (存在聚合函数)
FROM ..., ..., ...
(LEFT / RIGHT) JOIN ... ON  多表的连接条件
...
(LEFT / RIGHT) JOIN ... ON  多表的连接条件
WHERE 不包含聚合函数的过滤条件
GROUP BY ..., ...
HAVING 包含聚合函数的过滤条件
ORDER BY ..., ... (ASC / DESC)
LIMIT ..., ...
 */
# 若 employees 表中 employee_id 与 job_history 表中 employee_id 相同的数目不小于 2
# 查询这些相同 id 的员工的 employee_id、last_name 和其 job_id
SELECT
    e.employee_id,
    e.last_name,
    e.job_id
    FROM
        employees e
    WHERE
            2 <= (SELECT
                      COUNT(*)
                      FROM
                          job_history j
                      WHERE
                          e.employee_id = j.employee_id
                      GROUP BY
                          j.employee_id);

/*
## EXISTS 和 NOT EXISTS 关键字

- `EXISTS`
  - 用来检查在子查询中是否存在满足条件的行
  - 如果在子查询中不存在满足条件的行
    - 条件返回 FALSE
    - 继续在子查询中查找
  - 如果在子查询中存在满足条件的行
    - 条件返回 TRUE
    - 不在子查询中继续查找
 */
# 查询公司管理者的 employee_id、last_name、job_id、department_id
SELECT
    e1.employee_id,
    e1.last_name,
    e1.job_id,
    e1.department_id
    FROM
        employees e1
    WHERE
        EXISTS(SELECT *
                   FROM
                       employees e2
                   WHERE
                       e1.employee_id = e2.manager_id);

# 查询 departments 表中，不存在于 employees 表中的部门的 department_id 和 department_name
SELECT
    d.department_id,
    d.department_name
    FROM
        departments d
    WHERE
        NOT EXISTS(
                SELECT *
                    FROM
                        employees e
                    WHERE
                        d.department_id = e.department_id
            );

SELECT
    d.department_id,
    d.department_name
    FROM
        departments d
            LEFT JOIN employees e ON d.department_id = e.department_id
    WHERE
        e.department_id IS NULL;
