/*
题目：根据以下需求创建一张用户信息表（user）
请根据给定的字段说明及约束条件，编写对应的 MySQL 建表语句（CREATE TABLE）。
字段及要求如下：
1. id
   - 含义：ID唯一标识
   - 类型：int
   - 约束：主键，并且自动增长
2. name
   - 含义：姓名
   - 类型：varchar(10)
   - 约束：不能为空，并且唯一
3. age
   - 含义：年龄
   - 类型：int
   - 约束：年龄大于 0，并且小于等于 120
4. status
   - 含义：状态
   - 类型：char(1)
   - 约束：如果没有指定该值，默认值为 1
5. gender
   - 含义：性别
   - 类型：char(1)
   - 约束：无特殊约束
要求：
- 表名为 user
- 使用合适的字段约束（如 PRIMARY KEY、AUTO_INCREMENT、NOT NULL、UNIQUE、CHECK、DEFAULT 等）
- 写出完整的 CREATE TABLE 语句
*/

create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) NOT NULL UNIQUE comment '姓名' ,
    age int CHECK(age <= 120 AND age > 0) comment '年龄' ,
    status char(1) DEFAULT '1' comment'状态' ,
    gender char(1) comment '性别'
) comment '用户表';

-- 插入数据
insert into user(name, age, status, gender) values (' Tom1', '19', '1', '男'),
                                                   (' Tom2', '25', '0', '男');

insert into user(name, age, status, gender) values (' Tom3', '19', '1', '男');

insert into user(name, age, status, gender) values (' Tom4', '190', '1', '男');

insert into user(name, age, gender) values (' Tom4', '120', '男');


-- 创建部门表
CREATE TABLE dept (
    id INT AUTO_INCREMENT COMMENT 'ID' PRIMARY KEY,
    name VARCHAR(50) NOT NULL COMMENT '部门名称'
) COMMENT='部门表';

-- 插入部门数据
INSERT INTO dept (id, name) VALUES
(1, '研发部'),
(2, '市场部'),
(3, '财务部'),
(4, '销售部'),
(5, '总经办');


-- 创建员工表
CREATE TABLE emp (
    id INT AUTO_INCREMENT COMMENT 'ID' PRIMARY KEY,
    name VARCHAR(50) NOT NULL COMMENT '姓名',
    age INT COMMENT '年龄',
    job VARCHAR(20) COMMENT '职位',
    salary INT COMMENT '薪资',
    entrydate DATE COMMENT '入职时间',
    managerid INT COMMENT '直属领导ID',
    dept_id INT COMMENT '部门ID'
) COMMENT='员工表';
-- 插入数据
INSERT INTO emp (id, name, age, job, salary, entrydate, managerid, dept_id) VALUES
(1, '金庸', 66, '总裁', 20000, '2000-01-01', NULL, 5),
(2, '张无忌', 20, '项目经理', 12500, '2005-12-05', 1, 1),
(3, '杨逍', 33, '开发', 8400, '2000-11-03', 2, 1),
(4, '韦一笑', 48, '开发', 11000, '2002-02-05', 2, 1),
(5, '常遇春', 43, '开发', 10500, '2004-09-07', 3, 1),
(6, '小昭', 19, '程序员鼓励师', 6600, '2004-10-12', 2, 1);

drop table emp;

-- 增加外键

alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);

-- 删除外键

alter table emp drop foreign key fk_emp_dept_id;

-- 多对多

-- 创建学生表
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    name VARCHAR(10) COMMENT '姓名',
    no VARCHAR(10) COMMENT '学号'
) COMMENT='学生表';

-- 插入学生数据
INSERT INTO student VALUES
(NULL, '张三丰', '2000100101'),
(NULL, '谢逊', '2000100102'),
(NULL, '殷天正', '2000100103'),
(NULL, '韦一笑', '2000100104');


-- 创建课程表
CREATE TABLE course (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    name VARCHAR(10) COMMENT '课程名称'
) COMMENT='课程表';

-- 插入课程数据
INSERT INTO course VALUES
(NULL, 'Java'),
(NULL, 'PHP'),
(NULL, 'MySQL'),
(NULL, 'Hadoop');

-- 创建学生课程中间表
CREATE TABLE student_course (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
    studentid INT NOT NULL COMMENT '学生ID',
    courseid INT NOT NULL COMMENT '课程ID',
    CONSTRAINT fk_courseid FOREIGN KEY (courseid) REFERENCES course (id),
    CONSTRAINT fk_studentid FOREIGN KEY (studentid) REFERENCES student (id)
) COMMENT='学生课程中间表';


-- 往emp表插入数据 （使用emp表和dept表进行练习多表查询）

INSERT INTO emp (id, name, age, job, salary, entrydate, managerid, dept_id) VALUES
(1, '金庸', 66, '总裁', 20000, '2000-01-01', NULL, 5),
(2, '张无忌', 20, '项目经理', 12500, '2005-12-05', 1, 1),
(3, '杨逍', 33, '开发', 8400, '2000-11-03', 2, 1),
(4, '韦一笑', 48, '开发', 11000, '2002-02-05', 2, 1),
(5, '常遇春', 43, '开发', 10500, '2004-09-07', 3, 1),
(6, '小昭', 19, '程序员鼓励师', 6600, '2004-10-12', 2, 1),
(7, '灭绝', 60, '财务总监', 8500, '2002-09-12', 1, 3),
(8, '周芷若', 19, '会计', 48000, '2006-06-02', 7, 3),
(9, '丁敏君', 23, '出纳', 5250, '2009-05-13', 7, 3),
(10, '赵敏', 20, '市场部总监', 12500, '2004-10-12', 1, 2),
(11, '鹿杖客', 56, '职员', 3750, '2006-10-03', 10, 2),
(12, '鹤笔翁', 19, '职员', 3750, '2007-05-09', 10, 2),
(13, '方东白', 19, '职员', 5500, '2009-02-12', 10, 2),
(14, '张三丰', 88, '销售总监', 14000, '2004-10-12', 1, 4),
(15, '俞莲舟', 38, '销售', 4600, '2004-10-12', 14, 4),
(16, '宋远桥', 40, '销售', 4600, '2004-10-12', 14, 4),
(17, '陈友谅', 42, NULL, 2000, '2011-10-12', 1, NULL);

-- 多表查询
-- 笛卡尔积 (发现有102行，因为emp表有17行，dept表有6行，17 x 6 = 102，这种行为称为笛卡尔积)
select * from emp, dept;

-- 消除笛卡尔积
select * from emp, dept
where emp.dept_id = dept.id;

-- 内连接演示

-- 1. 查询每一个员工的姓名，以及关联的部门的名称（隐式内连接实现）
    select emp.name, dept.name from emp, dept
    where emp.dept_id = dept.id;

-- 2. 查询每一个员工的姓名，以及关联的部门的名称（显式内连接实现）
    select emp.name, dept.name from emp
    inner join dept on emp.dept_id = dept.id;


-- 外连接

-- 1. 查询 emp 表的所有数据，和对应的部门信息（左外连接）
select emp.*, dept.name from emp left join dept on emp.dept_id = dept.id;
-- 2. 查询 dept 表的所有数据，和对应的员工信息（右外连接）
select emp.*, dept.name from emp right join dept on emp.dept_id = dept.id;

-- 自连接

-- 1. 查询员工及其所属领导的名字
select e.name, l.name from emp e join emp l on e.managerid = l.id;
-- 2. 查询所有员工 emp 及其领导的名字 emp，如果员工没有领导，也需要查询出来
select e.name '员工', l.name '领导' from emp e left join emp l on e.managerid = l.id;

-- union all , union

-- 1. 将薪资低于 5000 的员工，和年龄大于 50 岁的员工全部查询出来
-- 使用union all是直接将所有数据都查出来（有重复值（既低于5000又大于50岁） 重复值会显示两次（一次是查出小于5000的一次是查出大于50岁的））
select * from emp where salary < 5000
UNION ALL
select * from emp where age > 50;

-- 使用Union 直接就可以去重 （将查询的结果合并之后去重）
select * from emp where salary < 5000
UNION
select * from emp where age > 50;

-- 标量子查询

-- 1. 查询 "销售部" 的所有员工信息

-- 1. 查询出销售部的id 2. 根据查出的销售部id查到所有员工信息

select * from emp where dept_id = (
    select id from dept
    where name = '销售部'
    );


-- 2. 查询在 "方东白" 入职之后的员工信息

-- 查东方白入职时间    大于这个时间的员工信息

select * from emp where entrydate > (
    select entrydate from emp
    where name = '方东白'
    );

-- 列子查询

-- 1. 查询 "销售部" 和 "市场部" 的所有员工信息
select * from emp where dept_id IN (
    select id from dept
    where name in ('销售部', '市场部')
    );
-- 2. 查询比财务部所有人工资都高的员工信息
select * from emp where salary > all(
    select salary from emp where dept_id =(
        select id from dept
                  where name ='财务部'
        )
);

-- 3. 查询比研发部其中任意一人工资高的员工信息
select * from emp where salary > some(
    select salary from emp
                  where dept_id = (
                      select id from dept
                                where name = '研发部'
                      )
);



-- 行子查询

-- 1. 查询与 "张无忌" 的薪资及直属领导相同的员工信息

select * from emp where (salary, managerid) = (
    select salary, managerid from emp where name = '张无忌'
    );

-- 表子查询

-- 1. 查询与 "鹿杖客"、"宋远桥" 的职位和薪资相同的员工信息
    select * from emp where (job, salary) IN (
        select job, salary from emp where name in('鹿杖客', '宋远桥')
        );

-- 2. 查询入职日期是 "2006-01-01" 之后的员工信息，及其部门信息
select d.name, e.* from emp e left join dept d on e.dept_id = d.id where e.entrydate in  (
    select entrydate from emp where entrydate > '2006-01-01'
                                                                       );

select * from emp where entrydate > '2006-01-01';

select * from (select * from emp where entrydate > '2006-01-01') e left join dept d on e.dept_id = d.id;


-- 创建薪资等级表
CREATE TABLE salgrade (
    grade INT,
    losal INT,
    hisal INT
) COMMENT='薪资等级表';

-- 插入薪资等级数据
INSERT INTO salgrade VALUES (1, 0, 3000);
INSERT INTO salgrade VALUES (2, 3001, 5000);
INSERT INTO salgrade VALUES (3, 5001, 8000);
INSERT INTO salgrade VALUES (4, 8001, 10000);
INSERT INTO salgrade VALUES (5, 10001, 15000);
INSERT INTO salgrade VALUES (6, 15001, 20000);
INSERT INTO salgrade VALUES (7, 20001, 25000);
INSERT INTO salgrade VALUES (8, 25001, 30000);


-- 1. 查询员工的姓名、年龄、职位、部门信息。
select e.name, e.age, e.job, d.name from emp e left join dept d on e.dept_id = d.id;

-- 2. 查询年龄小于 30 岁的员工姓名、年龄、职位、部门信息。
select e.name, e.age, e.job, d.name from emp e left join dept d on e.dept_id = d.id where e.age < 30;
-- 3. 查询拥有员工的部门 ID、部门名称。
select distinct d.id, d.name from dept d join emp e on d.id = e.dept_id;
-- 4. 查询所有年龄大于 40 岁的员工，及其归属的部门名称；如果员工没有分配部门，也需要展示出来。
select e.*, d.name
from emp e
         left join dept d on e.dept_id = d.id
where age > all (select age
                 from emp
                 where age = 40
);
-- 5. 查询所有员工的工资等级。

select e.name, s.grade from salgrade s, emp e where e.salary between s.losal and s.hisal;

-- 6. 查询 "研发部" 所有员工的信息及工资等级。
select e.name, s.grade
from salgrade s,
     emp e
where e.salary between s.losal and s.hisal
  and e.dept_id = (select id
                   from dept
                   where name = '研发部');

-- 7. 查询 "研发部" 员工的平均工资。
select round(avg(emp.salary), 0) from emp where dept_id in (
    select id from dept where name = '研发部'
    );

select round(avg(emp.salary), 0) from emp join dept on emp.dept_id = dept.id where dept.name = '研发部';

-- 8. 查询工资比 "灭绝" 高的员工信息。
select * from emp where salary > (
    select salary from emp where name = '灭绝'
    ); #因为只有一个灭绝，所以这个是标量子查询

-- 9. 查询比平均薪资高的员工信息。
select * from emp where salary > (
    select avg(salary) from emp
    );

-- 10. 查询低于本部门平均工资的员工信息。

select name, salary, dept_id from emp; -- a表
select dept_id, round(avg(emp.salary), 0) from emp group by dept_id; -- b表

select a.name, a.salary, b.dept_avg_salary, b.dept_id from (select name, salary, dept_id from emp) a join (select dept_id, round(avg(emp.salary), 0) AS dept_avg_salary
                                                              from emp group by dept_id) b on a.dept_id = b.dept_id where a.salary < b.dept_avg_salary;

SELECT e.name, e.salary, e.dept_id
FROM emp e
WHERE e.salary < (
    SELECT ROUND(AVG(e2.salary), 0)
    FROM emp e2
    WHERE e2.dept_id = e.dept_id
);

-- 11. 查询所有的部门信息，并统计部门的员工人数。
select * from dept where id IN (
    select emp.dept_id from emp
    );

select d.id, d.name, count(e.id) from emp e right join dept d on e.dept_id = d.id group by d.id, d.name;

SELECT d.id, d.name, COUNT(e.id)
FROM dept d
LEFT JOIN emp e ON e.dept_id = d.id
GROUP BY d.id, d.name;

select d.id, d.name,(select count(*) from emp e where e.dept_id = d.id) '人数' from dept d;

select count(*) from emp where dept_id = '1';

-- 12. 查询所有学生的选课情况，展示出学生名称、学号、课程名称。

INSERT INTO student_course (studentid, courseid) VALUES
(2, 1),  -- 学生2 选 Java
(2, 3),  -- 学生2 选 MySQL
(2, 2),  -- 学生2 选 PHP
(3, 3),  -- 学生3 选 MySQL
(3, 4),  -- 学生3 选 Hadoop
(4, 1),  -- 学生4 选 Java
(4, 2);  -- 学生4 选 PHP

SELECT s.name, s.no, c.name
FROM student s
LEFT JOIN student_course sc ON sc.studentid = s.id
LEFT JOIN course c ON sc.courseid = c.id;
--

