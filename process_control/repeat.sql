/*
# REPEAT 循环结构
 */
USE dbtest16;

DELIMITER //

CREATE PROCEDURE test_repeat()
BEGIN
    DECLARE num INT DEFAULT 1;

    label:
    REPEAT
        SET num := num + 1;
    UNTIL num >= 10 END REPEAT label;

    SELECT
        num
        FROM
            dual;
END //

DELIMITER ;

CALL test_repeat();

# 当市场环境变好时，公司为了奖励大家，决定给大家涨工资
# 声明存储过程 update_salary_repeat()，声明 OUT 参数 num，输出循环次数
# 存储过程中实现循环给大家涨薪，薪资涨为原来的 1.15 倍
# 直到全公司的平均薪资达到 13000 结束，并统计循环次数
DELIMITER //

CREATE PROCEDURE update_salary_repeat(OUT num INT)
BEGIN
    DECLARE avg_sal DOUBLE;

    SET num := 0;

    label:
    REPEAT
        SET num := num + 1;

        UPDATE employees
        SET
            salary = salary * 1.15
            WHERE
                TRUE;

        SELECT
            AVG(salary)
            INTO avg_sal
            FROM
                employees;
    UNTIL avg_sal >= 13000 END REPEAT label;
END //

DELIMITER ;

SELECT
    AVG(salary)
    FROM
        employees;

CALL update_salary_repeat(@num);

SELECT
    @num
    FROM
        dual;
