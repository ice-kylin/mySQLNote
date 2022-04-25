/*
# 多行子查询

- 也称为集合比较子查询
- 内查询返回了多行数据

## 多行比较操作符

- `IN`：等于列表中的任意一个
- `ANY`：需要和单行比较操作符一起使用
- `ALL`：需要和单行比较操作符一起使用，和子查询返回的所有值比较
- `SOME`：实际上是 `ANY` 的别名
 */
# IN
SELECT
    employee_id,
    last_name,
    salary,
    department_id
    FROM
        employees
    WHERE
            salary IN (SELECT
                           MIN(salary)
                           FROM
                               employees
                           GROUP BY
                               department_id);

# ANY
# 查询其它 job_id 中比 job_id 为 IT_PROG 部门任一工资低的员工的员工号、姓名、job_id 以及 salary
SELECT
    employee_id,
    last_name,
    job_id,
    salary
    FROM
        employees
    WHERE
          job_id <> 'IT_PROG'
      AND salary < ANY (SELECT
                            salary
                            FROM
                                employees
                            WHERE
                                job_id = 'IT_PROG');

# All
# 查询其它 job_id 中比 job_id 为 IT_PROG 部门所有工资都低的员工的员工号、姓名、job_id 以及 salary
SELECT
    employee_id,
    last_name,
    job_id,
    salary
    FROM
        employees
    WHERE
          job_id <> 'IT_PROG'
      AND salary < ALL (SELECT
                            salary
                            FROM
                                employees
                            WHERE
                                job_id = 'IT_PROG');

# 查询平均工资最低的部门 id
SELECT
    department_id,
    AVG(salary)
    FROM
        employees
    GROUP BY
        department_id
    HAVING
            AVG(salary) <= ALL (SELECT
                                    AVG(salary)
                                    FROM
                                        employees
                                    GROUP BY
                                        department_id);

SELECT
    department_id,
    AVG(salary)
    FROM
        employees
    GROUP BY
        department_id
    HAVING
            AVG(salary) = (SELECT
                               MIN(avg_salary)
                               FROM
                                   (SELECT
                                        AVG(salary) AS avg_salary
                                        FROM
                                            employees
                                        GROUP BY
                                            department_id) AS eas);
