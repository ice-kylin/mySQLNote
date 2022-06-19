/*
# 触发器

- 优点
  - 保证数据的完整性
  - 记录操作日志
  - 在操作数据前，对数据进行合法性检查
- 缺点
  - 可读性差
  - 相关数据的变更，可能会导致触发器出错

## 创建触发器
 */
CREATE DATABASE dbtest17;

USE dbtest17;

# 1. 创建数据表
CREATE TABLE test_trigger
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    t_note VARCHAR(30)
);

CREATE TABLE test_trigger_log
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    t_log VARCHAR(30)
);

# 2. 查看表数据
SELECT *
    FROM
        test_trigger;

SELECT *
    FROM
        test_trigger_log;

# 3. 创建触发器
# 创建名称为 before_insert_test_tri 的触发器，向 test_trigger 数据表插入数据之前
# 向 test_trigger_log 数据表中插入 before_insert 的日志信息
DELIMITER //

CREATE TRIGGER before_insert_test_tri
    BEFORE INSERT
    ON test_trigger
    FOR EACH ROW
BEGIN
    INSERT INTO
        test_trigger_log(t_log)
        VALUES
            ('before insert');
END //

DELIMITER ;

INSERT INTO
    test_trigger(t_note)
    VALUES
        ('Tom');

SELECT *
    FROM
        test_trigger;

SELECT *
    FROM
        test_trigger_log;

# 创建名称为 after_insert 的触发器，向 test_trigger 数据表插入数据之后
# 向 test_trigger_log 数据表中插入 after_insert 的日志信息
DELIMITER //

CREATE TRIGGER after_insert
    AFTER INSERT
    ON test_trigger
    FOR EACH ROW
BEGIN
    INSERT INTO
        test_trigger_log(t_log)
        VALUES
            ('after insert');
END //

DELIMITER ;

INSERT INTO
    test_trigger(t_note)
    VALUES
        ('Jerry');

SELECT *
    FROM
        test_trigger;

SELECT *
    FROM
        test_trigger_log;

# 定义触发器 salary_check_trigger，基于员工表 employees 的 INSERT 事件
# 在 INSERT 之前检查将要添加的新员工薪资是否大于他领导的薪资
# 如果大于领导薪资，则报 sqlstate_value 为 'HY000' 的错误，从而使得添加失败
CREATE TABLE IF NOT EXISTS employees
AS
SELECT *
    FROM
        atguigudb.employees;

CREATE TABLE IF NOT EXISTS departments AS
SELECT *
    FROM
        atguigudb.departments;

DELIMITER //

CREATE TRIGGER salary_check_trigger
    BEFORE INSERT
    ON employees
    FOR EACH ROW
BEGIN
    DECLARE m_sal DOUBLE;

    SELECT
        salary
        INTO m_sal
        FROM
            employees
        WHERE
            employee_id = new.manager_id;

    IF m_sal < new.salary
        THEN
            SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = '薪资高于领导薪资错误';
    END IF;
END //

DELIMITER ;

DESC employees;

INSERT INTO
    employees(employee_id, last_name, email, hire_date, job_id, salary, manager_id)
    VALUES
        (300, 'Tom', 'tom@126.com', CURDATE(), 'AD_VP', 8000, 103);

SELECT *
    FROM
        employees;

/*
## 查看触发器
 */
# 1. 查看数据库中所有触发器的定义
SHOW TRIGGERS;

# 2. 查看当前数据库中某个触发器的定义
SHOW CREATE TRIGGER before_insert_test_tri;

# 3. 从系统库 information_schema 的 triggers 表中查询
SELECT *
    FROM
        information_schema.triggers
    WHERE
        trigger_name = 'salary_check_trigger';

/*
## 删除触发器
 */
DROP TRIGGER IF EXISTS after_insert;
