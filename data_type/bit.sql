/*
# 位类型
 */
USE dbtest12;

CREATE TABLE test_bit1
(
    f1 BIT,
    f2 BIT(5),
    f3 BIT(64)
);

DESC test_bit1;

INSERT INTO
    test_bit1(f1, f2)
    VALUES
        (0, 0),
        (1, 31);

SELECT *
    FROM
        test_bit1;

SELECT
    BIN(f1),
    HEX(f1),
    f1 + 0, # 加 0 后可以以十进制的方式显示数据
    BIN(f2),
    HEX(f2),
    f2 + 0
    FROM
        test_bit1;
