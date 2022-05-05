/*
# CHECK 约束

- MySQL 5.7 不支持
- MySQL 8.0 支持
 */
SELECT VERSION();

USE dbtest13;

CREATE TABLE test10
(
    id        INT,
    last_name VARCHAR(15),
    salary    DECIMAL(10, 2) CHECK (salary > 2000)
);

DESC test10;

SELECT *
    FROM
        information_schema.table_constraints
    WHERE
          constraint_schema = 'dbtest13'
      AND table_name = 'test10';

INSERT INTO
    test10(id, last_name, salary)
    VALUES
        (1, 'Tom', 2500);

SELECT *
    FROM
        test10;

# 修改失败
UPDATE test10
SET
    salary = 1000
    WHERE
        id = 1;
