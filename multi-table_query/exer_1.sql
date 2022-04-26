#
1. 显示所有员工的姓名
，部门号和部门名称
SELECT
    e.last_name,
    e.department_id,
    d.department_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id;

#
2. 查询 90 号部门员工的 job_id 和 90 号部门的 location_id
SELECT
    d.department_id,
    e.job_id,
    d.location_id
    FROM
        departments d
            JOIN employees e ON d.department_id = e.department_id
    WHERE
        d.department_id = 90;

SELECT
    job_id,
    location_id
    FROM
        employees e
            JOIN departments d ON e.`department_id` = d.`department_id`
    WHERE
        e.`department_id` = 90;

#
3. 选择所有有奖金的员工的 last_name
、department_name
、location_id
、city
SELECT
    e.last_name,
    e.commission_pct,
    d.department_name,
    d.location_id,
    l.city
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id
            LEFT JOIN locations l ON d.location_id = l.location_id
    WHERE
        e.commission_pct IS NOT NULL;

#
4. 选择 city 在 Toronto 工作的员工的 last_name
、job_id
、department_id
、department_name
SELECT
    e.last_name,
    e.job_id,
    e.department_id,
    d.department_name
    FROM
        employees e
            LEFT JOIN departments d ON e.department_id = d.department_id
            LEFT JOIN locations l ON d.location_id = l.location_id
    WHERE
        l.city = 'Toronto';

#
5. 查询员工所在的部门名称
、部门地址
、姓名
、工作
、工资
，其中员工所在部门的部门名称为 Executive
SELECT
    d.department_name,
    l.street_address,
    e.last_name,
    j.job_title,
    e.salary
    FROM
        employees e
            JOIN departments d ON e.department_id = d.department_id
            LEFT JOIN jobs j ON e.job_id = j.job_id
            LEFT JOIN locations l ON d.location_id = l.location_id
    WHERE
        d.department_name = 'Executive';

#
6. 选择指定员工的姓名
、员工号
，以及他的管理者的姓名和员工号
SELECT
    e.last_name   AS employees,
    e.employee_id AS "emp#",
    m.last_name   AS manager,
    m.employee_id AS "mgr#"
    FROM
        employees e
            LEFT JOIN employees m ON e.manager_id = m.employee_id
    WHERE
        e.last_name = 'kochhar';

#
7. 查询哪些部门没有员工
SELECT
    d.department_name,
    d.department_id
    FROM
        departments d
            LEFT JOIN employees e ON d.department_id = e.department_id
    WHERE
        e.department_id IS NULL;

#
8. 查询哪个城市没有部门
SELECT
    l.city
    FROM
        locations l
            LEFT JOIN departments d ON l.location_id = d.location_id
    WHERE
        d.location_id IS NULL;

#
9. 查询部门名为 Sales 或 IT 的员工信息
SELECT
    e.last_name,
    d.department_name
    FROM
        departments d
            JOIN employees e ON d.department_id = e.department_id
    WHERE
         d.department_name = 'Sales'
      OR d.department_name = 'IT';
