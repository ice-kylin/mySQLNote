/*
# DCL 中的 COMMIT 和 ROLLBACK

## COMMIT

- 提交数据
- 一旦执行，则数据就被永久的保存在了数据库中，意味着数据不可以回滚

## ROLLBACK

- 回滚数据
- 一旦执行 ROLLBACK，则可以实现数据的回滚
- 回滚到最近的一次 COMMIT 之后

## 对比 TRUNCATE TABLE 和 DELETE FROM

- 相同点
  - 都可以实现对表中所有数据的删除，同时保留表结构
- 不同点
  - TRUNCATE TABLE：一旦执行此操作，表数据全部清除；同时，数据是不可以回滚的
  - DELETE FROM：一旦执行此操作，表数据可以全部清除（不带 WHERE）；同时，数据是可以实现回滚的

## DDL 和 DCL 的说明

- DDL 的操作一旦执行，就不可回滚
  - 指令 `SET autocommit = FALSE` 对 DDL 操作失效
  - 因为在执行完 DDL 操作之后，一定会执行一次 COMMIT，而此操作不受 `SET autocommit = FALSE` 影响
- DML 的操作
  - 默认情况下，一旦执行也是不可回滚的
  - 如果在执行 DML 之前执行了 `SET autocommit = FALSE`，则执行的 DML 操作就可以实现回滚了
 */
# DELETE FROM
COMMIT;

SELECT *
    FROM
        my_emp_3;

SET AUTOCOMMIT = FALSE;

DELETE
    FROM
        my_emp_3;

ROLLBACK;

# TRUNCATE TABLE
COMMIT;

SELECT *
    FROM
        my_emp_3;

SET AUTOCOMMIT = FALSE;

TRUNCATE TABLE my_emp_3;

ROLLBACK;

/*
## 测试 MySQL 的新特性：DDL 的原子化
 */
CREATE DATABASE IF NOT EXISTS mytest;

USE mytest;

CREATE TABLE IF NOT EXISTS book1
(
    book_id   INT,
    book_name VARCHAR(255)
);

DROP TABLE book1, book2;

SHOW TABLES;
