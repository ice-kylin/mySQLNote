/*
# 约束

## 基础知识

- 为了保证数据的完整性所以需要约束
- 对表中字段的限制是约束
- 约束的分类
  - 约束的字段的个数
    - 单列约束 vs. 多列约束
  - 约束的作用范围
    - 列级约束：声明此约束时将此约束声明在对应字段的后面
    - 表级约束：在表中所有字段都声明完，在所有字段后面声明的约束
  - 约束的作用（功能）
    - NOT NULL（非空约束）
    - UNIQUE（唯一性约束）
    - PRIMARY KEY（主键约束）
    - FOREIGN KEY（外键约束）
    - CHECK（检查约束）
    - DEFAULT（默认值约束）

## 如何添加约束

- CREATE TABLE 时添加约束
- ALTER TABLE 时增加、删除约束

## 如何查看表中的约束
 */
SELECT *
    FROM
        information_schema.table_constraints
    WHERE
        table_name = 'employees';

CREATE DATABASE dbtest13;

USE dbtest13;

/*
## NOT NULL（非空约束）
 */
CREATE TABLE test1
(
    id        INT         NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    email     VARCHAR(25),
    salary    DECIMAL(10, 2)
);

DESC test1;

INSERT INTO
    test1
    VALUES
        (1, 'Tom', 'tom@126.com', 3400);

SELECT *
    FROM
        test1;

ALTER TABLE test1
    MODIFY email VARCHAR(25) NOT NULL;

DESC test1;
