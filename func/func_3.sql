/*
# 流程控制函数
 */
# IF()
USE atguigudb;

SELECT
    last_name,
    salary,
    IF(salary >= 6000, '高工资', '低工资') "details"
    FROM
        employees;

SELECT
    last_name,
    commission_pct,
    IF(commission_pct IS NULL, 0, commission_pct) "details"
    FROM
        employees;

# IFNULL()
SELECT
    last_name,
    commission_pct,
    IFNULL(commission_pct, 0) "details"
    FROM
        employees;

# CASE WHEN ... THEN ... WHEN ... THEN ... ELSE ... END
SELECT
    last_name,
    salary,
    CASE
        WHEN salary >= 15000 THEN '白骨精'
        WHEN salary >= 10000 THEN '潜力股'
        WHEN salary >= 8000 THEN '小屌丝'
        ELSE '草根' END "details"
    FROM
        employees;

/*
- 查询员工信息，若部门编号为
  - 10，打印其工资的 1.1 倍
  - 20，打印其工资的 1.2 倍
  - 30，打印其工资的 1.3 倍
  - 其它部门，打印其工资的 1.4 倍
 */
SELECT
    last_name,
    salary,
    department_id,
    CASE
        WHEN department_id = 10 THEN salary * 1.1
        WHEN department_id = 20 THEN salary * 1.2
        WHEN department_id = 30 THEN salary * 1.3
        ELSE salary * 1.4 END "details"
    FROM
        employees;

SELECT
    last_name,
    salary,
    department_id,
    CASE department_id
        WHEN 10 THEN salary * 1.1
        WHEN 20 THEN salary * 1.2
        WHEN 30 THEN salary * 1.3
        ELSE salary * 1.4 END "details"
    FROM
        employees;

/*
- 查询部门号为 10、20、30 的员工信息，若部门编号为
  - 10，打印其工资的 1.1 倍
  - 20，打印其工资的 1.2 倍
  - 30，打印其工资的 1.3 倍
 */
SELECT
    last_name,
    salary,
    department_id,
    CASE
        WHEN department_id = 10 THEN salary * 1.1
        WHEN department_id = 20 THEN salary * 1.2
        WHEN department_id = 30 THEN salary * 1.3 END "details"
    FROM
        employees
    WHERE
        department_id IN (10, 20, 30);

SELECT
    last_name,
    salary,
    department_id,
    CASE department_id
        WHEN 10 THEN salary * 1.1
        WHEN 20 THEN salary * 1.2
        WHEN 30 THEN salary * 1.3 END "details"
    FROM
        employees
    WHERE
        department_id IN (10, 20, 30);
