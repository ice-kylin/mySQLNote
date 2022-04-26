/*
# 课后练习
 */
USE atguigudb;

# 1. 查询和 Zlotkey 相同部门的员工姓名和工资
SELECT
    last_name,
    employee_id
    FROM
        employees
    WHERE
            department_id = ANY (SELECT
                                     department_id
                                     FROM
                                         employees
                                     WHERE
                                         last_name = 'Zlotkey');

# 2. 查询工资比公司平均工资高的员工的员工号、姓名和工资
SELECT
    employee_id,
    last_name,
    salary
    FROM
        employees
    WHERE
            salary > (SELECT
                          AVG(salary)
                          FROM
                              employees);

# 3. 选择工资大于所有 JOB_ID = 'SA_MAN' 的员工工资的员工的 last_name、job_id 和 salary
SELECT
    last_name,
    job_id,
    salary
    FROM
        employees
    WHERE
            salary > ALL (SELECT
                              salary
                              FROM
                                  employees
                              WHERE
                                  job_id = 'SA_MAN');

# 4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名
SELECT
    e1.employee_id,
    e1.last_name
    FROM
        employees e1
    WHERE
        EXISTS(SELECT *
                   FROM
                       employees e2
                   WHERE
                         e1.department_id = e2.department_id
                     AND e2.last_name LIKE '%u%');

# 5. 查询在部门的 location_id 为 1700 的部门工作的员工的员工号
SELECT
    e.employee_id
    FROM
        employees e
            JOIN departments d ON e.department_id = d.department_id
    WHERE
        d.location_id = 1700;

SELECT
    e.employee_id
    FROM
        employees e
    WHERE
            1700 = (SELECT
                        d.location_id
                        FROM
                            departments d
                        WHERE
                            e.department_id = d.department_id);

# 6. 查询管理者是 King 的员工姓名和工资
SELECT
    e.last_name,
    e.salary
    FROM
        employees e
    WHERE
            e.manager_id = ANY (SELECT
                                    e2.employee_id
                                    FROM
                                        employees e2
                                    WHERE
                                        e2.last_name = 'King');

SELECT
    e1.last_name,
    e1.salary
    FROM
        employees e1
    WHERE
            'King' = (SELECT
                          e2.last_name
                          FROM
                              employees e2
                          WHERE
                              e1.manager_id = e2.employee_id);

# 7. 查询工资最低的员工的 last_name 和 salary
SELECT
    last_name,
    salary
    FROM
        employees
    WHERE
            salary = (SELECT
                          MIN(salary)
                          FROM
                              employees);

# 8. 查询平均工资最低的部门信息
SELECT *
    FROM
        departments d1
    WHERE
            d1.department_id = (SELECT
                                    department_id
                                    FROM
                                        employees e1,
                                        (SELECT
                                             AVG(salary) AS avg_sal
                                             FROM
                                                 employees e2
                                             GROUP BY
                                                 e2.department_id) AS t_e2a
                                    GROUP BY
                                        department_id
                                    HAVING
                                        AVG(e1.salary) = MIN(t_e2a.avg_sal));

# 9. 查询平均工资最低的部门信息和该部门的平均工资（相关子查询）
SELECT
    d.*,
    (SELECT
         AVG(salary)
         FROM
             employees
         WHERE
             department_id = d.department_id)
        AS avg_sal
    FROM
        departments d
    WHERE
            department_id = (SELECT
                                 department_id
                                 FROM
                                     employees
                                 GROUP BY
                                     department_id
                                 HAVING
                                         AVG(salary) = (SELECT
                                                            MIN(dept_avgsal)
                                                            FROM
                                                                (SELECT
                                                                     AVG(salary) AS dept_avgsal
                                                                     FROM
                                                                         employees
                                                                     GROUP BY
                                                                         department_id) AS t_avg_sal));

# 10. 查询平均工资最高的 job 信息
SELECT
    j.*
    FROM
        jobs j
    WHERE
            j.job_id = ANY (SELECT
                                e1.job_id
                                FROM
                                    employees e1
                                GROUP BY
                                    e1.job_id
                                HAVING
                                        AVG(e1.salary) >= ALL (SELECT
                                                                   AVG(e2.salary)
                                                                   FROM
                                                                       employees e2
                                                                   GROUP BY
                                                                       e2.job_id));

# 11. 查询平均工资高于公司平均工资的部门
SELECT
    d.*
    FROM
        employees e
            JOIN
            departments d ON e.department_id = d.department_id
    GROUP BY
        e.department_id
    HAVING
            AVG(e.salary) > (SELECT
                                 AVG(salary)
                                 FROM
                                     employees);

# 12. 查询出公司中所有 manager 的详细信息
SELECT
    m.*
    FROM
        employees m
    WHERE
        EXISTS(SELECT *
                   FROM
                       employees e
                   WHERE
                       e.manager_id = m.employee_id);

# 13. 查询各个部门中最高工资中最低的那个部门的最低工资
SELECT
    MIN(salary)
    FROM
        employees
    WHERE
            department_id = (SELECT
                                 department_id
                                 FROM
                                     employees
                                 GROUP BY
                                     department_id
                                 HAVING
                                         MAX(salary) <= ALL (SELECT
                                                                 MAX(salary) AS max_sal
                                                                 FROM
                                                                     employees
                                                                 GROUP BY
                                                                     department_id));

SELECT
    MIN(salary)
    FROM
        employees
    GROUP BY
        department_id
    HAVING
            MAX(salary) = (SELECT
                               MIN(max_sal) AS min_sal
                               FROM
                                   (SELECT
                                        MAX(salary) AS max_sal
                                        FROM
                                            employees
                                        GROUP BY
                                            department_id) AS ems);

# 14. 查询平均工资最高的部门的 manager 的详细信息：last_name、department_id、email、salary
SELECT
    e.last_name,
    e.department_id,
    e.email,
    e.salary
    FROM
        employees e
    WHERE
            employee_id = (SELECT
                               d.manager_id
                               FROM
                                   departments d
                               WHERE
                                       d.department_id = (SELECT
                                                              department_id
                                                              FROM
                                                                  employees
                                                              GROUP BY
                                                                  department_id
                                                              HAVING
                                                                      AVG(salary) >= ALL (SELECT
                                                                                              AVG(salary)
                                                                                              FROM
                                                                                                  employees
                                                                                              GROUP BY
                                                                                                  department_id)));

SELECT
    employee_id,
    last_name,
    department_id,
    email,
    salary
    FROM
        employees
    WHERE
            employee_id IN (SELECT DISTINCT
                                manager_id
                                FROM
                                    employees
                                WHERE
                                        department_id = (SELECT
                                                             department_id
                                                             FROM
                                                                 employees
                                                             GROUP BY
                                                                 department_id
                                                             HAVING
                                                                     AVG(salary) = (SELECT
                                                                                        MAX(avg_sal)
                                                                                        FROM
                                                                                            (SELECT
                                                                                                 AVG(salary) AS avg_sal
                                                                                                 FROM
                                                                                                     employees
                                                                                                 GROUP BY
                                                                                                     department_id) dept_sal)));

# 15. 查询部门的部门号，其中不包括 job_id 是 'ST_CLERK' 的部门号
SELECT
    d.department_id
    FROM
        departments d
    WHERE
        NOT EXISTS(SELECT *
                       FROM
                           employees e
                       WHERE
                             d.department_id = e.department_id
                         AND job_id = 'ST_CLERK');

# 16. 查询所有没有管理者的员工的 last_name
SELECT
    e.last_name
    FROM
        employees e
            LEFT JOIN employees m ON e.manager_id = m.employee_id
    WHERE
        m.employee_id IS NULL;

SELECT
    last_name
    FROM
        employees e1
    WHERE
        NOT EXISTS(
                SELECT *
                    FROM
                        employees e2
                    WHERE
                        e1.manager_id = e2.employee_id
            );

# 17. 查询员工号、姓名、雇用时间、工资，其中员工的管理者为 'De Haan'
SELECT
    e1.employee_id,
    e1.last_name,
    e1.hire_date,
    e1.salary
    FROM
        employees e1
    WHERE
        EXISTS(SELECT *
                   FROM
                       employees e2
                   WHERE
                         e1.manager_id = e2.employee_id
                     AND e2.last_name = 'De Haan');

SELECT
    e1.employee_id,
    e1.last_name,
    e1.hire_date,
    e1.salary
    FROM
        employees e1
            JOIN employees e2 ON e1.manager_id = e2.employee_id
    WHERE
        e2.last_name = 'De Haan';

# 18. 查询各部门中工资比本部门平均工资高的员工的员工号、姓名和工资（相关子查询）
SELECT
    e1.employee_id,
    e1.last_name,
    e1.salary
    FROM
        employees e1
    WHERE
            salary > (SELECT
                          AVG(e2.salary)
                          FROM
                              employees e2
                          WHERE
                              e1.department_id = e2.department_id
                          GROUP BY
                              department_id);

# 19. 查询每个部门下的部门人数大于 5 的部门名称（相关子查询）
SELECT
    d.department_name
    FROM
        departments d
    WHERE
            5 < (SELECT
                     COUNT(*)
                     FROM
                         employees e
                     WHERE
                         d.department_id = e.department_id);

# 20. 查询每个国家下的部门个数大于 2 的国家编号（相关子查询）
SELECT
    c.country_id
    FROM
        countries c
    WHERE
            2 < (SELECT
                     COUNT(*)
                     FROM
                         (SELECT
                              country_id AS c_i
                              FROM
                                  departments d
                                      LEFT JOIN locations l ON d.location_id = l.location_id) AS t_dlci
                     WHERE
                         t_dlci.c_i = c.country_id
                     GROUP BY
                         c_i);

/*
## 子查询的编写技巧

- 从里往外写
- 从外往里写
- 如果子查询相对较简单，建议从外往里写
- 一旦子查询结构较复杂，则建议从里往外写
- 如果是相关子查询通常都是从外往里写
 */
