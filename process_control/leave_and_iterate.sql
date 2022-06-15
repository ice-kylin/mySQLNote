/*
# 跳转语句

## LEAVE 跳转语句
 */
USE dbtest16;

# 创建存储过程 leave_begin()，声明 INT 类型的 IN 参数 num
# 给 BEGIN END 加标记名，并在 BEGIN END 中使用 IF 语句判断 num 参数的值
# 如果 num <= 0，则使用 LEAVE 语句退出 BEGIN END
# 如果 num = 1，则查询 employees 表的平均薪资
# 如果 num = 2，则查询 employees 表的最低薪资
# 如果 num > 2，则查询 employees 表的最高薪资
# IF 语句结束后查询 employees 表的总人数
DELIMITER //

CREATE PROCEDURE leave_begin(IN num INT)
label:
BEGIN
    IF num <= 0
        THEN
            LEAVE label;
        ELSEIF num = 1
            THEN
                SELECT
                    AVG(salary)
                    FROM
                        employees;
        ELSEIF num = 2
            THEN
                SELECT
                    MIN(salary)
                    FROM
                        employees;
        ELSE
            SELECT
                MAX(salary)
                FROM
                    employees;
    END IF;

    SELECT
        COUNT(*)
        FROM
            employees;
END //

DELIMITER ;

CALL leave_begin(0);
CALL leave_begin(1);

# 当市场环境不好时，公司为了渡过难关，决定暂时降低大家的薪资
# 声明存储过程 leave_while()，声明 OUT 参数 num，输出循环次数
# 存储过程中使用 WHILE 循环给大家降低薪资为原来薪资的 90%，直到全公
# 司的平均薪资小于等于 10000，并统计循环次数
DELIMITER //

CREATE PROCEDURE leave_while(OUT num INT)
BEGIN
    DECLARE avg_sal DOUBLE;

    SET num := 0;

    SELECT
        AVG(salary)
        INTO avg_sal
        FROM
            employees;

    while_label:
    WHILE TRUE
        DO
            IF avg_sal > 10000
                THEN
                    SET num := num + 1;

                    UPDATE employees
                    SET
                        salary = salary * 0.9;

                    SELECT
                        AVG(salary)
                        INTO avg_sal
                        FROM
                            employees;
                ELSE
                    LEAVE while_label;
            END IF;
        END WHILE while_label;

END //

DELIMITER ;

SELECT
    AVG(salary)
    FROM
        employees;

CALL leave_while(@num);

SELECT
    @num
    FROM
        dual;

/*
## ITERATE 跳转语句

- 只能用在循环语句中（LOOP、REPEAT 和 WHILE 语句）内，表示重新开始循环
 */
# 定义局部变量 num，初始值为 0
# 循环结构中执行 num + 1 操作
# 如果 num < 10，则继续执行循环
# 如果 num > 15，则退出循环结构
DELIMITER //

CREATE PROCEDURE test_iterate()
BEGIN
    DECLARE num INT DEFAULT 0;

    loop_label:
    LOOP
        SET num := num + 1;

        IF num < 10
            THEN
                ITERATE loop_label;
            ELSEIF num > 15
                THEN
                    LEAVE loop_label;
        END IF;

        SELECT
            'icekylin' AS str
            FROM
                dual;
    END LOOP loop_label;
END //

DELIMITER ;

CALL test_iterate();
