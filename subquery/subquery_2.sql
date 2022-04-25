/*
# 单行子查询

## 单行操作符

- `=`
- `<>`
- `>=`
- `>`
- `<=`
- `<`

## 子查询的编写步骤

1. 从里往外
2. 从外往里
 */


# 查询工资大于 149 号员工工资的员工信息
SELECT
    salary
    FROM
        employees
    WHERE
        employee_id = 149;

SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    WHERE
            salary > (SELECT
                          salary
                          FROM
                              employees
                          WHERE
                              employee_id = 149);

# 查询 job_id 与 141 号员工相同，salary 比 143 号员工多的员工姓名、job_id 和工资
SELECT
    last_name,
    job_id,
    salary
    FROM
        employees
    WHERE
            job_id = (SELECT
                          job_id
                          FROM
                              employees
                          WHERE
                              employee_id = 141)
      AND   salary > (SELECT
                          salary
                          FROM
                              employees
                          WHERE
                              employee_id = 143);

# 查询公司工资最少的员工的 last_name、job_id 和 salary
SELECT
    last_name,
    job_id,
    salary
    FROM
        employees
    WHERE
            salary = (SELECT
                          MIN(salary)
                          FROM
                              employees);

# 查询与 141 号或 147 号员工的 manager_id 和 department_id 相同的其它员工的 employee_id、manager_id 和 department_id
SELECT
    employee_id,
    manager_id,
    department_id
    FROM
        employees
    WHERE
          ((manager_id = (SELECT
                              manager_id
                              FROM
                                  employees
                              WHERE
                                  employee_id = 141)
              AND department_id = (SELECT
                                       department_id
                                       FROM
                                           employees
                                       WHERE
                                           employee_id = 141))
              OR (manager_id = (SELECT
                                    manager_id
                                    FROM
                                        employees
                                    WHERE
                                        employee_id = 147)
                  AND department_id = (SELECT
                                           department_id
                                           FROM
                                               employees
                                           WHERE
                                               employee_id = 147)))
      AND employee_id NOT IN (141, 147);

SELECT
    employee_id,
    manager_id,
    department_id
    FROM
        employees
    WHERE
          ((manager_id, department_id) = (SELECT
                                              manager_id,
                                              department_id
                                              FROM
                                                  employees
                                              WHERE
                                                  employee_id = 141)
              OR (manager_id, department_id) = (SELECT
                                                    manager_id,
                                                    department_id
                                                    FROM
                                                        employees
                                                    WHERE
                                                        employee_id = 147))
      AND employee_id NOT IN (141, 147);

/*
## HAVING 中的子查询
 */
# 查询最低工资大于 50 号部门最低工资的部门 id 和其最低工资
SELECT
    department_id,
    MIN(salary)
    FROM
        employees
    WHERE
        department_id IS NOT NULL
    GROUP BY
        department_id
    HAVING
            MIN(salary) > (SELECT
                               MIN(salary)
                               FROM
                                   employees
                               WHERE
                                   department_id = 50);

/*
## CASE 中的子查询
 */
# 查询员工的 employee_id、last_name 和 location
# 其中，若员工 department_id 与 location_id 为 1800 的 department_id 相同，则 location 为 Canada，其余则为 USA
SELECT
    employee_id,
    last_name,
    IF(department_id = (SELECT
                            department_id
                            FROM
                                departments
                            WHERE
                                location_id = 1800), 'Canada', 'USA') "location"
    FROM
        employees;
