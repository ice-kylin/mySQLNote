/*
# 二进制字符串类型

## BINARY 与 VARBINARY 类型
 */
CREATE TABLE test_binary1
(
    f1 BINARY,
    f2 BINARY(3),
    f3 VARBINARY(10)
);

DESC test_binary1;

INSERT INTO
    test_binary1
    VALUES
        ('a', 'a', 'a');

SELECT *,
       LENGTH(f1),
       LENGTH(f2),
       LENGTH(f3)
    FROM
        test_binary1;

/*
## BLOB 类型
 */
CREATE TABLE test_blob1
(
    id  INT,
    img MEDIUMBLOB
);

DESC test_blob1;

SELECT *
    FROM
        test_blob1;
