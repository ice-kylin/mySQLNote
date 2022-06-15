/*
# 流程控制

## IF 分支结构
 */
USE dbtest16;

# 声明存储过程 update_salary_by_eid1，定义 IN 参数 emp_id，输入员工编号
# 判断该员工薪资如果低于 8000 元并且入职时间超过 5 年，就涨薪 500 元；否则就不变
DELIMITER //

CREATE PROCEDURE update_salary_by_eid1(IN emp_id INT)
BEGIN
    DECLARE emp_salary DOUBLE;
    DECLARE emp_hire_year INT;

    SELECT
        salary,
        YEAR(FROM_DAYS(DATEDIFF(CURDATE(), hire_date)))
        INTO
            emp_salary,
            emp_hire_year
        FROM
            employees
        WHERE
            employee_id = emp_id;

    IF emp_salary < 8000 AND emp_hire_year >= 5
        THEN
            UPDATE employees
            SET
                salary = salary + 500
                WHERE
                    employee_id = emp_id;
    END IF;
END //

DELIMITER ;

CALL update_salary_by_eid1(104);

# 声明存储过程 update_salary_by_eid2，定义 IN 参数 emp_id，输入员工编号
# 判断该员工薪资如果低于 9000 元并且入职时间超过 5 年，就涨薪 500 元；否则就涨薪 100 元
DELIMITER //

CREATE PROCEDURE update_salary_by_eid2(IN emp_id INT)
BEGIN
    DECLARE emp_salary DOUBLE;
    DECLARE emp_hire_date YEAR;
    DECLARE add_salary DOUBLE;

    SELECT
        salary,
        YEAR(FROM_DAYS(DATEDIFF(CURDATE(), hire_date)))
        INTO
            emp_salary,
            emp_hire_date
        FROM
            employees
        WHERE
            employee_id = emp_id;

    IF emp_salary < 9000 AND emp_hire_date >= 5
        THEN
            SET add_salary := 500;
        ELSE
            SET add_salary := 100;
    END IF;

    UPDATE employees
    SET
        salary = salary + add_salary
        WHERE
            employee_id = emp_id;
END //

DELIMITER ;

CALL update_salary_by_eid2(103);
CALL update_salary_by_eid2(104);

# 声明存储过程 update_salary_by_eid3，定义 IN 参数 emp_id，输入员工编号
# 判断该员工薪资如果低于 9000 元，就更新薪资为 9000 元；薪资如果大于等于 9000 元且低于 10000 的，但是奖金
# 比例为 NULL 的，就更新奖金比例为 0.01；其它的涨薪 100 元
DELIMITER //

CREATE PROCEDURE update_salary_by_eid3(IN emp_id INT)
BEGIN
    DECLARE emp_salary DOUBLE;
    DECLARE emp_pct DOUBLE;

    SELECT
        salary,
        commission_pct
        INTO
            emp_salary,
            emp_pct
        FROM
            employees
        WHERE
            employee_id = emp_id;

    IF emp_salary < 9000
        THEN
            UPDATE employees
            SET
                salary = 9000
                WHERE
                    employee_id = emp_id;
        ELSEIF emp_salary < 10000 AND emp_pct IS NULL
            THEN
                UPDATE employees
                SET
                    commission_pct = 0.01
                    WHERE
                        employee_id = emp_id;
        ELSE
            UPDATE employees
            SET
                salary = salary + 100
                WHERE
                    employee_id = emp_id;
    END IF;
END //

DELIMITER ;

CALL update_salary_by_eid3(104);
CALL update_salary_by_eid3(103);
CALL update_salary_by_eid3(102);

SELECT *
    FROM
        employees
    WHERE
        employee_id IN (102, 103, 104);
