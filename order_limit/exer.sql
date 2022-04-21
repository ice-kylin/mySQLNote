# 查询员工的姓名、部门号和年薪，按年薪降序、姓名升序排列
SELECT
    last_name,
    department_id,
    (salary + salary * IFNULL(commission_pct, 0)) * 12 AS annual_salary
    FROM
        employees
    ORDER BY
        annual_salary DESC, last_name;

# 选择工资不在 8000 到 17000 的员工的姓名和工资，按照工资降序，显示第 21 到 40 位置的数据
SELECT
    last_name,
    salary
    FROM
        employees
    WHERE
        salary NOT BETWEEN 8000 AND 17000
    ORDER BY
        salary
    LIMIT 20,20;

# 查询邮箱中包含 e 的员工信息，并按照邮箱的字节数降序，再按照部门号升序
SELECT
    employee_id,
    last_name,
    email,
    department_id
    FROM
        employees
    WHERE
        email LIKE '%e%'
    ORDER BY
        LENGTH(email) DESC, department_id;
