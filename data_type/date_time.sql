/*
# 日期与时间类型

## YEAR 类型
 */
USE dbtest12;

CREATE TABLE test_year1
(
    f1 YEAR,
    f2 YEAR(4)
);

DESC test_year1;

INSERT INTO
    test_year1(f1)
    VALUES
        ('2022'),
        ('2002');

SELECT *
    FROM
        test_year1;

INSERT INTO
    test_year1(f1)
    VALUES
        ('69'),
        ('70');

SELECT *
    FROM
        test_year1;

/*
## DATE 类型
 */
CREATE TABLE test_date1
(
    f1 DATE
);

DESC test_date1;

INSERT INTO
    test_date1
    VALUES
        ('2020-10-01'),
        ('20201001'),
        (20201001);

INSERT INTO
    test_date1
    VALUES
        ('00-01-01'),
        ('000101'),
        ('69-10-01'),
        ('691001'),
        ('70-01-01'),
        ('700101'),
        ('99-01-01'),
        ('990101');

INSERT INTO
    test_date1
    VALUES
        (CURRENT_DATE()),
        (NOW());

SELECT *
    FROM
        test_date1;

/*
# TIME 类型
 */
CREATE TABLE test_time1
(
    f1 TIME
);

DESC test_time1;

INSERT INTO
    test_time1
    VALUES
        ('2 12:30:29'),
        ('12:35:29'),
        ('12:40'),
        ('2 12:40'),
        ('1 05'),
        ('45');

INSERT INTO
    test_time1
    VALUES
        ('123520'),
        (124011),
        (1210);

INSERT INTO
    test_time1
    VALUES
        (NOW()),
        (CURRENT_TIME());

SELECT *
    FROM
        test_time1;

/*
## DATETIME 类型
 */
CREATE TABLE test_datetime1
(
    f1 DATETIME
);

DESC test_datetime1;

INSERT INTO
    test_datetime1
    VALUES
        ('2021-01-01 06:50:30'),
        ('20210101065030');

INSERT INTO
    test_datetime1
    VALUES
        ('99-01-01 00:00:00'),
        ('990101000000'),
        ('20-01-01 00:00:00'),
        ('200101000000');

INSERT INTO
    test_datetime1
    VALUES
        (20200101000000),
        (200101000000),
        (19990101000000),
        (990101000000);

INSERT INTO
    test_datetime1
    VALUES
        (CURRENT_TIMESTAMP()),
        (NOW());

SELECT *
    FROM
        test_datetime1;

/*
## TIMESTAMP 类型
 */
CREATE TABLE test_timestamp1
(
    f1 TIMESTAMP
);

INSERT INTO
    test_timestamp1
    VALUES
        ('1999-01-01 03:04:50'),
        ('19990101030405'),
        ('99-01-01 03:04:05'),
        ('990101030405');

INSERT INTO
    test_timestamp1
    VALUES
        ('2020@01@01@00@00@00'),
        ('20@01@01@00@00@00');

INSERT INTO
    test_timestamp1
    VALUES
        (CURRENT_TIMESTAMP()),
        (NOW());

SELECT *
    FROM
        test_timestamp1;

/*
### 对比 DATETIME 和 TIMESTAMP 的区别
 */
CREATE TABLE temp_time
(
    d1 DATETIME,
    d2 TIMESTAMP
);

INSERT INTO
    temp_time
    VALUES
        ('2021-9-2 14:45:52', '2021-9-2 14:45:52');

INSERT INTO
    temp_time
    VALUES
        (NOW(), NOW());

SELECT *
    FROM
        temp_time;
