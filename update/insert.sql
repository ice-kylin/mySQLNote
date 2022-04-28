/*
# 数据处理之增删改

## 添加数据
 */
USE atguigudb;

CREATE TABLE IF NOT EXISTS emp1
(
    id        INT,
    `name`    VARCHAR(15),
    hire_date DATE,
    salary    DOUBLE(10, 2)
);

DESC emp1;

SELECT *
    FROM
        emp1;

/*
- 方式一：一条一条的添加数据
 */
# 方式一：没有指明添加字段
INSERT INTO
    emp1
    VALUES
        (1, 'Tom', '2000-12-21', 3400); # 注意：一定要按照声明字段的先后顺序添加

SELECT *
    FROM
        emp1;

# 方式二（推荐）：指明要添加的字段
INSERT INTO
    emp1(id, hire_date, salary, name)
    VALUES
        (2, '1999-09-09', 3400, 'Jerry');

INSERT INTO
    emp1(id, salary, name) # 没有进行赋值的 hire_date 的值为 NULL
    VALUES
        (3, 4500, 'icekylin');

SELECT *
    FROM
        emp1;

# 方式三：同时插入多条记录
INSERT INTO
    emp1(id, name, hire_date, salary)
    VALUES
        (4, 'dupi', '2022-04-28', 5000),
        (5, 'issac', '2022-01-01', 1);

SELECT *
    FROM
        emp1;

/*
- 方式二：将查询结果插入到表中
 */
INSERT INTO
    emp1(id, `name`, hire_date, salary) # 查询的字段一定要和添加到的表的字段一一对应
SELECT
    employee_id,
    last_name,
    hire_date,
    salary
    FROM
        employees
    WHERE
        department_id IN (60, 70);

SELECT *
    FROM
        emp1;
