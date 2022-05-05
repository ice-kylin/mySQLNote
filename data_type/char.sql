/*
# 文本字符串类型

## CHAR 和 VARCHAR 类型

### CHAR 类型
 */
USE dbtest12;

CREATE TABLE test_char1
(
    f1 CHAR,
    f2 CHAR(5)
);

DESC test_char1;

INSERT INTO
    test_char1(f1, f2)
    VALUES
        ('a', 'a'),
        ('a', 'abcde');

SELECT
    CONCAT(f1, '*'),
    CONCAT(f2, '*')
    FROM
        test_char1;

/*
### VARCHAR 类型
 */
CREATE TABLE test_varchar1
(
    f1 VARCHAR(5)
);

INSERT INTO
    test_varchar1(f1)
    VALUES
        ('a'),
        ('hello'),
        ('一二三四五');

SELECT *
    FROM
        test_varchar1;

/*
## TEXT 类型
 */
CREATE TABLE test_text1
(
    f1 TEXT
);

INSERT INTO
    test_text1
    VALUES
        ('hello     ');

SELECT
    f1,
    CHAR_LENGTH(f1)
    FROM
        test_text1;

/*
## ENUM 类型
 */
CREATE TABLE test_enum1
(
    f1 ENUM ('春','夏','秋','冬','unknown')
);

INSERT INTO
    test_enum1
    VALUES
        ('春'),
        ('秋');

INSERT INTO
    test_enum1
    VALUES
        ('UNKNOWN'); # 忽略大小写

INSERT INTO
    test_enum1
    VALUES
        (1), # 使用索引进行枚举元素的调用
        ('3');

SELECT *
    FROM
        test_enum1;

/*
## SET 类型
 */
CREATE TABLE test_set1
(
    f1 SET ('A','B','C')
);

DESC test_set1;

INSERT INTO
    test_set1
    VALUES
        ('A'),
        ('A,B'),
        ('A,B,C,A');

SELECT *
    FROM
        test_set1;
