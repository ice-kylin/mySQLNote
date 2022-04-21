/*
# 聚合函数

## 常见的几个聚合函数
 */
# 1. AVG() / SUM()：只适用于数字类型的字段（或变量）
SELECT
    AVG(salary),
    SUM(salary)
    FROM
        employees;

# 2. MAX() / MIN()：使用于数字类型、字符串类型、日期时间类型的字段（或变量）
SELECT
    MAX(salary),
    MIN(salary)
    FROM
        employees;

SELECT
    MAX(last_name),
    MIN(last_name)
    FROM
        employees;

SELECT
    MAX(hire_date),
    MIN(hire_date)
    FROM
        employees;

/*
3. COUNT()
  - 作用：计算指定字段在查询结构中出现的个数
  - 计算表中有多少条记录
    - COUNT(*)
    - COUNT(1)
    - COUNT(具体字段)：不一定对
      - 计算指定字段出现的个数时，是不计算 NULL 值的
      - 如果需要统计表中的记录数，使用以上三者哪个效率更高？
        - 如果使用的是 MyISAM 存储引擎，则三者效率相同
        - 如果使用的是 InnoDB 存储引擎，则三者效率：COUNT(*) = COUNT(1) > COUNT(字段)
 */
SELECT
    COUNT(salary),
    COUNT(employee_id),
    COUNT(1),
    COUNT(*)
    FROM
        employees;

SELECT
    COUNT(commission_pct),
    COUNT(NULL)
    FROM
        employees;

/*
- 公式：AVG() = SUM() / COUNT()
 */
SELECT
    AVG(salary),
    SUM(salary) / COUNT(salary),
    AVG(commission_pct),
    SUM(commission_pct) / COUNT(commission_pct),
    SUM(commission_pct) / COUNT(IFNULL(commission_pct, 0))
    FROM
        employees;

SELECT
    AVG(IFNULL(commission_pct, 0)),
    SUM(commission_pct) / COUNT(IFNULL(commission_pct, 0))
    FROM
        employees;

/*
## GROUP BY

- 结论 1：
  - SELECT 中出现的非组函数的字段必须声明在 GROUP BY 中
  - 反之，GROUP BY 中声明的字段可以不出现在 SELECT 中
- 结论 2：
  - GROUP BY 声明在
    - FROM 后面、WHERE 前面
    - ORDER BY 前面、LIMIT 前面
- 结论 3：
  - MySQL 中 GROUP BY 中使用 WITH ROLLUP
  - 当使用 ROLLUP 时，不能使用 ORDER BY 子句进行结果排序，即 ROLLUP 和 ORDER BY 是相互排斥的
 */
# 查询各个部门的平均工资、最高工资
SELECT
    department_id,
    AVG(salary),
    MAX(salary)
    FROM
        employees
    GROUP BY
        department_id;

# 查询各个 job_id 的平均工资、最高工资
SELECT
    job_id,
    AVG(salary),
    MAX(salary)
    FROM
        employees
    GROUP BY
        job_id;

# 查询各个部门、job_id 的平均工资、最高工资
SELECT
    department_id,
    job_id,
    AVG(salary),
    MAX(salary)
    FROM
        employees
    GROUP BY
        department_id, job_id
    ORDER BY
        department_id;

SELECT
    department_id,
    job_id,
    AVG(salary)
    FROM
        employees
    GROUP BY
        department_id, job_id
WITH
    ROLLUP;

/*
## HAVING 的使用

- 作用：用来过滤数据的
- 要求
  1. 如果过滤条件使用了聚合函数，则必须使用 HAVING 来替换 WHERE，否则报错
  2. HAVING 必须声明在 GROUP BY 的后面
- 开发中使用 HAVING 的前提是 SQL 中使用了 GROUP BY
- 当过滤条件中
  - 有聚合函数时，则此过滤天骄必须声明在 HAVING 中
  - 没有聚合函数时，则此过滤条件声明在 WHERE 或 HAVING 中都可以
    - 但是建议声明在 WHERE 中

### WHERE 和 HAVING 的对比

- 从适用范围上来讲，HAVING 的适用范围更广
- 如果过滤条件中没有聚合函数，这种情况下：WHERE 的执行效率高于 HAVING
 */
# 查询各个部门中最高工资比 10000 高的部门信息
SELECT
    department_id,
    MAX(salary)
    FROM
        employees
    GROUP BY
        department_id
    HAVING
        MAX(salary) >= 10000;

# 查询部门 id 为 10、20、30、40 这 4 个部门中最高工资比 10000 高的部门信息
# 方式一：推荐，执行效率高
SELECT
    department_id,
    MAX(salary)
    FROM
        employees
    WHERE
        department_id IN (10, 20, 30, 40)
    GROUP BY
        department_id
    HAVING
        MAX(salary) >= 10000;

# 方式二
SELECT
    department_id,
    MAX(salary)
    FROM
        employees
    GROUP BY
        department_id
    HAVING
          MAX(salary) >= 10000
      AND department_id IN (10, 20, 30, 40);

/*
## SQL 的底层执行原理

### SQL92 语法

SELECT ..., ..., ... (存在聚合函数)
FROM ..., ..., ...
WHERE 多表的连接条件 AND 不包含聚合函数的过滤条件
GROUP BY ..., ...
HAVING 包含聚合函数的过滤条件
ORDER BY ..., ... (ASC / DESC)
LIMIT ..., ...

### SQL99 语法

SELECT ..., ..., ... (存在聚合函数)
FROM ..., ..., ...
(LEFT / RIGHT) JOIN ... ON  多表的连接条件
...
(LEFT / RIGHT) JOIN ... ON  多表的连接条件
WHERE 不包含聚合函数的过滤条件
GROUP BY ..., ...
HAVING 包含聚合函数的过滤条件
ORDER BY ..., ... (ASC / DESC)
LIMIT ..., ...

### SQL 语句的执行过程

FROM -> ON -> (LEFT / RIGHT) JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT
 */
