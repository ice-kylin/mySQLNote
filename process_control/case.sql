/*
# CASE 分支结构
 */
USE dbtest16;

# 演示 1
DELIMITER //

CREATE PROCEDURE test_case1()
BEGIN
    DECLARE i1 INT DEFAULT 2;

    CASE i1
        WHEN 1 THEN SELECT
                        'i1 = 1'
                        FROM
                            dual;
        WHEN 2 THEN SELECT
                        'i1 = 2'
                        FROM
                            dual;
        WHEN 3 THEN SELECT
                        'i1 = 3'
                        FROM
                            dual;
        ELSE SELECT
                 'other values'
                 FROM
                     dual;
        END CASE;
END //

DELIMITER ;

CALL test_case1();

# 演示 2
DELIMITER  //

CREATE PROCEDURE test_case2()
BEGIN
    DECLARE i1 INT DEFAULT 10;

    CASE
        WHEN i1 >= 100 AND i1 < 1000 THEN SELECT
                                              '三位数'
                                              FROM
                                                  dual;
        WHEN i1 >= 10 THEN SELECT
                               '两位数'
                               FROM
                                   dual;
        WHEN i1 >= 1 THEN SELECT
                              '个位数'
                              FROM
                                  dual;
        ELSE SELECT
                 '其它位数'
                 FROM
                     dual;
        END CASE;
END //

DELIMITER ;

CALL test_case2();

# 声明存储过程 update_salary_by_eid4，定义 IN 参数 emp_id，输入员工编号
# 判断该员工薪资如果低于 9000 元，就更新薪资为 9000 元
# 薪资大于等于 9000 元且低于 10000 的，但是奖金比例为 NULL 的，就更新奖金比例为 0.01
# 其它的涨薪 100 元
DELIMITER //

CREATE PROCEDURE update_salary_by_eid4(IN emp_id INT)
BEGIN
    DECLARE e_sal DOUBLE;
    DECLARE e_pct DOUBLE;

    SELECT
        salary,
        commission_pct
        INTO
            e_sal,
            e_pct
        FROM
            employees
        WHERE
            employee_id = emp_id;

    CASE
        WHEN e_sal < 9000 THEN UPDATE employees
                               SET
                                   salary = 9000
                                   WHERE
                                       employee_id = emp_id;
        WHEN e_sal < 10000 AND e_pct IS NULL THEN UPDATE employees
                                                  SET
                                                      commission_pct = 0.01
                                                      WHERE
                                                          employee_id = emp_id;
        ELSE UPDATE employees
             SET
                 salary = salary + 100
                 WHERE
                     employee_id = emp_id;
        END CASE;
END //

DELIMITER ;

SELECT *
    FROM
        employees
    WHERE
        employee_id IN (105, 104, 103);

CALL update_salary_by_eid4(105);
CALL update_salary_by_eid4(104);
CALL update_salary_by_eid4(103);

# 声明存储过程 update_salary_by_eid5，定义 IN 参数 emp_id，输入员工编号
# 判断该员工的入职年限，如果是 0 年，薪资涨 50；如果是 1 年，薪资涨 100；如果是 2 年，薪资涨 200；
# 如果是 3 年，薪资涨 300；如果是 4 年，薪资涨 400；其它的涨薪 500
DELIMITER //

CREATE PROCEDURE update_salary_by_eid5(IN emp_id INT)
BEGIN
    DECLARE e_years INT;
    DECLARE e_sal INT;

    SELECT
        YEAR(NOW()) - YEAR(hire_date)
        INTO e_years
        FROM
            employees
        WHERE
            employee_id = emp_id;

    CASE e_years
        WHEN 0 THEN SELECT
                        50
                        INTO e_sal
                        FROM
                            dual;
        WHEN 1 THEN SELECT
                        100
                        INTO e_sal
                        FROM
                            dual;
        WHEN 2 THEN SELECT
                        200
                        INTO e_sal
                        FROM
                            dual;
        WHEN 3 THEN SELECT
                        300
                        INTO e_sal
                        FROM
                            dual;
        WHEN 4 THEN SELECT
                        400
                        INTO e_sal
                        FROM
                            dual;
        ELSE SELECT
                 500
                 INTO e_sal
                 FROM
                     dual;
        END CASE;

    UPDATE employees
    SET
        salary = salary + e_sal
        WHERE
            employee_id = emp_id;
END //

DELIMITER ;

SELECT *
    FROM
        employees;

CALL update_salary_by_eid5(105);
