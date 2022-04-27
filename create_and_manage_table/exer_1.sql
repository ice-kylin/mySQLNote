# 1. 创建数据库 test01_office，指明字符集为 utf8，并在此数据库下执行下述操作
CREATE DATABASE IF NOT EXISTS test01_office CHARACTER SET 'utf8';

SHOW CREATE DATABASE test01_office;

USE test01_office;

# 2. 创建表dept01
SHOW TABLES FROM test01_office;

/*
字段  类型
id   INT(7),
name VARCHAR(25)
*/
CREATE TABLE IF NOT EXISTS dept01
(
    id   INT(7),
    name VARCHAR(25)
);

SHOW TABLES FROM test01_office;

DESC dept01;

# 3. 将表 departments 中的数据插入新表 dept02 中
SHOW TABLES;

CREATE TABLE IF NOT EXISTS dept02 AS
SELECT *
    FROM
        atguigudb.departments;

SHOW TABLES FROM test01_office;

SHOW CREATE TABLE dept02;

SELECT *
    FROM
        dept02;

DESC dept02;

# 4. 创建表 emp01
SHOW TABLES FROM test01_office;

/*
字段        类型
id         INT(7),
first_name VARCHAR(25),
last_name  VARCHAR(25),
dept_id    INT(7)
*/
CREATE TABLE IF NOT EXISTS emp01
(
    id         INT(7),
    first_name VARCHAR(25),
    last_name  VARCHAR(25),
    dept_id    INT(7)
);

SHOW TABLES FROM test01_office;

DESC emp01;

# 5. 将列 last_name 的长度增加到 50
ALTER TABLE emp01
    MODIFY last_name VARCHAR(50);

DESC emp01;

# 6. 根据表 employees 创建 emp02
CREATE TABLE IF NOT EXISTS emp02 AS
SELECT *
    FROM
        atguigudb.employees
    WHERE
        FALSE;

DESC emp02;

SELECT *
    FROM
        emp02;

# 7. 删除表 emp01
DROP TABLE IF EXISTS emp01;

# 8. 将表 emp02 重命名为 emp01
RENAME TABLE emp02 TO emp01;

SHOW TABLES FROM test01_office;

# 9. 在表 dept02 和 emp01 中添加新列 test_column，并检查所作的操作
ALTER TABLE dept02
    ADD COLUMN test_column INT;

DESC dept02;

ALTER TABLE emp01
    ADD COLUMN test_column INT;

DESC emp01;

# 10. 直接删除表 emp01 中的列 department_id
ALTER TABLE emp01
    DROP COLUMN department_id;

DESC emp01;
