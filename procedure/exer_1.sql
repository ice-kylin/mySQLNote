/*
# 课后练习
 */
CREATE DATABASE IF NOT EXISTS test15_pro_func;

USE test15_pro_func;

CREATE TABLE admin
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(15) NOT NULL,
    pwd       VARCHAR(25) NOT NULL
);

# 1. 创建存储过程 insert_user()，实现传入用户名和密码，插入到 admin 表中
DELIMITER //

CREATE PROCEDURE insert_user(IN u_n VARCHAR(15), IN passwd VARCHAR(25))
BEGIN
    INSERT INTO
        admin(user_name, pwd)
        VALUES
            (u_n, passwd);
END //

DELIMITER ;

CALL insert_user('Tom', 'abc123');

SELECT *
    FROM
        admin;

CREATE TABLE beauty
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(15) NOT NULL,
    phone  VARCHAR(15) UNIQUE,
    birth  DATE
);

INSERT INTO
    beauty(`name`, phone, birth)
    VALUES
        ('朱茵', '13201233453', '1982-02-12'),
        ('孙燕姿', '13501233653', '1980-12-09'),
        ('田馥甄', '13651238755', '1983-08-21'),
        ('邓紫棋', '17843283452', '1991-11-12'),
        ('刘若英', '18635575464', '1989-05-18'),
        ('杨超越', '13761238755', '1994-05-11');

SELECT *
    FROM
        beauty;

# 2. 创建存储过程 get_phone()，实现传入女神编号，返回女神姓名和女神电话
DELIMITER //

CREATE PROCEDURE get_phone(IN b_id INT, OUT b_name VARCHAR(15), OUT b_phone VARCHAR(15))
BEGIN
    SELECT
        `name`,
        phone
        INTO
            b_name,
            b_phone
        FROM
            beauty
        WHERE
            id = b_id;
END //

DELIMITER ;

CALL get_phone(1, @name, @phone);

SELECT
    @name,
    @phone
    FROM
        dual;

# 3. 创建存储过程 date_diff()，实现传入两个女神生日，返回日期间隔大小
DELIMITER //

CREATE PROCEDURE date_diff(IN birth1 DATE, IN birth2 DATE, OUT date_interval INT)
BEGIN
    SELECT
        DATEDIFF(birth1, birth2)
        INTO date_interval
        FROM
            dual;
END //

DELIMITER ;

SET @birth1 := '1992-10-30';
SET @birth2 := '1992-09-08';

CALL date_diff(@birth1, @birth2, @date_interval);

SELECT
    @date_interval
    FROM
        dual;

# 4. 创建存储过程 format_date()，实现传入一个日期，格式化成 xx年xx月xx日并返回
DELIMITER //

CREATE PROCEDURE format_date(IN date DATE, OUT f_date VARCHAR(11))
BEGIN
    SELECT
        DATE_FORMAT(date, '%Y年%m月%d日')
        INTO f_date
        FROM
            dual;
END //

DELIMITER ;

CALL format_date(CURDATE(), @f_date);

SELECT
    @f_date
    FROM
        dual;

# 5. 创建存储过程 beauty_limit()，根据传入的起始索引和条目数，查询女神表的记录
DELIMITER //

CREATE PROCEDURE beauty_limit(IN i INT, IN l INT)
BEGIN
    SELECT *
        FROM
            beauty
        LIMIT i, l;
END //

DELIMITER ;

CALL beauty_limit(1, 3);

# 6. 传入 a 和 b 两个值，最终 a 和 b 都翻倍并返回
# 创建带 INOUT 模式参数的存储过程
DELIMITER //

CREATE PROCEDURE double_int(INOUT a INT, INOUT b INT)
BEGIN
    SELECT
        2 * a,
        2 * b
        INTO
            a,
            b
        FROM
            dual;
END //

DELIMITER ;

SET @a := 233;
SET @b := 666;

CALL double_int(@a, @b);

SELECT
    @a,
    @b
    FROM
        dual;

# 7. 删除题目 5 的存储过程
DROP PROCEDURE IF EXISTS beauty_limit;

# 8. 查看题目 6 中存储过程的信息
SHOW CREATE PROCEDURE double_int;

SHOW PROCEDURE STATUS LIKE 'double_int';

SELECT *
    FROM
        information_schema.routines
    WHERE
          routine_name = 'double_int'
      AND routine_type = 'PROCEDURE';
