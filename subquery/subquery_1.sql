/*
# 子查询
 */
# 查询谁的工资比 Abel 的高
# 方式一
SELECT
    salary
    FROM
        employees
    WHERE
        last_name = 'Abel';

SELECT
    last_name,
    salary
    FROM
        employees
    WHERE
        salary > 11000;

# 方式二：内连接
SELECT
    e2.last_name,
    e2.salary
    FROM
        employees e1
            JOIN employees e2 ON e2.salary > e1.salary
    WHERE
        e1.last_name = 'Abel';

# 方式三：子查询
SELECT
    last_name,
    salary
    FROM
        employees
    WHERE
            salary > (SELECT
                          salary
                          FROM
                              employees
                          WHERE
                              last_name = 'Abel');

/*
- 称谓的规范：外查询（主查询）、内查询（子查询）
- 子查询在主查询之前一次执行完成
- 子查询的结果被主查询使用
- 注意事项
  - 子查询要包含在括号内
  - 将子查询放在比较条件的右侧
  - 单行操作符对应单行子查询
  - 多行操作符对应多行子查询

## 子查询的分类

1. 从内查询返回的结果的条目数
  - 单行子查询 vs 多行子查询
2. 内查询是否被执行多次
  - 相关子查询 vs 不相关子查询
 */
# 相关子查询的需求：查询工资大于本部门平均工资的员工信息

# 不相关子查询的需求：查询工资大于本工资平均工资的员工信息
