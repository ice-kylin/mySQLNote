/*
# 浮点类型
 */
USE dbtest12;

CREATE TABLE test_double1
(
    f1 FLOAT,
    f2 FLOAT(5, 2),
    f3 DOUBLE,
    f4 DOUBLE(5, 2)
);

DESC test_double1;

INSERT INTO
    test_double1(f1, f2)
    VALUES
        (123.45, 123.45),
        (123.456, 123.456); # 存在四舍五入

SELECT *
    FROM
        test_double1;

/*
## 精度问题
 */
CREATE TABLE test_double2
(
    f1 DOUBLE
);

INSERT INTO
    test_double2
    VALUES
        (0.47),
        (0.44),
        (0.19);

SELECT
    SUM(f1)
    FROM
        test_double2;
