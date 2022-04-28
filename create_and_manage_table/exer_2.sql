/*
# 课后练习
 */
# 1. 创建数据库 test02_market
CREATE DATABASE IF NOT EXISTS test02_market;

SHOW DATABASES;

USE test02_market;

# 2. 创建数据表 customers
CREATE TABLE IF NOT EXISTS customers
(
    c_num     INT,
    c_name    VARCHAR(50),
    c_contact VARCHAR(50),
    c_city    VARCHAR(50),
    c_birth   DATE
);

DESC customers;

# 3. 将 c_contact 字段移动到 c_birth 字段后面
ALTER TABLE customers
    MODIFY c_contact VARCHAR(50) AFTER c_birth;

DESC customers;

# 4. 将 c_name 字段数据类型改为 VARCHAR(70)
ALTER TABLE customers
    MODIFY c_name VARCHAR(70);

DESC customers;

# 5. 将 c_contact 字段改名为 c_phone
ALTER TABLE customers
    CHANGE c_contact c_phone VARCHAR(50);

DESC customers;

# 6. 增加 c_gender 字段到 c_name 后面，数据类型为 CHAR(1)
ALTER TABLE customers
    ADD COLUMN c_gender CHAR(1) AFTER c_name;

DESC customers;

# 7. 将表名改为 customers_info
RENAME TABLE customers TO customers_info;

SHOW TABLES FROM test02_market;

# 8. 删除字段 c_city
ALTER TABLE customers_info
    DROP COLUMN c_city;

DESC customers_info;
