/*
# 表的管理

## 修改表

- 添加一个字段
 */
ALTER TABLE my_emp_1
    ADD salary DOUBLE(10, 2); # 默认添加到表中的最后一个字段的位置

ALTER TABLE my_emp_1
    ADD phone VARCHAR(20) AFTER hire_date;

ALTER TABLE my_emp_1
    ADD email VARCHAR(45) AFTER hire_date;

DESC my_emp_1;

/*
- 修改一个字段
  - 数据类型
  - 长度
  - 默认值
  - ...
 */
ALTER TABLE my_emp_1
    MODIFY emp_name VARCHAR(25);

DESC my_emp_1;

/*
- 重命名字段
 */
ALTER TABLE my_emp_1
    CHANGE salary mon_salary DOUBLE(10, 2);

ALTER TABLE my_emp_1
    CHANGE email my_email VARCHAR(50);

DESC my_emp_1;

/*
- 删除一个字段
 */
ALTER TABLE my_emp_1
    DROP COLUMN my_email;

DESC my_emp_1;

/*
## 重命名表
 */
# 方式一
RENAME TABLE my_emp_1 TO my_emp_0;

RENAME TABLE my_emp_0 TO my_emp_1;

SHOW TABLES;

# 方式二
ALTER TABLE my_emp_2 RENAME TO my_emp_1;

ALTER TABLE my_emp_1 RENAME TO my_emp_2;

SHOW TABLES;

/*
## 删除表

- 不光将表结构删除了，同时表中的数据也删除了，释放表空间
 */
DROP TABLE IF EXISTS my_emp_2;

/*
# 清空表

- 清空表中的所有数据，但是表结构保留
 */
TRUNCATE TABLE emp_copy;

DESC emp_copy;

SELECT *
    FROM
        emp_copy;
