/*
# FOREIGN KEY 约束

## 在 CREATE TABLE 时添加

- 主表和从表（父表和子表）
 */
USE dbtest13;

# - 先创建主表
CREATE TABLE dept1
(
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(15)
);

# - 再创建子表
CREATE TABLE emp1
(
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    emp_name      VARCHAR(15),
    department_id INT,
    CONSTRAINT fk_emp1_dept_id FOREIGN KEY (department_id) REFERENCES dept1 (dept_id)
);

DESC emp1;

SELECT *
    FROM
        emp1;

SELECT *
    FROM
        information_schema.table_constraints
    WHERE
          table_name = 'emp1'
      AND constraint_schema = 'dbtest13';

/*
## 外键的效果
 */
INSERT INTO
    dept1
    VALUES
        (10, 'IT');

INSERT INTO
    emp1
    VALUES
        (1001, 'Tom', 10);

SELECT *
    FROM
        emp1;

# 删除失败
DELETE
    FROM
        dept1
    WHERE
        dept_id = 10;

# 更新失败
UPDATE dept1
SET
    dept_id = 20
    WHERE
        dept_id = 10;

/*
## 在 ALTER TABLE 时添加外键约束
 */
CREATE TABLE dept2
(
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(15)
);

CREATE TABLE emp2
(
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    emp_name      VARCHAR(15),
    department_id INT
);

SELECT *
    FROM
        information_schema.table_constraints
    WHERE
          table_name = 'emp2'
      AND constraint_schema = 'dbtest13';

ALTER TABLE emp2
    ADD CONSTRAINT fk_emp2_dept_id FOREIGN KEY (department_id) REFERENCES dept2 (dept_id);

/*
## 约束等级

- CASCADE：在父表上 UPDATE / DELETE 记录时，同步的 UPDATE / DELETE 掉子表的匹配记录
- SET NULL：在父表上 UPDATE / DELETE 记录时，将子表上匹配的记录的列设为 NULL，但是要注意子表的外键约束不能为 NOT NULL
- RESTRICT：如果子表中有匹配的记录，则不允许对父表对应候选键进行 UPDATE / DELETE 操作
- 最好采用 `ON UPDATE CASCADE ON DELETE RESTRICT`
 */

/*
## 删除外键约束

- 一个表中可以声明有多个外键约束
 */
SELECT *
    FROM
        information_schema.table_constraints
    WHERE
          table_name = 'emp1'
      AND constraint_schema = 'dbtest13';

ALTER TABLE emp1
    DROP FOREIGN KEY fk_emp1_dept_id;

# 手动删除外键约束对应的普通索引
SHOW INDEX FROM emp1;

ALTER TABLE emp1
    DROP INDEX fk_emp1_dept_id;
