/*
# 课后练习 2
 */
# 0. 准备工作：使用练习 1 中的 emps 表
USE dbtest17;

# 1. 复制一张 emps 表的空表 emps_back1，只有表结构，不包含任何数据
CREATE TABLE IF NOT EXISTS emps_back1 AS
SELECT *
    FROM
        emps
    WHERE
        FALSE;

# 2. 查询 emps_back1表中的数据
SELECT *
    FROM
        emps_back1;

# 3. 创建触发器 emps_del_trigger
# 每当向 emps 表中删除一条记录时，同步将删除的这条记录添加到 emps_back1 表中
DELIMITER //

CREATE TRIGGER emps_del_trigger
    BEFORE DELETE
    ON emps
    FOR EACH ROW
BEGIN
    INSERT INTO
        emps_back1(employee_id,
                   last_name,
                   salary)
        VALUES
            (old.employee_id,
             old.last_name,
             old.salary);
END //

DELIMITER ;

# 4. 验证触发器是否起作用
DELETE
    FROM
        emps
    WHERE
        employee_id = 107;

SELECT *
    FROM
        emps;

SELECT *
    FROM
        emps_back1;
