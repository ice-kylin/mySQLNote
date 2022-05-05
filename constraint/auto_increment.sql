/*
# AUTO_INCREMENT（自增长列）

- 开发中一旦主键作用的字段上声明有 AUTO_INCREMENT，则添加数据时就不要给主键上赋值了
 */
USE dbtest13;

CREATE TABLE test7
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(15)
);

DESC test7;

# 当向主键的字段添加 0 或 NULL 时，会自动的往上添加指定的值
INSERT INTO
    test7
    VALUES
        (NULL, 'Tom'),
        (0, 'Jerry');

SELECT *
    FROM
        test7;

/*
## 在 ALTER TABLE 时添加 AUTO_INCREMENT
 */
CREATE TABLE test8
(
    id        INT PRIMARY KEY,
    last_name VARCHAR(15)
);

DESC test8;

ALTER TABLE test8
    MODIFY id INT AUTO_INCREMENT;

DESC test8;

/*
## 在 ALTER TABLE 时删除 AUTO_INCREMENT
 */
ALTER TABLE test8
    MODIFY id INT;

DESC test8;

/*
## MySQL 8.0 新特性：自增变量的持久化
 */
