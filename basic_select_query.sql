/*
# SQL 概述

## SQL 的分类

1. DDL
  - Data Definition Language（数据定义语言）
  - `CREATE` \ `ALTER` \ `DROP` \ `RENAME` \ `TRUNCATE`
2. DML
  - Data Managed Language（数据操作语言）
  - `INSERT` \ `DELETE` \ `UPDATE` \ `SELECT`
3. DCL
  - Data Control Language（数据控制语言）
  - `COMMIT` \ `ROLLBACK` \ `SAVEPOINT` \ `GRANT` \ `REVOKE`

## SQL 的规则和规范

- 规则（必须遵守）
  - 每条命令以 `;` 或 `\g` 或 `\G` 结束
  - 关键字不能被缩写也不能分行
  - 关于标点符号
    - 必须保证所有的 `()`、单引号、双引号是成对出现的
    - 必须使用英文状态下的半角输入模式
    - 字符串类型和日期时间类型的数据可以使用单引号表示
    - 列的别名，尽量使用双引号，并且不建议省略 `as`
- 规范（建议遵守）
  - MySQL 在 Windows 环境下是大小写不敏感的
  - MySQL 在 Linux 环境下是大小写敏感的
    - 数据库名、表名、表的别名、变量名是严格区分大小写的
    - 关键字、函数名、列名（字段名）、列的别名（字段的别名）是忽略大小写的
  - SQL 关键字、函数名、绑定变量等都大写
- MySQL 三种注释的方式

## 导入现有的数据表、表的数据

1. source 文件的全路径名
2. 图形化界面工具
 */

USE atguigudb;
SHOW TABLES;
SELECT *
    FROM
        employees;

/*
# 基本的 SELECT 语句

- `SELECT 字段1, 字段2, ... FROM 表名`
- `*`：表中所有的字段或列
 */
SELECT
    1 + 1,
    2 * 2
    FROM
        dual;

SELECT *
    FROM
        employees;

SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees;

/*
# 列的别名

- `AS`
  - alias（别名）
  - 可以省略
  - 使用一对 `"` 引起来，不要使用 `'`
 */
SELECT
    employee_id AS emp_id,
    last_name   AS l_name,
    department_id  "部门 id",
    salary * 12    "annual sal"
    FROM
        employees;

/*
# 去除重复行
 */
SELECT DISTINCT
    department_id
    FROM
        employees;

# 没有报错，没有实际意义
SELECT DISTINCT
    department_id,
    salary
    FROM
        employees;

/*
# 空值参与运算

- `null`：空值
- `null` 不等同于 `0`、`''`、`'null'`
 */
SELECT
    employee_id,
    salary                                        "月工资",
    salary * (1 + IFNULL(commission_pct, 0)) * 12 "年工资",
    commission_pct
    FROM
        employees;

/*
# 着重号
 */
SELECT *
    FROM
        `order`;

/*
# 查询常数
 */
SELECT
    'SGG',
    employee_id,
    last_name
    FROM
        employees;

/*
# 显示表结构
 */
DESCRIBE employees; # 显示了表中字段的详细信息
DESC employees;
DESC departments;

/*
# 数据筛选
 */
SELECT *
    FROM
        employees
    WHERE
        last_name = 'King';

/*
## 基本 SELECT 查询练习
 */

# 1. 查询员工 12 个月的工资总和，并起名为 "annual salary"
SELECT
    employee_id                                   "员工 id",
    last_name                                     "姓",
    first_name                                    "名",
    salary * (1 + IFNULL(commission_pct, 0)) * 12 "annual salary"
    FROM
        employees;

# 2. 查询 `employees` 表中去除重复的 job_id 以后的数据
SELECT DISTINCT
    job_id
    FROM
        employees;

# 3. 查询工资大于 `12000` 的员工姓名和工资
SELECT
    last_name,
    first_name,
    salary
    FROM
        employees
    WHERE
        salary > 12000;

# 4. 查询员工号为 176 的员工的姓名和部门号
SELECT
    last_name,
    first_name,
    department_id
    FROM
        employees
    WHERE
        employee_id = 176;

# 5. 显示表 `departments` 的结构，并查询其中的全部数据
DESCRIBE departments;

SELECT *
    FROM
        departments;
