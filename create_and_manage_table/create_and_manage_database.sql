/*
# 数据库的创建、修改和删除

## 标识符命名规则

- 数据库名、表名不得超过 30 个字符，变量名限制为 29 个
- 必须只能包含 A-Z、a-z、0-9、_ 共 63 个字符
- 数据库名、表名、字段名等对象名中间不要包含空格
- 同一个 MySQL 中数据库不能同名
- 同一个库中表不能同名
- 同一个表中字段不能同名
- 必须保证字段名和类型的一致性：在命名字段并为其指定数据类型的时候一定要保证一致性
  - 假如数据类型在一个表里是整数，那么在另一个表中就别变成字符型了
 */
USE atguigudb;

SELECT *
    FROM
        `order`;

/*
## 创建和管理数据库

### 创建数据库
 */
# 方式一：创建的此数据库使用的是默认的字符集
CREATE DATABASE mytest1;

# 查看创建数据库的结构
SHOW CREATE DATABASE mytest1;

# 方式二：显式的指明了要创建的数据库的字符集
CREATE DATABASE mytest2 CHARACTER SET 'gbk';

SHOW CREATE DATABASE mytest2;

# 方式三（推荐）：如果要创建的数据库已经存在，则创建不成功，但不会报错
CREATE DATABASE IF NOT EXISTS mytest2 CHARACTER SET 'gbk';

CREATE DATABASE IF NOT EXISTS mytest3 CHARACTER SET 'gbk';

SHOW VARIABLES LIKE 'character_%';

SHOW DATABASES;

/*
### 管理数据库
 */
# 查看当前连接中的数据库都有哪些
SHOW DATABASES;

# 切换数据库
USE atguigudb;
USE mytest2;

# 查看当前数据库中保存的数据表
SHOW TABLES;

# 查看当前使用的数据库
SELECT
    DATABASE()
    FROM
        dual;

# 查看指定数据库下保存的数据表
SHOW TABLES FROM mysql;

/*
### 修改数据库
 */
# 更改数据库字符集
ALTER DATABASE mytest2 CHARACTER SET 'utf8';

SHOW CREATE DATABASE mytest2;

/*
### 删除数据库
 */
# 方式一
DROP DATABASE mytest1;

# 方式二（推荐）
DROP DATABASE IF EXISTS mytest1;

SHOW DATABASES;
