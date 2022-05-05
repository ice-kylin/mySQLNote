/*
# 默认值约束
 */
USE dbtest13;

/*
## 在 CREATE TABLE 时添加约束
 */
CREATE TABLE test11
(
    id        INT,
    last_name VARCHAR(15),
    salary    DECIMAL(10, 2) DEFAULT 2000
);

DESC test11;

INSERT INTO
    test11(id, last_name, salary)
    VALUES
        (1, 'Tom', 3000);

SELECT *
    FROM
        test11;

INSERT INTO
    test11(id, last_name)
    VALUES
        (2, 'Jerry');

SELECT *
    FROM
        test11;

/*
## 在 ALTER TABLE 的时候添加约束
 */
CREATE TABLE test12
(
    id        INT,
    last_name VARCHAR(15),
    salary    DECIMAL(10, 2)
);

DESC test12;

ALTER TABLE test12
    MODIFY salary DECIMAL(10, 2) DEFAULT 2500;

DESC test12;

/*
## 在 ALTER TABLE 的时候删除约束
 */
ALTER TABLE test12
    MODIFY salary DECIMAL(10, 2);

DESC test12;
