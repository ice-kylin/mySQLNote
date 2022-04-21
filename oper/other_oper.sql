/*
# 逻辑运算符

- `NOT` / `!`
- `AND` / `&&`
- `OR` / `||`
  - `AND` 的优先级高于 `OR`
- `XOR`
  - 异或
  - 追求的“异”
 */

SELECT
    last_name,
    salary,
    department_id
    FROM
        employees
    WHERE
        salary > 6000 && department_id = 50;

/*
# 位运算符

- `&`：按位与
- `|`：按位或
- `^`：按位异或
- `~`：按位取反
- `>>`：按位右移
- `<<`：按位左移
 */
