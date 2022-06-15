/*
# WHILE 循环结构

- 凡是循环结构，一定具备 4 要素
  - 初始化条件
  - 循环条件
  - 循环体
  - 迭代条件
 */
USE dbtest16;

DELIMITER //

CREATE PROCEDURE test_while()
BEGIN
    DECLARE num INT DEFAULT 1;

    label:
    WHILE num < 10
        DO
            SET num := num + 1;
        END WHILE label;

    SELECT
        num
        FROM
            dual;
END //

DELIMITER ;

CALL test_while();

# 市场环境不好时，公司为了渡过难关，决定暂时降低大家的薪资
# 声明存储过程 update_salary_while()，声明 OUT 参数 num，输出循环次数
# 存储过程中实现循环给大家降薪，薪资降为原来的 90%
# 直到全公司的平均薪资达到 5000 结束，并统计循环次数
DELIMITER //

CREATE PROCEDURE update_salary_while(OUT num INT)
BEGIN
    DECLARE avg_sal DOUBLE;

    SET num := 0;

    SELECT
        AVG(salary)
        INTO avg_sal
        FROM
            employees;

    WHILE avg_sal > 5000
        DO
            SET num := num + 1;

            UPDATE employees
            SET
                salary = salary * 0.9
                WHERE
                    TRUE;

            SELECT
                AVG(salary)
                INTO avg_sal
                FROM
                    employees;
        END WHILE;
END //

DELIMITER ;

SELECT
    AVG(salary)
    FROM
        employees;

CALL update_salary_while(@num);

SELECT
    @num
    FROM
        dual;
