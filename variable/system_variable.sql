/*
# 变量

- 系统变量
  - 全局系统变量
  - 会话系统变量
- 用户自定义变量
  - 会话用户变量
  - 局部变量

## 查看系统变量
 */
# 查看所有的全局系统变量
SHOW GLOBAL VARIABLES;

SHOW GLOBAL VARIABLES LIKE 'admin_%';

# 查看所有的会话系统变量
SHOW SESSION VARIABLES;

SHOW SESSION VARIABLES LIKE 'character_set_%';

SHOW VARIABLES LIKE 'character_set_%';

# 查看指定的系统变量
SELECT
    @@global.max_connections
    FROM
        dual;

SELECT
    @@global.character_set_client
    FROM
        dual;

# 查看指定的会话变量的值
SELECT
    @@session.character_set_client
    FROM
        dual;

SELECT
    @@character_set_client
    FROM
        dual;

/*
## 修改系统变量的值

- 针对于当前的数据库实例是有效的，一旦重启 MySQL 服务，就失效了
 */
# 方式 1
SET @@global.max_connections := 64;

# 方式 2
SET GLOBAL max_connections := 128;

SELECT
    @@global.max_connections
    FROM
        dual;

/*
## 修改会话系统变量的值

- 针对于当前会话是有效的，一旦结束会话，重新建立起新的会话，就失效了
 */
# 方式 1
SET @@session.character_set_client := 'gbk';

# 方式 2
SET SESSION character_set_client := 'gbk';

SELECT
    @@session.character_set_client
    FROM
        dual;
