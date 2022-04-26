/*
# 函数

- 单行函数
- 多行函数

## 数值函数
 */
#
基本操作
SELECT
    abs(-123),
    abs(32),
    sign(-23),
    sign(43),
    pi(),
    ceil(32.2),
    ceiling(-33.1),
    floor(32.32),
    floor(-43.23),
    mod(12, 5),
    12 AS mod 5, 12 % 5
    FROM
        dual;

#
取随机数
SELECT
    rand(),
    rand(),
    rand(10),
    rand(10),
    rand(-1),
    rand(-1)
    FROM
        dual;

#
四舍五入
SELECT
    round(123.456),
    round(123.456, 0),
    round(123.456, 1),
    round(123.456, 2),
    round(123.456, -1),
    round(153.456, -2)
    FROM
        dual;

#
截断操作
SELECT
    truncate(123.456, 0),
    truncate(123.496, 1),
    truncate(129.45, -1)
    FROM
        dual;

#
开方
SELECT
    sqrt(4)
    FROM
        dual;

#
角度与弧度的互换
SELECT
    radians(180),
    radians(90),
    radians(360),
    degrees(2 * pi()),
    degrees(pi()),
    degrees(pi() / 2)
    FROM
        dual;

#
三角函数
SELECT
    sin(radians(30)),
    degrees(asin(sin(radians(30)))),
    sin(radians(60))
    FROM
        dual;

#
指数和对数
SELECT
    pow(2, 2),
    pow(2, 4),
    exp(1),
    exp(2)
    FROM
        dual;

SELECT
    ln(exp(2)),
    log(exp(2)),
    log10(10),
    log2(2)
    FROM
        dual;

#
进制间的转换
SELECT
    bin(10),
    hex(10),
    oct(10),
    conv(10, 2, 10)
    FROM
        dual;

/*
## 字符串函数
 */
SELECT
    ascii('abc'),
    ascii('A'),
    CHAR_LENGTH('hello'),
    CHAR_LENGTH('好耶'),
    length('hello'),
    length('好耶')
    FROM
        dual;

SELECT
    concat(e.last_name, ' worked for ', ifnull(m.last_name, 'nobody'), '.') AS "work"
    FROM
        employees e
            LEFT JOIN employees m ON e.manager_id = m.employee_id;

SELECT
    concat_ws('-', 'hello', 'sql')
    FROM
        dual;

SELECT
INSERT
(
'helloworld'
,
2
,
3
,
'aaaaa'
)
,
INSERT
(
'hellosql'
,
6
,
7
,
'World'
)
,
REPLACE
(
'hello'
,
'll'
,
'mmm'
)
    FROM
        dual;

SELECT
    UPPER('abc'),
    LOWER('ABC')
    FROM
        dual;

SELECT
    LEFT (
    'Hello', 2),
    RIGHT (
    'Hello', 3)
    FROM
        dual;

/*
- `LPAD()`：实现右对齐效果
- `RPAD()`：实现左对齐效果
 */
SELECT
    employee_id,
    last_name,
    lpad(salary, 10, '*'),
    lpad(salary, 10, ' ')
    FROM
        employees;

SELECT
    concat('*', TRIM('  Hello  '), '*'),
    concat('*', rtrim('  Hello  '), '*'),
    concat('*', ltrim('  Hello  '), '*'),
    concat('*', TRIM('a' FROM 'aaaHelloaaa'), '*'),
    concat('*', TRIM(LEADING 'a' FROM 'aaaHelloaaa'), '*'),
    concat('*', TRIM(TRAILING 'a' FROM 'aaaHelloaaa'), '*')
    FROM
        dual;

SELECT
    repeat('Hello', 3),
    length(SPACE(5)),
    concat('*', SPACE(5), '*')
    FROM
        dual;

SELECT
    strcmp('abc', 'abd')
    FROM
        dual;

SELECT
    substr('Hello', 2, 2),
    locate('ll', 'Hello'),
    locate('lll', 'Hello')
    FROM
        dual;

SELECT
    elt(2, 'a', 'b', 'c', 'd'),
    field('mm', 'gg', 'jj', 'mm', 'dd', 'mm')
    FROM
        dual;

SELECT
    find_in_set('mm', 'gg,jj,mm,dd,mm')
    FROM
        dual;

SELECT
    reverse('Hello')
    FROM
        dual;

SELECT
    employee_id,
    NULLIF(length(first_name), length(last_name))
    FROM
        employees;
