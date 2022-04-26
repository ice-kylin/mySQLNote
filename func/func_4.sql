/*
# 加密与解密函数
 */
SELECT
    password('HelloMySQL')
    FROM
        dual;

SELECT
    md5('HelloMySQL'),
    sha('HelloMySQL')
    FROM
        dual;

SELECT
    encode('hello', 'world'),
    decode(encode('hello', 'world'), 'world')
    FROM
        dual;

/*
# mySQL 信息函数
 */
SELECT
    version(),
    connection_id(),
    database(),
    SCHEMA (
    ),
    USER (
    ),
    CURRENT_USER (
    ),
    CHARSET(
    '你好'),
    COLLATION (
    '你好')
    FROM
        dual;

/*
# 其它函数
 */
#
如果 n 的值小于等于 0
，则只保留整数部分
SELECT
    format(123.125, 2),
    format(123.125, 0),
    format(123.125, -2)
    FROM
        dual;

SELECT
    conv(16, 10, 2),
    conv(8888, 10, 16),
    conv(NULL, 10, 2)
    FROM
        dual;

SELECT
    inet_aton('192.168.1.100'),
    inet_ntoa(inet_aton('192.168.1.100'))
    FROM
        dual;

SELECT
    benchmark(10000, md5('HelloWorld'))
    FROM
        dual;

SELECT
    charset('Hello'),
    charset(CONVERT('Hello' USING 'gbk'))
    FROM
        dual;
