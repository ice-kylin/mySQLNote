/*
# MySQL 8 新特性：计算列
 */
USE atguigudb;

CREATE TABLE IF NOT EXISTS test1
(
    a INT,
    b INT,
    c INT GENERATED ALWAYS AS (a + b) VIRTUAL
);

INSERT INTO
    test1(a, b)
    VALUES
        (1, 2),
        (3, 4);

SELECT *
    FROM
        test1;

UPDATE test1
SET
    a = 10,
    b = 20
    WHERE
        a = 1;

SELECT *
    FROM
        test1;
