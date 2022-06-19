/*
# 游标

## 游标使用的步骤

1. 声明游标
2. 打开游标
3. 使用游标（从游标中获取数据）
4. 关闭游标
 */
USE dbtest16;

# 创建存储过程 get_count_by_limit_total_salary()
# 声明 IN 参数 limit_total_salary，DOUBLE 类型
# 声明 OUT 参数 total_count，INT 类型
# 函数的功能可以实现累加薪资最高的几个员工的薪资值，直到薪资总和
# 达到 limit_total_salary 参数的值，返回累加的人数给 total_count
DELIMITER //

CREATE PROCEDURE get_count_by_limit_total_salary(IN limit_total_salary DOUBLE, OUT total_count INT)
BEGIN
    # 声明局部变量
    DECLARE sum_sal DOUBLE DEFAULT 0; # 记录累加的工资总额
    DECLARE e_sal DOUBLE; # 记录每一个员工的工资
    DECLARE e_cursor CURSOR FOR SELECT
                                    salary
                                    FROM
                                        employees
                                    ORDER BY
                                        salary DESC; # 1. 声明游标

    SET total_count := 0;

    OPEN e_cursor; # 2. 打开游标

    REPEAT
        FETCH e_cursor INTO e_sal; # 3. 使用游标

        SET sum_sal := sum_sal + e_sal;
        SET total_count := total_count + 1;
    UNTIL sum_sal >= limit_total_salary END REPEAT;

    CLOSE e_cursor; # 4. 关闭游标
END //

DELIMITER ;

CALL get_count_by_limit_total_salary(200000, @total_count);

SELECT
    @total_count
    FROM
        dual;
