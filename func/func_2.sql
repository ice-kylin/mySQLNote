/*
# 日期和时间函数

## 获取日期、时间
 */
SELECT
    CURRENT_DATE(),
    CURRENT_TIME(),
    now(),
    utc_date(),
    utc_time()
    FROM
        dual;

/*
## 日期与时间戳转换
 */
SELECT
    unix_timestamp(),
    from_unixtime(unix_timestamp()),
    unix_timestamp('2022-04-18 21:30:00'),
    from_unixtime(unix_timestamp('2022-04-18 21:30:00'))
    FROM
        dual;

/*
## 获取月份、星期、星期数、天数等的函数
 */
SELECT
    YEAR (
    CURRENT_DATE (
    )),
    MONTH (
    CURRENT_DATE (
    )),
    DAY (
    CURRENT_DATE (
    )),
    HOUR (
    CURRENT_TIME (
    )),
    MINUTE (
    CURTIME(
    )),
    SECOND (
    SYSDATE(
    ))
    FROM
        dual;

SELECT
    monthname('2022-04-18'),
    dayname(now()),
    weekday(now()),
    quarter(curdate()),
    week(curdate()),
    dayofyear(curdate()),
    dayofmonth(curdate()),
    dayofweek(curdate())
    FROM
        dual;

/*
## 日期的操作函数
 */
SELECT
    EXTRACT(SECOND FROM now()),
    EXTRACT(DAY FROM now()),
    EXTRACT(hour_minute FROM now()),
    EXTRACT(quarter FROM now()),
    EXTRACT(quarter FROM '2002-07-02')
    FROM
        dual;

/*
## 时间和秒钟的转换函数
 */
SELECT
    time_to_sec(now()),
    sec_to_time(time_to_sec(curtime()))
    FROM
        dual;

/*
## 计算日期和时间的函数
 */
SELECT
    date_add(now(), INTERVAL 1 YEAR),
    adddate(now(), INTERVAL -1 YEAR),
    date_sub(now(), INTERVAL 1 WEEK),
    date_sub(curdate(), INTERVAL '1_1' MINUTE_SECOND)
    FROM
        dual;

SELECT
    addtime(now(), 20),
    subtime(now(), 20),
    subtime(now(), '1:1:3'),
    datediff(now(), '2022-07-02'),
    timediff(now(), addtime(now(), 30)),
    from_days(366),
    to_days('0000-12-25'),
    last_day(now()),
    makedate(YEAR(NOW()), 32),
    maketime(10, 11, 12),
    period_add(20220101010101, 10)
    FROM
        dual;


/*
## 日期和时间的格式化与解析

- 格式化：日期 -> 字符串
- 解析：字符串 -> 日期

### 格式化
 */
SELECT
    date_format(curdate(), '%Y-%M-%D'),
    date_format(now(), '%Y-%m-%d'),
    date_format(now(), '%h:%i:%S'),
    date_format(now(), '%Y-%m-%d %h:%i:%S %W %w %T %r')
    FROM
        dual;

/*
### 解析：格式化的逆过程
 */
SELECT
    str_to_date('2022-04-18 11:03:50 Monday 1', '%Y-%m-%d %h:%i:%S %W')
    FROM
        dual;

SELECT
    get_format(DATE, 'USA'),
    get_format(TIME, 'USA'),
    get_format(datetime, 'USA')
    FROM
        dual;
