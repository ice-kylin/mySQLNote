/*
# 更新视图数据
 */
USE dbtest14;

# 更新视图的数据，会导致基表中数据的修改
SELECT *
    FROM
        emps;

SELECT *
    FROM
        vu_emp1;

UPDATE vu_emp1
SET
    salary = 10000
    WHERE
        employee_id = 101;

# 同理，更新表中的数据，也会导致视图中数据的修改
UPDATE emps
SET
    salary = 15000
    WHERE
        employee_id = 101;

# 删除视图中的数据，也会导致表中数据的删除
DELETE
    FROM
        vu_emp1
    WHERE
        employee_id = 101;

/*
## 不可更新的视图
 */
