/*
# 存储过程和存储函数的查看、修改和删除

## 存储过程和存储函数的查看
 */
USE dbtest15;

# 方式 1
SHOW CREATE PROCEDURE show_mgr_name;

SHOW CREATE FUNCTION count_by_id;

# 方式 2
SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS LIKE 'show_max_salary';

SHOW FUNCTION STATUS LIKE 'email_by_id';

# 方式 3
SELECT *
    FROM
        information_schema.routines
    WHERE
          routine_name = 'show_max_salary'
      AND routine_type = 'PROCEDURE';

SELECT *
    FROM
        information_schema.routines
    WHERE
          routine_name = 'email_by_id'
      AND routine_type = 'FUNCTION';

/*
## 存储过程、函数的修改
 */
ALTER PROCEDURE show_max_salary
    SQL SECURITY INVOKER
    COMMENT '查询最高工资';

SHOW PROCEDURE STATUS LIKE 'show_max_salary';

/*
## 存储过程、函数的删除
 */
DROP FUNCTION IF EXISTS count_by_id;

DROP PROCEDURE IF EXISTS show_min_salary;
