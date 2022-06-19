/*
# 课后练习 1：流程控制
 */
USE test16_var_cur;

# 1. 创建函数 test_if_case()，实现传入成绩
# 如果成绩 > 90，返回 A，如果成绩 > 80，返回 B，如果成绩 > 60，返回 C，否则返回 D
# 要求：分别使用 if 结构和 case 结构实现
DELIMITER //

CREATE FUNCTION test_if_case1(score DOUBLE)
    RETURNS CHAR(1)
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    IF score > 90
        THEN
            RETURN 'A';
        ELSEIF score > 80
            THEN
                RETURN 'B';
        ELSEIF score > 60
            THEN
                RETURN 'C';
        ELSE
            RETURN 'D';
    END IF;
END //

DELIMITER ;

SELECT
    test_if_case1(98),
    test_if_case1(56)
    FROM
        dual;

DELIMITER //

CREATE FUNCTION test_if_case2(score DOUBLE)
    RETURNS CHAR(1)
    DETERMINISTIC
    CONTAINS SQL
    READS SQL DATA
BEGIN
    CASE
        WHEN score > 90
            THEN RETURN 'A';
        WHEN score > 80
            THEN RETURN 'B';
        WHEN score > 60
            THEN RETURN 'C';
            ELSE RETURN 'D';
    END CASE;
END //

DELIMITER ;

SELECT
    test_if_case2(76),
    test_if_case2(56)
    FROM
        dual;

# 2. 创建存储过程 test_if_pro()，传入工资值
# 如果工资值 < 3000，则删除工资为此值的员工
# 如果 3000 <= 工资值 <= 5000，则修改此工资值的员工薪资涨 1000，否则涨工资 500
DELIMITER //

CREATE PROCEDURE test_if_pro(IN sal DOUBLE)
BEGIN
    IF sal < 3000
        THEN
            DELETE
                FROM
                    employees
                WHERE
                    salary = sal;
        ELSEIF sal <= 5000
            THEN
                UPDATE employees
                SET
                    salary = salary + 1000
                    WHERE
                        salary = sal;
        ELSE
            UPDATE employees
            SET
                salary = salary + 500
                WHERE
                    salary = sal;
    END IF;
END //

DELIMITER ;

SELECT *
    FROM
        employees;

CALL test_if_pro(2900);
CALL test_if_pro(3100);
CALL test_if_pro(25500);

# 3. 创建存储过程 insert_data()，传入参数为 IN 的 INT 类型变量 insert_count
# 实现向 admin 表中批量插入 insert_count 条记录

CREATE TABLE admin
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(25) NOT NULL,
    user_pwd  VARCHAR(35) NOT NULL
);

SELECT *
    FROM
        admin;

DELIMITER //

CREATE PROCEDURE insert_data(IN insert_count INT)
BEGIN
    DECLARE i INT DEFAULT 0;

    WHILE i < insert_count
        DO
            INSERT INTO
                admin(user_name, user_pwd)
                VALUES
                    (CONCAT('name - ', i), MD5(ROUND(RAND() * 100000)));

            SET i := i + 1;
        END WHILE;
END //

DELIMITER ;

CALL insert_data(100);
