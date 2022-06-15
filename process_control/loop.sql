/*
# LOOP 循环结构
 */
USE dbtest16;

DELIMITER //

CREATE PROCEDURE test_loop()
BEGIN
    DECLARE num INT DEFAULT 1;

    loop_label:
    LOOP
        SET num := num + 1;

        IF num >= 10
            THEN
                LEAVE loop_label;
        END IF;
    END LOOP loop_label;

    SELECT
        num
        FROM
            dual;
END //

DELIMITER ;

CALL test_loop();

# 当市场环境变好时，公司为了奖励大家，决定给大家涨工资
# 声明存储过程 update_salary_loop()，声明 OUT 参数 num，输出循环次数
# 存储过程中实现循环给大家涨薪，薪资涨为原来的 1.1 倍
# 直到全公司的平均薪资达到 12000 结束，并统计循环次数
DELIMITER //

CREATE PROCEDURE update_salary_loop(OUT num INT)
BEGIN
    DECLARE avg_sal DOUBLE;

    SET num := 0;

    label:
    LOOP
        SELECT
            AVG(IFNULL(salary, 0))
            INTO avg_sal
            FROM
                employees;

        IF avg_sal >= 12000
            THEN
                LEAVE label;
            ELSE
                SET num := num + 1;

                UPDATE employees
                SET
                    salary = salary * 1.1
                    WHERE
                        TRUE;
        END IF;

    END LOOP label;
END //

DELIMITER ;

SELECT
    AVG(IFNULL(salary, 0)) AS avg_sal
    FROM
        employees;

CALL update_salary_loop(@num);

SELECT
    @num
    FROM
        dual;
