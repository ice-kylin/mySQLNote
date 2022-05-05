/*
# 定点数类型
 */
USE dbtest12;

CREATE TABLE test_decimal1
(
    f1 DECIMAL,
    f2 DECIMAL(5, 2)
);

DESC test_decimal1;

INSERT INTO
    test_decimal1(f1, f2)
    VALUES
        (123, 123.45),
        (999.99, 123.456); # 存在四舍五入

SELECT *
    FROM
        test_decimal1;

/*
## 精度问题
 */
CREATE TABLE test_decimal2
(
    f1 DECIMAL(5, 2)
);

INSERT INTO
    test_decimal2
    VALUES
        (0.47),
        (0.44),
        (0.19);

SELECT
    SUM(f1)
    FROM
        test_decimal2;
