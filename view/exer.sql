/*
# 课后练习

## 练习 1
 */
USE atguigudb;

# 1. 使用表 employees 创建视图 employee_vu，其中包括姓名、员工号、部门号
CREATE VIEW employee_vu AS
SELECT
    last_name,
    employee_id,
    department_id
    FROM
        employees;

# 2. 显示视图的结构
DESC employee_vu;

SHOW TABLE STATUS LIKE 'employee_vu';

# 3. 查询视图中的全部内容
SELECT *
    FROM
        employee_vu;

# 4. 将视图中的数据限定在部门号是 80 的范围内
    ALTER VIEW employee_vu AS
    SELECT
        last_name,
        employee_id,
        department_id
        FROM
            employees
        WHERE
            department_id = 80;

/*
## 练习 2
 */
CREATE TABLE emps
AS
SELECT *
    FROM
        employees;


# 1. 创建视图 emp_v1，要求查询电话号码以 011 开头的员工姓名和工资、邮箱
CREATE VIEW emp_v1 AS
SELECT
    last_name,
    salary,
    email
    FROM
        emps
    WHERE
        phone_number LIKE '011%';

SELECT *
    FROM
        emp_v1;

# 2. 要求将视图 emp_v1 修改为查询电话号码以 011 开头的并且邮箱中包含 e 字符的员工姓名和邮箱、电话号码
    ALTER VIEW emp_v1 AS
    SELECT
        last_name,
        salary,
        email,
        phone_number
        FROM
            emps
        WHERE
              phone_number LIKE '011%'
          AND email LIKE '%e%';

SELECT *
    FROM
        emp_v1;

# 3. 向 emp_v1 插入一条记录，是否可以？
# 不可以
DESC emps;

# 4. 修改 emp_v1 中员工的工资，每人涨薪 1000
UPDATE emp_v1
SET
    salary = salary + 1000;

# 5. 删除 emp_v1 中姓名为 Olsen 的员工
DELETE
    FROM
        emp_v1
    WHERE
        last_name = 'Olsen';

# 6. 创建视图 emp_v2，要求查询部门的最高工资高于 12000 的部门 id 和其最高工资
CREATE OR REPLACE VIEW emp_v2(dept_id, max_sal) AS
SELECT
    department_id,
    MAX(salary)
    FROM
        emps
    WHERE
        department_id IS NOT NULL
    GROUP BY
        department_id
    HAVING
        MAX(salary) > 12000
    ORDER BY
        department_id;

SELECT *
    FROM
        emp_v2;

# 7. 向 emp_v2 中插入一条记录，是否可以？
# 不可以

# 8. 删除刚才的 emp_v2 和 emp_v1
DROP VIEW IF EXISTS emp_v1,emp_v2;

SHOW TABLES;
