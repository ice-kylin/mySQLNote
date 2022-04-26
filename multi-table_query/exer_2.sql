CREATE TABLE `t_dept`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `deptname` varchar(30) DEFAULT NULL,
    `address`  varchar(40) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = INNODB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

CREATE TABLE `t_emp`
(
    `id`     int(11) NOT NULL AUTO_INCREMENT,
    `name`   varchar(20) DEFAULT NULL,
    `age`    int(3) DEFAULT NULL,
    `deptid` int(11) DEFAULT NULL,
    empno    int NOT NULL,
    PRIMARY KEY (`id`),
    key      `idx_dept_id` (`deptid`)
        #CONSTRAINT `fk_dept_id` FOREIGN KEY (`deptId`) REFERENCES `t_dept` (`id`)
) ENGINE = INNODB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

INSERT INTO
    t_dept(deptname, address)
    VALUES
        ('华山', '华山');
INSERT INTO
    t_dept(deptname, address)
    VALUES
        ('丐帮', '洛阳');
INSERT INTO
    t_dept(deptname, address)
    VALUES
        ('峨眉', '峨眉山');
INSERT INTO
    t_dept(deptname, address)
    VALUES
        ('武当', '武当山');
INSERT INTO
    t_dept(deptname, address)
    VALUES
        ('明教', '光明顶');
INSERT INTO
    t_dept(deptname, address)
    VALUES
        ('少林', '少林寺');
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('风清扬', 90, 1, 100001);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('岳不群', 50, 1, 100002);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('令狐冲', 24, 1, 100003);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('洪七公', 70, 2, 100004);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('乔峰', 35, 2, 100005);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('灭绝师太', 70, 3, 100006);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('周芷若', 20, 3, 100007);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('张三丰', 100, 4, 100008);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('张无忌', 25, 5, 100009);
INSERT INTO
    t_emp(name, age, deptid, empno)
    VALUES
        ('韦小宝', 18, NULL, 100010);

#
1. 所有有门派的人员信息
（A
、B 两表共有
）
SELECT
    e.id,
    e.name,
    e.age,
    e.deptid,
    d.deptname
    FROM
        t_emp e
            JOIN t_dept d ON e.deptid = d.id;

#
2. 列出所有用户
，并显示其机构信息
（A 的全集
）
SELECT
    e.id,
    e.name,
    e.age,
    e.deptid,
    d.deptname
    FROM
        t_emp e
            LEFT JOIN t_dept d ON e.deptid = d.id;

#
3. 列出所有门派
（B 的全集
）
SELECT
    d.id,
    d.deptname,
    e.id,
    e.name,
    e.age
    FROM
        t_dept d
            LEFT JOIN t_emp e ON d.id = e.deptid;

#
4. 所有不入门派的人员
（A 的独有
）
SELECT
    e.id,
    e.name,
    e.age,
    e.deptid
    FROM
        t_emp e
            LEFT JOIN t_dept d ON e.deptid = d.id
    WHERE
        d.id IS NULL;

#
5. 所有没人入的门派
（B 的独有
）
SELECT *
    FROM
        t_dept b
            LEFT JOIN t_emp a ON b.id = a.deptid
    WHERE
        a.deptid IS NULL;

SELECT *
    FROM
        t_emp a
            RIGHT JOIN t_dept b ON a.deptid = b.id
    WHERE
        a.deptid IS NULL;

#
6. 列出所有人员和机构的对照关系
（AB 全有
）
SELECT *
    FROM
        t_emp a
            LEFT JOIN t_dept b ON a.deptid = b.id
UNION ALL
SELECT *
    FROM
        t_emp a
            RIGHT JOIN t_dept b ON a.deptid = b.id
    WHERE
        a.deptid IS NULL;

#
7. 列出所有没入派的人员和没人入的门派
（A 的独有 + B 的独有
）
SELECT *
    FROM
        t_emp e
            LEFT JOIN t_dept d ON e.deptid = d.id
    WHERE
        d.id IS NULL
UNION ALL
SELECT *
    FROM
        t_emp a
            RIGHT JOIN t_dept b ON a.deptid = b.id
    WHERE
        a.deptid IS NULL;
