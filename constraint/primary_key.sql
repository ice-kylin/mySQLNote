/*
# PRIMARY KEY 约束
 */
USE dbtest13;

/*
- 主键约束特征：非空且唯一，用于唯一的标识表中的一条记录
 */
CREATE TABLE test4
(
    id        INT PRIMARY KEY,
    last_name VARCHAR(15),
    salary    DECIMAL(10, 2),
    email     VARCHAR(25)
);

CREATE TABLE test5
(
    id        INT,
    last_name VARCHAR(15),
    salary    DECIMAL(10, 2),
    email     VARCHAR(25),
    PRIMARY KEY (id) # 没有必要起名
);

DESC test4;

DESC test5;

SELECT *
    FROM
        information_schema.table_constraints
    WHERE
        table_name IN ('test4', 'test5');

/*
## 在 ALTER TABLE 时添加约束
 */
CREATE TABLE test6
(
    id        INT,
    last_name VARCHAR(15),
    email     VARCHAR(25),
    salary    DECIMAL(10, 2)
);

DESC test6;

ALTER TABLE test6
    ADD PRIMARY KEY (id);

DESC test6;

/*
## 删除主键约束（实际开发中不会去删除）
 */
ALTER TABLE test6
    DROP PRIMARY KEY;

DESC test6;
