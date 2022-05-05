/*
# 整数类型
 */
USE dbtest12;

CREATE TABLE test_int1
(
    f1 TINYINT,
    f2 SMALLINT,
    f3 MEDIUMINT,
    f4 INT,
    f5 BIGINT
);

DESC test_int1;

INSERT INTO
    test_int1(f1)
    VALUES
        (12),
        (-12),
        (-128),
        (127);

SELECT *
    FROM
        test_int1;

/*
## 可选属性

- M
 */
CREATE TABLE test_int2
(
    f1 INT,
    f2 INT(5),
    f3 INT(5) ZEROFILL # 当不足宽度时使用 0 填充，当使用 ZEROFILL，自动使用 UNSIGNED
);

SHOW CREATE TABLE test_int2;

DESC test_int2;

INSERT INTO
    test_int2(f1, f2, f3)
    VALUES
        (123, 123, 123),
        (123456, 123456, 123456);

SELECT *
    FROM
        test_int2;

/*
- UNSIGNED
 */
CREATE TABLE test_int3
(
    f1 TINYINT UNSIGNED
);

DESC test_int3;
