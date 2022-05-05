/*
# 拓展练习

## 练习 1
 */
CREATE DATABASE IF NOT EXISTS test04_market;

USE test04_market;

SHOW DATABASES;

CREATE TABLE IF NOT EXISTS customers
(
    c_num     INT PRIMARY KEY AUTO_INCREMENT,
    c_name    VARCHAR(50),
    c_contact VARCHAR(50),
    c_city    VARCHAR(50),
    c_birth   DATETIME NOT NULL
);

DESC customers;

ALTER TABLE customers
    MODIFY c_contact VARCHAR(50) AFTER c_birth;

ALTER TABLE customers
    MODIFY c_name VARCHAR(70);

ALTER TABLE customers
    CHANGE c_contact c_phone VARCHAR(50);

ALTER TABLE customers
    ADD COLUMN c_gender CHAR(1);

RENAME TABLE customers TO customers_info;

ALTER TABLE customers_info
    DROP c_city;

DESC customers_info;

CREATE TABLE IF NOT EXISTS orders
(
    o_num  INT PRIMARY KEY AUTO_INCREMENT,
    o_date DATE,
    c_id   INT,
    CONSTRAINT fk_orders_c_id FOREIGN KEY (c_id) REFERENCES customers_info (c_num)
);

DESC orders;

ALTER TABLE orders
    DROP FOREIGN KEY fk_orders_c_id;

ALTER TABLE orders
    DROP INDEX fk_orders_c_id;

DESC orders;

SHOW INDEX FROM orders;

/*
## 练习 2
 */
CREATE TABLE IF NOT EXISTS pet
(
    name    VARCHAR(20) NOT NULL,
    owner   VARCHAR(20),
    species VARCHAR(20) NOT NULL,
    sex     CHAR(1)     NOT NULL,
    birth   YEAR        NOT NULL,
    death   YEAR
);

DESC pet;

INSERT INTO
    pet(name, owner, species, sex, birth, death)
    VALUES
        ('Fluffy', 'Harold', 'cat', 'f', '2003', '2010'),
        ('Claws', 'Gwen', 'cat', 'm', '2004', NULL),
        ('Buffy', NULL, 'dog', 'f', '2009', NULL),
        ('Fang', 'Benny', 'dog', 'm', '2000', NULL),
        ('Bowser', 'Diane', 'dog', 'm', '2003', '2009'),
        ('Chirpy', NULL, 'bird', 'f', '2008', NULL);

SELECT *
    FROM
        pet;

UPDATE pet
SET
    owner = 'Kevin'
    WHERE
          name = 'Fang'
      AND species = 'dog';

SELECT *
    FROM
        pet;

UPDATE pet
SET
    owner = 'Duck'
    WHERE
        owner IS NULL;

SELECT *
    FROM
        pet;

DELETE
    FROM
        pet
    WHERE
        death IS NOT NULL;

SELECT *
    FROM
        pet;

TRUNCATE TABLE pet;

SELECT *
    FROM
        pet;

/*
## 练习 3
 */
CREATE DATABASE IF NOT EXISTS test_company;








