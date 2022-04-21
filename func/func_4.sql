/*
# 加密与解密函数
 */
SELECT
    PASSWORD('HelloMySQL')
    FROM
        dual;

SELECT
    MD5('HelloMySQL'),
    SHA('HelloMySQL')
    FROM
        dual;

SELECT
    ENCODE('hello', 'world'),
    DECODE(ENCODE('hello', 'world'), 'world')
    FROM
        dual;

/*
# mySQL 信息函数
 */
SELECT
    VERSION(),
    CONNECTION_ID(),
    DATABASE(),
    SCHEMA(),
    USER(),
    CURRENT_USER(),
    CHARSET('你好'),
    COLLATION('你好')
    FROM
        dual;

/*
# 其它函数
 */
# 如果 n 的值小于等于 0，则只保留整数部分
SELECT
    FORMAT(123.125, 2),
    FORMAT(123.125, 0),
    FORMAT(123.125, -2)
    FROM
        dual;

SELECT
    CONV(16, 10, 2),
    CONV(8888, 10, 16),
    CONV(NULL, 10, 2)
    FROM
        dual;

SELECT
    INET_ATON('192.168.1.100'),
    INET_NTOA(INET_ATON('192.168.1.100'))
    FROM
        dual;

SELECT
    BENCHMARK(10000, MD5('HelloWorld'))
    FROM
        dual;

SELECT
    CHARSET('Hello'),
    CHARSET(CONVERT('Hello' USING 'gbk'))
    FROM
        dual;
