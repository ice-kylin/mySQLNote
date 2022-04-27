/*
# 课后练习
 */

#
1. 显示系统时间
（注
：日期 + 时间
）
SELECT
    now(),
    sysdate()
    FROM
        dual;

#
2. 查询员工号
、姓名
、工资
、以及工资提高 20% 后的结果
（NEW salary
）
SELECT
    employee_id,
    last_name,
    salary,
    salary * 1.2 AS "new salary"
    FROM
        employees;

#
3. 将员工的姓名按首字母排序
，并写出姓名的长度
（LENGTH
）
SELECT
    last_name,
    length(last_name) AS length
    FROM
        employees
    ORDER BY
        last_name;

SELECT
    last_name,
    length(last_name) AS length
    FROM
        employees
    ORDER BY
        length;

#
4. 查询员工 id
、last_name
、salary
，并作为一个列输出
，别名为 OUT_PUT
SELECT
    concat_ws(', ', employee_id, last_name, salary) AS "out_put"
    FROM
        employees;

#
5. 查询公司各员工工作的年数
、工作的天数
，并按工作年数的降序排序
SELECT *
    FROM
        employees;

SELECT
    employee_id,
    last_name,
    hire_date,
    YEAR (
    FROM_DAYS(
    DATEDIFF(
    CURDATE(
    ), hire_date))) AS years_worked,
    DATEDIFF(
    CURDATE(
    ), hire_date) AS days_worked
    FROM
        employees
    ORDER BY
        years_worked DESC;

#
6. 查询员工姓名
、hire_date
、department_id
，满足以下条件
：雇用时间在 1997 年之后
、department_id
# 为 80 或 90 或 110
、commission_pct 不为空
SELECT
    last_name,
    hire_date,
    department_id,
    commission_pct
    FROM
        employees
    WHERE
          datediff(hire_date, '1997-01-01') >= 0
      AND department_id IN (80, 90, 110)
      AND commission_pct IS NOT NULL;

#
7. 查询公司中入职超过 10000 天的员工姓名
、入职时间
SELECT
    last_name,
    hire_date,
    datediff(curdate(), hire_date)
    FROM
        employees
    WHERE
        datediff(curdate(), hire_date) >= 10000;

#
8. 做一个查询
，产生下面的结果
# <last_name> earns <salary> monthly but wants <salary * 3>
SELECT
    concat(last_name, ' earns ', salary, ' monthly but wants ', salary * 3)
    FROM
        employees;

SELECT
    last_name,
    job_id,
    CASE job_id
        WHEN 'AD_PRES' THEN 'A'
        WHEN 'ST_MAN' THEN 'B'
        WHEN 'IT_PROG' THEN 'C'
        WHEN 'SA_REP' THEN 'D'
        WHEN 'ST_CLERK' THEN 'E' END AS "grade"
    FROM
        employees;
