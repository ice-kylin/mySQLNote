/*
# 日期和时间函数

## 获取日期、时间
 */
SELECT
    CURRENT_DATE(),
    CURRENT_TIME(),
    NOW(),
    UTC_DATE(),
    UTC_TIME()
    FROM
        dual;

/*
## 日期与时间戳转换
 */
SELECT
    UNIX_TIMESTAMP(),
    FROM_UNIXTIME(UNIX_TIMESTAMP()),
    UNIX_TIMESTAMP('2022-04-18 21:30:00'),
    FROM_UNIXTIME(UNIX_TIMESTAMP('2022-04-18 21:30:00'))
    FROM
        dual;

/*
## 获取月份、星期、星期数、天数等的函数
 */
SELECT
    YEAR(CURRENT_DATE()),
    MONTH(CURRENT_DATE()),
    DAY(CURRENT_DATE()),
    HOUR(CURRENT_TIME()),
    MINUTE(CURTIME()),
    SECOND(SYSDATE())
    FROM
        dual;

SELECT
    MONTHNAME('2022-04-18'),
    DAYNAME(NOW()),
    WEEKDAY(NOW()),
    QUARTER(CURDATE()),
    WEEK(CURDATE()),
    DAYOFYEAR(CURDATE()),
    DAYOFMONTH(CURDATE()),
    DAYOFWEEK(CURDATE())
    FROM
        dual;

/*
## 日期的操作函数
 */
SELECT
    EXTRACT(SECOND FROM NOW()),
    EXTRACT(DAY FROM NOW()),
    EXTRACT(HOUR_MINUTE FROM NOW()),
    EXTRACT(QUARTER FROM NOW()),
    EXTRACT(QUARTER FROM '2002-07-02')
    FROM
        dual;

/*
## 时间和秒钟的转换函数
 */
SELECT
    TIME_TO_SEC(NOW()),
    SEC_TO_TIME(TIME_TO_SEC(CURTIME()))
    FROM
        dual;

/*
## 计算日期和时间的函数
 */
SELECT
    DATE_ADD(NOW(), INTERVAL 1 YEAR),
    ADDDATE(NOW(), INTERVAL -1 YEAR),
    DATE_SUB(NOW(), INTERVAL 1 WEEK),
    DATE_SUB(CURDATE(), INTERVAL '1_1' MINUTE_SECOND)
    FROM
        dual;

SELECT
    ADDTIME(NOW(), 20),
    SUBTIME(NOW(), 20),
    SUBTIME(NOW(), '1:1:3'),
    DATEDIFF(NOW(), '2022-07-02'),
    TIMEDIFF(NOW(), ADDTIME(NOW(), 30)),
    FROM_DAYS(366),
    TO_DAYS('0000-12-25'),
    LAST_DAY(NOW()),
    MAKEDATE(YEAR(NOW()), 32),
    MAKETIME(10, 11, 12),
    PERIOD_ADD(20220101010101, 10)
    FROM
        dual;


/*
## 日期和时间的格式化与解析

- 格式化：日期 -> 字符串
- 解析：字符串 -> 日期

### 格式化
 */
SELECT
    DATE_FORMAT(CURDATE(), '%Y-%M-%D'),
    DATE_FORMAT(NOW(), '%Y-%m-%d'),
    DATE_FORMAT(NOW(), '%h:%i:%S'),
    DATE_FORMAT(NOW(), '%Y-%m-%d %h:%i:%S %W %w %T %r')
    FROM
        dual;

/*
### 解析：格式化的逆过程
 */
SELECT
    STR_TO_DATE('2022-04-18 11:03:50 Monday 1', '%Y-%m-%d %h:%i:%S %W')
    FROM
        dual;

SELECT
    GET_FORMAT(DATE, 'USA'),
    GET_FORMAT(TIME, 'USA'),
    GET_FORMAT(DATETIME, 'USA')
    FROM
        dual;
