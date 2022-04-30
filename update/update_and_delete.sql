/*
# 更新数据

- 可以实现批量修改数据
 */
USE atguigudb;

SELECT *
    FROM
        emp1;

UPDATE emp1
SET
    hire_date = CURDATE()
    WHERE
        id = 5;

SELECT *
    FROM
        emp1;

UPDATE emp1
SET
    hire_date = CURDATE(),
    salary    = 6000
    WHERE
        id = 4;

SELECT *
    FROM
        emp1;

# 将表中姓名中包含 a 的提薪 20%
UPDATE emp1
SET
    salary = salary * 1.2
    WHERE
        name LIKE '%a%';

SELECT *
    FROM
        emp1;

/*
# 删除数据
 */
DELETE
    FROM
        emp1
    WHERE
        id = 1;

SELECT *
    FROM
        emp1;
