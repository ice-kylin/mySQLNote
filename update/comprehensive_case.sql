/*
# 综合案例
 */
# 1. 创建数据库 test01_library
CREATE DATABASE IF NOT EXISTS test01_library;

SHOW DATABASES;

USE test01_library;

# 2. 创建表 books
CREATE TABLE IF NOT EXISTS books
(
    id        INT,
    `name`    VARCHAR(50),
    `authors` VARCHAR(100),
    price     FLOAT,
    pubdate   YEAR,
    note      VARCHAR(100),
    num       INT
);

DESC books;

SELECT *
    FROM
        books;

# 3. 向 books 表中插入记录
# 1）不指定字段名称，插入第一条记录
INSERT INTO
    books
    VALUES
        (1, 'Tal of AAA', 'Dickes', 23, 1995, 'novel', 11);

SELECT *
    FROM
        books;

# 2）指定所有字段名称，插入第二条记录
INSERT INTO
    books(id, name, authors, price, pubdate, note, num)
    VALUES
        (2, 'EmmaT', 'Jane lura', 35, 1993, 'joke', 22);

SELECT *
    FROM
        books;

# 3）同时插入多条记录（剩下的所有记录）
INSERT INTO
    books(id, name, authors, price, pubdate, note, num)
    VALUES
        (3, 'Story of Jane', 'Jane Tim', 40, 2001, 'novel', 0),
        (4, 'Lovey Day', 'George Byron', 20, 2005, 'novel', 30),
        (5, 'Old land', 'Honore Blade', 30, 2010, 'law', 0),
        (6, 'The Battle', 'Upton Sara', 30, 1999, 'medicine', 40),
        (7, 'Rose Hood', 'Richard haggard', 28, 2008, 'cartoon', 28);

SELECT *
    FROM
        books;

# 4. 将小说类型（novel）的书的价格都增加 5
UPDATE books
SET
    price = price + 5
    WHERE
        note = 'novel';

SELECT *
    FROM
        books;

# 5. 将名称为 EmmaT 的书的价格改为 40，并将说明改为 drama
UPDATE books
SET
    price = 40,
    note  = 'drama'
    WHERE
        name = 'EmmaT';

SELECT *
    FROM
        books;

# 6. 删除库存为 0 的记录
DELETE
    FROM
        books
    WHERE
        num = 0;

SELECT *
    FROM
        books;

DROP TABLE IF EXISTS books;

# 7. 查询书名中包含 a 字母的书
SELECT *
    FROM
        books
    WHERE
        name LIKE '%a%';

# 8. 统计书名中包含 a 字母的书的数量和库存总量
SELECT
    COUNT(*) AS num_of_book,
    SUM(num) AS total_inventory
    FROM
        books
    WHERE
        name LIKE '%a%';

# 9. 找出 novel 类型的书，按照价格降序排列
SELECT *
    FROM
        books
    WHERE
        note = 'novel'
    ORDER BY
        price DESC;

# 10. 查询图书信息，按照库存量降序排列，如果库存量相同的按照 note 升序排列
SELECT *
    FROM
        books
    ORDER BY
        num DESC, note;

# 11. 按照 note 分类统计书的数量
SELECT
    note,
    COUNT(*) AS num_of_book
    FROM
        books
    GROUP BY
        note;

# 12. 按照 note 分类统计书的库存量，显示库存量超过 30 本的
SELECT
    note,
    SUM(num) AS total_inventory
    FROM
        books
    GROUP BY
        note
    HAVING
        total_inventory > 30;

# 13. 查询所有图书，每页显示 5 本，显示第二页
SELECT *
    FROM
        books
    LIMIT 5, 5;

# 14. 按照 note 分类统计书的库存量，显示库存量最多的
SELECT
    note,
    SUM(num) AS total_inventory
    FROM
        books
    GROUP BY
        note
    HAVING
            total_inventory = (SELECT
                                   MAX(total_inventory)
                                   FROM
                                       (SELECT
                                            SUM(num) AS total_inventory
                                            FROM
                                                books
                                            GROUP BY
                                                note) AS bti);

# 15. 查询书名达到 10 个字符的书，不包括里面的空格
SELECT *
    FROM
        books
    WHERE
        LENGTH(REPLACE(`name`, ' ', '')) >= 10;

SELECT
    `name`,
    LENGTH(REPLACE(`name`, ' ', ''))
    FROM
        books;

# 16. 查询书名和类型，其中 note 值为 novel 显示小说、law 显示法律、medicine 显示医药、cartoon 显示卡通、joke 显示笑话
SELECT
    `name`,
    note,
    CASE note
        WHEN 'novel'
            THEN '小说'
        WHEN 'law'
            THEN '法律'
        WHEN 'medicine'
            THEN '医药'
        WHEN 'cartoon'
            THEN '卡通'
        WHEN 'joke'
            THEN '笑话'
    END AS type
    FROM
        books;

# 17. 查询书名、库存，其中 num 值超过 30 本的，显示滞销；大于 0 并低于 10 的，显示畅销；为 0 的显示无货
SELECT
    `name`,
    num,
    CASE
        WHEN num > 30
            THEN '滞销'
        WHEN num > 0 AND num < 10
            THEN '畅销'
        WHEN num = 0
            THEN '无货'
            ELSE '正常'
    END AS sales
    FROM
        books;

# 18. 统计每一种 note 的库存量，并合计总量
SELECT
    IFNULL(note, '合计') AS note,
    SUM(num)           AS sum
    FROM
        books
    GROUP BY
        note
WITH
    ROLLUP;

# 19. 统计每一种 note 的数量，并合计总量
SELECT
    note,
    COUNT(*)
    FROM
        books
    GROUP BY
        note
WITH
    ROLLUP;

# 20. 统计库存量前三名的图书
SELECT *
    FROM
        books
    ORDER BY
        num DESC
    LIMIT 3;

# 21. 找出最早出版的一本书
SELECT *
    FROM
        books
    WHERE
            pubdate = (SELECT
                           MIN(pubdate)
                           FROM
                               books);

# 22. 找出 novel 中价格最高的一本书
SELECT *
    FROM
        books
    WHERE
          note = 'novel'
      AND price >= ALL (SELECT
                            price
                            FROM
                                books
                            WHERE
                                note = 'novel');

# 23. 找出书名中字数最多的一本书，不含空格
SELECT *
    FROM
        books
    WHERE
            LENGTH(REPLACE(name, ' ', '')) = (SELECT
                                                  MAX(LENGTH(REPLACE(name, ' ', '')))
                                                  FROM
                                                      books);
