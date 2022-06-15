/*
# 条件与处理程序

## 定义条件
 */
USE dbtest16;

DESC dbtest16.employees;

# 定义 Field_Not_Be_NULL 错误名与 MySQL 中违反非空约束的错误类型
# 方式 1：使用 MySQL_error_code
# DECLARE field_not_be_null CONDITION FOR 1048;

# 方式 2：使用 sqlstate_value
# DECLARE field_not_be_null CONDITION FOR SQLSTATE '23000';

# 定义 command_not_allowed 错误名
# DECLARE command_not_allowed CONDITION FOR 1248;

# DECLARE command_not_allowed CONDITION FOR SQLSTATE '42000';

/*
## 定义处理程序

- 处理方式
  - CONTINUE
  - EXIT
  - UNDO
- 错误类型
  - SQLSTATE '字符串错误码'
  - MySQL_error_code
  - 错误名称
  - SQLWARNING
  - NOT FOUND
  - SQLEXCEPTION
 */
