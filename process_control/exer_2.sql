/*
# 课后练习 2：游标的使用
 */
USE test16_var_cur;

# 创建存储过程 update_salary()，参数 1 为 IN 的 INT 型变量 dept_id，表示部门 id
# 参数 2 为 IN 的 INT 型变量 change_sal_count，表示要调整薪资的员工个数
# 查询指定 id 部门的员工信息，按照 salary 升序排列
# 根据 hire_date 的情况，调整前 change_sal_count 个员工的薪资
DELIMITER //

CREATE PROCEDURE update_salary(IN dept_id INT, IN change_sal_count INT)
BEGIN
    DECLARE e_id INT;
    DECLARE e_hire_date DATE;
    DECLARE e_hire_year YEAR;
    DECLARE sal_adj DOUBLE;
    DECLARE i INT DEFAULT 0;
    DECLARE e_cursor CURSOR FOR (SELECT
                                     employee_id,
                                     hire_date
                                     FROM
                                         employees
                                     WHERE
                                         department_id = dept_id
                                     ORDER BY
                                         salary
                                     LIMIT 0, change_sal_count);

    OPEN e_cursor;
    WHILE i < change_sal_count
        DO
            FETCH e_cursor INTO e_id, e_hire_date;

            SET e_hire_year := YEAR(e_hire_date);

            IF e_hire_year < 1995
                THEN
                    SET sal_adj := 1.2;
                ELSEIF e_hire_year <= 1998
                    THEN
                        SET sal_adj := 1.15;
                ELSEIF e_hire_year <= 2001
                    THEN
                        SET sal_adj := 1.1;
                ELSE
                    SET sal_adj := 1.05;
            END IF;

            UPDATE employees
            SET
                salary = salary * sal_adj
                WHERE
                    employee_id = e_id;

            SET i := i + 1;
        END WHILE;

    CLOSE e_cursor;
END //

DELIMITER ;

SELECT
    employee_id,
    hire_date,
    salary,
    department_id
    FROM
        employees
    WHERE
        department_id = 50
    ORDER BY
        salary;

CALL update_salary(50, 3);
