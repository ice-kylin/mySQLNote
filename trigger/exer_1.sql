/*
# 课后练习 1
 */
# 0. 准备工作
USE dbtest17;

CREATE TABLE emps
AS
SELECT
    employee_id,
    last_name,
    salary
    FROM
        atguigudb.employees;

# 1. 复制一张 emps 表的空表 emps_back，只有表结构，不包含任何数据
CREATE TABLE emps_back AS
SELECT *
    FROM
        dbtest17.emps
    WHERE
        FALSE;

# 2. 查询 emps_back 表中的数据
SELECT *
    FROM
        emps_back;

# 3. 创建触发器 emps_insert_trigger，每当向 emps 表中添加一条记录时，同步将这条记录添加到 emps_back 表中
DELIMITER //

CREATE TRIGGER emps_insert_trigger
    AFTER INSERT
    ON emps
    FOR EACH ROW
BEGIN
    INSERT INTO
        emps_back(employee_id,
                  last_name,
                  salary)
        VALUES
            (new.employee_id,
             new.last_name,
             new.salary);
END //

DELIMITER ;

SHOW CREATE TRIGGER emps_insert_trigger;

# 4. 验证触发器是否起作用
INSERT INTO
    emps(employee_id,
         last_name,
         salary)
    VALUES
        (300, 'Tom', 3400);

SELECT *
    FROM
        emps;

SELECT *
    FROM
        emps_back;
