/*
# 运算符练习
 */
#
1. 选择工资不在 5000 到 12000 的员工的姓名和工资
SELECT
    last_name,
    salary
    FROM
        employees
    WHERE
        salary NOT BETWEEN 5000 AND 12000;

#
2. 选择在 20 或 50 号部门工作的员工姓名和部门号
SELECT
    last_name,
    department_id
    FROM
        employees
    WHERE
        department_id IN (20, 50);

SELECT
    last_name,
    department_id
    FROM
        employees
    WHERE
        department_id = 20 || department_id = 50;

#
3. 选择公司中没有管理者的员工姓名和 job_id
SELECT
    last_name,
    job_id
    FROM
        employees
    WHERE
        manager_id IS NULL;

SELECT
    last_name,
    job_id
    FROM
        employees
    WHERE
        manager_id <=> NULL;

#
4. 选择公司中有奖金的员工姓名
，工资和奖金级别
SELECT
    last_name,
    salary,
    commission_pct
    FROM
        employees
    WHERE
        commission_pct IS NOT NULL;

#
5. 选择员工姓名的第三个字母是 a 的员工姓名
SELECT
    last_name
    FROM
        employees
    WHERE
        last_name LIKE '__a%';

#
6. 选择姓名中有字母 a 和 k 的员工姓名
SELECT
    last_name
    FROM
        employees
    WHERE
        last_name LIKE '%a%k%' || last_name LIKE '%k%a%';

SELECT
    last_name
    FROM
        employees
    WHERE
        last_name LIKE '%a%' && last_name LIKE '%k%';

#
7. 显示出表 employees 表中 first_name 以 e 结尾的员工信息
SELECT
    last_name,
    first_name
    FROM
        employees
    WHERE
        first_name LIKE '%e';

SELECT
    last_name,
    first_name
    FROM
        employees
    WHERE
        first_name REGEXP 'e$';

#
8. 显示出表 employees 部门编号在 80 - 100 之间的姓名
、工种
SELECT
    last_name,
    job_id
    FROM
        employees
    WHERE
        department_id BETWEEN 80 AND 100;

#
9. 显示出表 employees 的 manager_id 是 100
、101、110 的员工姓名
、工资
、管理者 id
SELECT
    last_name,
    salary,
    manager_id
    FROM
        employees
    WHERE
        manager_id IN (100, 101, 110);
