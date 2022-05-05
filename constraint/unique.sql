/*
# UNIQUE（唯一性约束）
 */
USE dbtest13;

CREATE TABLE test2
(
    id        INT UNIQUE,                    # 列级约束
    last_name VARCHAR(15),
    email     VARCHAR(25),
    salary    DECIMAL(10, 2),
    CONSTRAINT uk_test2_email UNIQUE (email) # 表级约束
);

DESC test2;

# 在创建唯一约束的时候，如果不给唯一约束命名，就默认和列名字相同
SELECT *
    FROM
        information_schema.table_constraints
    WHERE
        table_name = 'test2';

INSERT INTO
    test2
    VALUES
        (1, 'Tom', 'tom@126.com', 4500),
        (2, 'Jerry', NULL, 4600), # 可以向声明为 UNIQUE 的字段添加上 NULL 值
        (3, 'Dick', NULL, 4600); # 并且可以多次添加

SELECT *
    FROM
        test2;

/*
## 在 ALTER TABLE 时添加约束
 */
UPDATE test2
SET
    salary = 5000
    WHERE
        id = 3;

ALTER TABLE test2
    ADD CONSTRAINT uk_test2_sal UNIQUE (salary);

DESC test2;

ALTER TABLE test2
    MODIFY last_name VARCHAR(15) UNIQUE;

DESC test2;

/*
## 复合的唯一性约束
 */
CREATE TABLE `user`
(
    id     INT UNSIGNED UNIQUE,
    `name` VARCHAR(15),
    pwd    VARCHAR(25),
    CONSTRAINT uk_user_name_pwd UNIQUE (`name`, pwd)
);

DESC `user`;

SELECT *
    FROM
        information_schema.table_constraints
    WHERE
          constraint_schema = 'dbtest13'
      AND table_name = 'user';

INSERT INTO
    `user`
    VALUES
        (1, 'Tom', '2333'),
        (2, 'Jerry', '2333');

SELECT *
    FROM
        `user`;

/*
## 删除唯一性约束
 */
SELECT *
    FROM
        information_schema.table_constraints
    WHERE
          constraint_schema = 'dbtest13'
      AND table_name = 'test2';

DESC test2;

ALTER TABLE test2
    DROP INDEX last_name;

ALTER TABLE test2
    DROP INDEX uk_test2_sal;
