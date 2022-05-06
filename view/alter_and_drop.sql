/*
# 修改、删除视图

## 修改视图
 */
USE dbtest14;

DESC vu_emp1;

# 方式 1
CREATE OR REPLACE VIEW vu_emp1 AS
SELECT
    employee_id,
    last_name,
    salary,
    email
    FROM
        emps
    WHERE
        salary >= 7000;

DESC vu_emp1;

# 方式 2
    ALTER VIEW vu_emp1 AS
    SELECT
        employee_id,
        last_name,
        salary,
        email,
        hire_date
        FROM
            emps;

DESC vu_emp1;

/*
## 删除视图
 */
SHOW TABLES;

DROP VIEW IF EXISTS vu_emp4;

DROP VIEW IF EXISTS vu_emp2, vu_emp3;
