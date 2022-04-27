/*
# 比较运算符

- `=`、`<=>`、`<>`、`!=`、`<`、`<=`、`>`、`>=`
  - 字符串存在隐式转换
    - 如果转换不成功，则看作 `0`
  - 两边都是字符串的话，则按照 ANSI 的比较规则进行比较
  - 只要有 `NULL` 参与运算，结果就为 `NULL`
 */

SELECT
    1 = 2,
    1 != 2,
    1 = '1',
    1 = 'a',
    0 = 'a' # 1
    FROM
        dual;

SELECT
    'a' = 'a',
    'ab' = 'ab',
    'a' = 'b' AS # 0
    FROM
        dual;

SELECT
    1 = NULL,
    # NULL
    NULL = NULL # NULL
    FROM
        dual;

#
<=>
：安全等于
SELECT
    1 <=> NULL,   # 0
    NULL <=> NULL # 1
    FROM
        dual;

#
查询表中 commission_pct 为 NULL 的数据有哪些
SELECT
    last_name,
    salary,
    commission_pct
    FROM
        employees
    WHERE
        commission_pct <=> NULL;

#
查询表中 commission_pct 不为 NULL 的数据有哪些
SELECT
    last_name,
    salary,
    commission_pct
    FROM
        employees
    WHERE
        NOT commission_pct <=> NULL;

/*
- `IS NULL`、`IS NOT NULL`、`ISNULL`
 */
#
查询表中 commission_pct 为 NULL 的数据有哪些
SELECT
    last_name,
    salary,
    commission_pct
    FROM
        employees
    WHERE
        commission_pct IS NULL;

#
查询表中 commission_pct 不为 NULL 的数据有哪些
SELECT
    last_name,
    salary,
    commission_pct
    FROM
        employees
    WHERE
        commission_pct IS NOT NULL;

#
查询表中 commission_pct 为 NULL 的数据有哪些
SELECT
    last_name,
    salary,
    commission_pct
    FROM
        employees
    WHERE
        isnull(commission_pct);

/*
# - `LEAST()`、`GREATEST()`
 */
SELECT
    least('q', 'w', 'e', 'r', 't'),
    greatest('q', 'w', 'e', 'r', 't')
    FROM
        dual;

/*
# `BETWEEN 条件下界 AND 条件上界`
 */
#
查询工资在 6000 和 8000 之间的员工信息
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    WHERE
        salary BETWEEN 6000 AND 8000;

#
查询工资不在 6000 和 8000 之间的员工信息
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    WHERE
        salary NOT BETWEEN 6000 AND 8000;

/*
- `IN`
 */
#
查询部门为 10
、20
、30 部门的员工信息
SELECT
    employee_id,
    last_name,
    department_id
    FROM
        employees
    WHERE
        department_id IN (10, 20, 30);

#
查询部门为 10
、20
、30 部门的员工信息
SELECT
    employee_id,
    last_name,
    department_id
    FROM
        employees
    WHERE
         department_id = 10
      OR department_id = 20
      OR department_id = 30;

#
查询工资不是 6000
、7000
、8000 的员工信息
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    WHERE
        salary NOT IN (6000, 7000, 8000);

/*
# `LIKE`：模糊查询

- `%`：匹配 0 个或多个字符
- `_`：只能匹配一个字符
- `\`：转义字符
 */
#
查询 last_name 中以包含字符 a 的员工信息
SELECT
    employee_id,
    last_name
    FROM
        employees
    WHERE
        last_name LIKE '%a%';

#
查询 last_name 中以字符 a 开头的员工信息
SELECT
    employee_id,
    last_name
    FROM
        employees
    WHERE
        last_name LIKE 'a%';

#
查询 last_name 中包含字符 a 且包含字符 e 的员工信息
SELECT
    employee_id,
    last_name
    FROM
        employees
    WHERE
        last_name LIKE '%a%' && last_name LIKE '%e%';

#
查询第 2 个字符是 a 的员工信息
SELECT
    employee_id,
    last_name
    FROM
        employees
    WHERE
        last_name LIKE '_a%';

/*
# `REGEXP`：正则表达式
 */
SELECT
    'icekylin' AS regexp '^i', 'icekylin' AS regexp 'n$', 'icekylin' AS regexp 'ky'
    FROM
        dual;

SELECT
    'atguigu' AS regexp 'gu.gu', 'atguigu' AS regexp '[ab]'
    FROM
        dual;
