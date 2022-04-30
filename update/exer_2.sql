/*
# 课后练习
 */
# 1. 使用现有数据库 dbtest11
USE dbtest11;

# 2. 创建表格 pet
CREATE TABLE pet
(
    `name`  VARCHAR(20),
    `owner` VARCHAR(20),
    species VARCHAR(20),
    sex     CHAR(1),
    birth   YEAR,
    death   YEAR
);

DESC pet;

# 3. 添加记录
INSERT INTO
    pet(`name`, `owner`, species, sex, birth, death)
    VALUES
        ('Fluffy', 'harold', 'Cat', 'f', '2003', '2010'),
        ('Claws', 'gwen', 'Cat', 'm', '2004', NULL),
        ('Buffy', NULL, 'Dog', 'f', '2009', NULL),
        ('Fang', 'benny', 'Dog', 'm', '2000', NULL),
        ('bowser', 'diane', 'Dog', 'm', '2003', '2009'),
        ('Chirpy', NULL, 'Bird', 'f', '2008', NULL);

SELECT *
    FROM
        pet;

# 4. 添加字段：主人的生日 owner_birth，DATE 类型
ALTER TABLE pet
    ADD COLUMN owner_birth DATE;

SELECT *
    FROM
        pet;

# 5. 将名称为 Claws 的猫的主人改为 kevin
UPDATE pet
SET
    `owner` = 'kevin'
    WHERE
          `name` = 'Claws'
      AND species = 'Cat';

SELECT *
    FROM
        pet;

# 6. 将没有死的狗的主人改为 duck
UPDATE pet
SET
    `owner` = 'duck'
    WHERE
          death IS NOT NULL
      AND species = 'Dog';

SELECT *
    FROM
        pet;

# 7. 查询没有主人的宠物的名字
SELECT
    `name`
    FROM
        pet
    WHERE
        `owner` IS NULL;

# 8. 查询已经死了的 cat 的姓名、主人、以及去世时间
SELECT
    `name`,
    `owner`,
    death
    FROM
        pet
    WHERE
          species = 'Cat'
      AND death IS NOT NULL;

# 9. 删除已经死亡的狗
DELETE
    FROM
        pet
    WHERE
          death IS NOT NULL
      AND species = 'Dog';

# 10. 查询所有宠物信息
SELECT *
    FROM
        pet;
