/*
# JSON 类型
 */
CREATE TABLE test_json1
(
    f1 JSON
);

DESC test_json1;

INSERT INTO
    test_json1 (f1)
    VALUES
        ('{
          "name": "icekylin",
          "age": 19,
          "address": {
            "province": "West Midland",
            "city": "Birmingham"
          }
        }');

SELECT *
    FROM
        test_json1;

SELECT
    f1 -> '$.name'             AS `name`,
    f1 -> '$.age'              AS age,
    f1 -> '$.address.province' AS province,
    f1 -> '$.address.city'     AS city
    FROM
        test_json1;
