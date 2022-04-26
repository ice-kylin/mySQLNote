/*
# 课后练习
 */
USE atguigudb;

# 1. WHERE 子句可否使用组函数进行过滤？
# 不可以

# 2. 查询公司员工工资的最大值、最小值、平均值、总和
SELECT
    MAX(salary),
    MIN(salary),
    AVG(IFNULL(salary, 0)),
    SUM(salary)
    FROM
        employees;

# 3. 查询各 job_id 的员工工资的最大值、最小值、平均值、总和
SELECT
    job_id,
    MAX(salary),
    MIN(salary),
    AVG(IFNULL(salary, 0)),
    SUM(salary)
    FROM
        employees
    GROUP BY
        job_id;

# 4. 选择具有各个 job_id 的员工人数
SELECT
    job_id,
    COUNT(*) AS "num_of_workers"
    FROM
        employees
    GROUP BY
        job_id;

# 5. 查询员工最高工资和最低工资的差距（DIFFERENCE）
SELECT
    MAX(salary) - MIN(salary) AS "difference"
    FROM
        employees;

# 6. 查询各个管理者手下员工的最低工资，其中最低工资不能低于 6000，没有管理者的员工不计算在内
SELECT
    m.last_name,
    e.manager_id,
    MIN(e.salary)
    FROM
        employees e
            JOIN employees m ON e.manager_id = m.employee_id
    GROUP BY
        manager_id
    HAVING
        MIN(e.salary) >= 6000;

# 7. 查询所有部门的名字、location_id、员工数量和平均工资，并按平均工资降序
SELECT
    e.department_id,
    d.department_name,
    d.location_id,
    COUNT(e.employee_id),
    AVG(IFNULL(e.salary, 0)) AS "avg_salary"
    FROM
        employees e
            RIGHT JOIN departments d ON e.department_id = d.department_id
    GROUP BY
        d.department_id
    ORDER BY
        avg_salary DESC;

# 8. 查询每个工种、每个部门的部门名、工种名和最低工资
SELECT
    e.job_id,
    j.job_title,
    e.department_id,
    d.department_name,
    MIN(e.salary)
    FROM
        departments d
            LEFT JOIN employees e ON d.department_id = e.department_id
            LEFT JOIN jobs j ON e.job_id = j.job_id
    GROUP BY
        e.job_id,
        j.job_title,
        e.department_id,
        d.department_name
UNION
SELECT
    e.job_id,
    j.job_title,
    e.department_id,
    d.department_name,
    MIN(e.salary)
    FROM
        departments d
            LEFT JOIN employees e ON d.department_id = e.department_id
            RIGHT JOIN jobs j ON e.job_id = j.job_id
    WHERE
        e.job_id IS NULL
    GROUP BY
        e.job_id,
        j.job_title,
        e.department_id,
        d.department_name;
