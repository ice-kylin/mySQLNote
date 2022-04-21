/*
# 函数

- 单行函数
- 多行函数

## 数值函数
 */
# 基本操作
SELECT
    ABS(-123),
    ABS(32),
    SIGN(-23),
    SIGN(43),
    PI(),
    CEIL(32.2),
    CEILING(-33.1),
    FLOOR(32.32),
    FLOOR(-43.23),
    MOD(12, 5),
    12 MOD 5,
    12 % 5
    FROM
        dual;

# 取随机数
SELECT
    RAND(),
    RAND(),
    RAND(10),
    RAND(10),
    RAND(-1),
    RAND(-1)
    FROM
        dual;

# 四舍五入
SELECT
    ROUND(123.456),
    ROUND(123.456, 0),
    ROUND(123.456, 1),
    ROUND(123.456, 2),
    ROUND(123.456, -1),
    ROUND(153.456, -2)
    FROM
        dual;

# 截断操作
SELECT
    TRUNCATE(123.456, 0),
    TRUNCATE(123.496, 1),
    TRUNCATE(129.45, -1)
    FROM
        dual;

# 开方
SELECT
    SQRT(4)
    FROM
        dual;

# 角度与弧度的互换
SELECT
    RADIANS(180),
    RADIANS(90),
    RADIANS(360),
    DEGREES(2 * PI()),
    DEGREES(PI()),
    DEGREES(PI() / 2)
    FROM
        dual;

# 三角函数
SELECT
    SIN(RADIANS(30)),
    DEGREES(ASIN(SIN(RADIANS(30)))),
    SIN(RADIANS(60))
    FROM
        dual;

# 指数和对数
SELECT
    POW(2, 2),
    POW(2, 4),
    EXP(1),
    EXP(2)
    FROM
        dual;

SELECT
    LN(EXP(2)),
    LOG(EXP(2)),
    LOG10(10),
    LOG2(2)
    FROM
        dual;

# 进制间的转换
SELECT
    BIN(10),
    HEX(10),
    OCT(10),
    CONV(10, 2, 10)
    FROM
        dual;

/*
## 字符串函数
 */
SELECT
    ASCII('abc'),
    ASCII('A'),
    CHAR_LENGTH('hello'),
    CHAR_LENGTH('好耶'),
    LENGTH('hello'),
    LENGTH('好耶')
    FROM
        dual;

SELECT
    CONCAT(e.last_name, ' worked for ', IFNULL(m.last_name, 'nobody'), '.') "work"
    FROM
        employees e
            LEFT JOIN employees m ON e.manager_id = m.employee_id;

SELECT
    CONCAT_WS('-', 'hello', 'sql')
    FROM
        dual;

SELECT
    INSERT('helloworld', 2, 3, 'aaaaa'),
    INSERT('hellosql', 6, 7, 'World'),
    REPLACE('hello', 'll', 'mmm')
    FROM
        dual;

SELECT
    UPPER('abc'),
    LOWER('ABC')
    FROM
        dual;

SELECT
    LEFT('Hello', 2),
    RIGHT('Hello', 3)
    FROM
        dual;

/*
- `LPAD()`：实现右对齐效果
- `RPAD()`：实现左对齐效果
 */
SELECT
    employee_id,
    last_name,
    LPAD(salary, 10, '*'),
    LPAD(salary, 10, ' ')
    FROM
        employees;

SELECT
    CONCAT('*', TRIM('  Hello  '), '*'),
    CONCAT('*', RTRIM('  Hello  '), '*'),
    CONCAT('*', LTRIM('  Hello  '), '*'),
    CONCAT('*', TRIM('a' FROM 'aaaHelloaaa'), '*'),
    CONCAT('*', TRIM(LEADING 'a' FROM 'aaaHelloaaa'), '*'),
    CONCAT('*', TRIM(TRAILING 'a' FROM 'aaaHelloaaa'), '*')
    FROM
        dual;

SELECT
    REPEAT('Hello', 3),
    LENGTH(SPACE(5)),
    CONCAT('*', SPACE(5), '*')
    FROM
        dual;

SELECT
    STRCMP('abc', 'abd')
    FROM
        dual;

SELECT
    SUBSTR('Hello', 2, 2),
    LOCATE('ll', 'Hello'),
    LOCATE('lll', 'Hello')
    FROM
        dual;

SELECT
    ELT(2, 'a', 'b', 'c', 'd'),
    FIELD('mm', 'gg', 'jj', 'mm', 'dd', 'mm')
    FROM
        dual;

SELECT
    FIND_IN_SET('mm', 'gg,jj,mm,dd,mm')
    FROM
        dual;

SELECT
    REVERSE('Hello')
    FROM
        dual;

SELECT
    employee_id,
    NULLIF(LENGTH(first_name), LENGTH(last_name))
    FROM
        employees;
