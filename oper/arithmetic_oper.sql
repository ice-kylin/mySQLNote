/*
# 运算符

## 算术运算符

- `+`、`-`、`*`、`/` / `div`、`%` / `mod`
 */

SELECT
    100,
    100 + 0,
    100 + 50,
    100 + 50 * 30,
    100 + 35.5,
    100 - 35.5
    FROM
        dual;

/*
- 在 SQL 中，`+` 没有连接的作用，就表示加法运算
- 此时，会将字符串转换为数值（隐式转换）
  - 不能转换的字符当作 `0`
  - `NULL` 值参与运算，结果为 `NULL`
- 在 Java 语言中，结果是 `1001`
 */
SELECT
    100 + '1'
    FROM
        dual;

SELECT
    100 + 'a'
    FROM
        dual;

SELECT
    100 + NULL
    FROM
        dual;

SELECT
    100,
    100 * 1,
    100 / 1.0,
    100 / 2,
    100 + 2 * 5 / 2,
    100 / 3,
    100 DIV 0
    FROM
        dual;

/*
# 取模运算

- 正负取决于被模数
 */
SELECT
    12 % 3,
    12 % 5,
    12 MOD -5,
    -12 % 5,
    -12 % -5
    FROM
        dual;

# 查询员工 id 为偶数的员工信息
SELECT *
    FROM
        employees
    WHERE
        employee_id % 2 = 0;
