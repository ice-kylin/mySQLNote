/*
# 数据类型

## 属性

- CHARACTER SET
 */
# 创建数据库时指明字符集
CREATE DATABASE IF NOT EXISTS dbtest12 CHARACTER SET 'utf8';

SHOW CREATE DATABASE dbtest12;

USE dbtest12;

# 创建表的时候指明表的字符集
CREATE TABLE temp1
(
    id     INT,
    `name` VARCHAR(25) CHARACTER SET 'gbk' # 创建表，指明表中的字段时，可以指明字段的字符集
) CHARACTER SET 'utf8';

SHOW CREATE TABLE temp1;
