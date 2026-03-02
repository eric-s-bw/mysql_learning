
#清理之前的表
drop table employee;


#数据准备
create table emp(
    id int comment '编号',
    workno varchar(10) comment '工号',
    name varchar(10) comment '姓名',
    gender char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard char(18) comment '身份证号',
    workaddress varchar(50) comment '工作地址',
    entrydate date comment '入职时间'
) comment '员工表';

#插入数据记录
insert into emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
values
(1, '1', '柳岩', '女', 20, '123456789012345678', '北京', '2000-01-01'),
(2, '2', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01'),
(3, '3', '韦一笑', '男', 38, '123456789712345670', '上海', '2005-08-01'),
(4, '4', '赵敏', '女', 18, '123456757123845670', '北京', '2009-12-01'),
(5, '5', '小昭', '女', 16, '123456769012345678', '上海', '2007-07-01'),
(6, '6', '杨逍', '男', 28, '12345678931234567X', '北京', '2006-01-01'),
(7, '7', '范瑶', '男', 40, '123456789212345670', '北京', '2005-05-01'),
(8, '8', '黛绮丝', '女', 38, '123456157123645670', '天津', '2015-05-01'),
(9, '9', '范凉凉', '女', 45, '123156789012345678', '北京', '2010-04-01'),
(10, '10', '陈友谅', '男', 53, '123456789012345670', '上海', '2011-01-01'),
(11, '11', '张士诚', '男', 55, '123567897123465670', '江苏', '2015-05-01'),
(12, '12', '常遇春', '男', 32, '123446757152345670', '北京', '2004-02-01'),
(13, '13', '张三丰', '男', 88, '123656789012345678', '江苏', '2020-11-01'),
(14, '14', '灭绝', '女', 65, '123456719012345670', '西安', '2019-05-01'),
(15, '15', '胡青牛', '男', 70, '12345674971234567X', '西安', '2018-04-01'),
(16, '16', '周芷若', '女', 18, null, '北京', '2012-06-01');

#相关练习
-- 基本查询

-- 1. 查询指定字段 name、workno、age 返回
select name, workno, age from emp;

-- 2. 查询所有字段返回
#不建议使用*，影响规范性
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp;

select * from emp;

-- 3. 查询所有员工的工作地址，起别名
select workaddress as work from emp;

select workaddress as '工作地址' from emp;
select workaddress '工作地址' from emp; #as可以省略

-- 4. 查询公司员工的上班地址（不要重复）
select distinct workaddress from emp;

select distinct workaddress as '工作地址' from emp;


-- 条件查询

-- 1. 查询年龄等于 88 的员工
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age = 88;

-- 2. 查询年龄小于 20 的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age < 20;

-- 3. 查询年龄小于等于 20 的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age <= 20;

-- 4. 查询没有身份证号的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where idcard is NULL;

-- 5. 查询有身份证号的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where idcard is NOT NULL;

-- 6. 查询年龄不等于 88 的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age != 88;

-- 7. 查询年龄在 15 岁（包含）到 20 岁（包含）之间的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age between 15 and 20;

-- 8. 查询性别为 女 且年龄小于 25 岁的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where gender = '女' AND age < 25;

-- 9. 查询年龄等于 18 或 20 或 40 的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age = 18 OR age = 20 OR age = 40;

select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where age IN(18, 20, 40);

-- 10. 查询姓名为两个字的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where name like '__';

-- 11. 查询身份证号最后一位是 X 的员工信息
select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where idcard like '%X';

select id, workno, name, gender, age, idcard, workaddress, entrydate from emp
where idcard like '_________________X';



-- 聚合函数

-- 1. 统计该企业员工数量
select count(*) as '员工数量' from emp;

-- 2. 统计该企业员工的平均年龄
select avg(age) as '平均年龄' from emp;

-- 3. 统计该企业员工的最大年龄
select max(age) as '最大年龄' from emp;

-- 4. 统计该企业员工的最小年龄
select min(age) as '最小年龄' from emp;

-- 5. 统计西安地区员工的年龄之和
select sum(age) from emp
where workaddress = '西安'; #不能用is，is只能与null, true, false联合使用



-- 分组查询

-- 1. 根据性别分组，统计男性员工和女性员工的数量
select count(*) from emp
group by gender;

select gender, count(*) from emp
group by gender;

-- 2. 根据性别分组，统计男性员工和女性员工的平均年龄
select avg(age) from emp
group by gender;

select gender, avg(age) from emp
group by gender;

-- 3. 查询年龄小于 45 的员工，并根据工作地址分组，获取员工数量大于等于 3 的工作地址
select workaddress from emp
where age < 45
group by workaddress
having count(*) >= 3;



-- 排序查询

-- 1. 根据年龄对公司的员工进行升序排序
select * from emp order by age asc;

-- 2. 根据入职时间，对员工进行降序排序
select * from emp order by entrydate desc;

-- 3. 根据年龄对公司的员工进行升序排序，年龄相同，再按照入职时间进行降序排序
select * from emp order by age asc, entrydate desc;


-- 分页查询

-- 1. 查询第 1 页员工数据，每页展示 10 条记录
select * from emp limit 0, 10;

select * from emp limit 10;

-- 2. 查询第 2 页员工数据，每页展示 10 条记录
select * from emp limit 10, 10;



-- 综合练习

-- 1. 查询年龄为 20、21、22、23 岁的女性员工信息
select * from emp
where gender = '女' and age in(20, 21, 22, 23);

select * from emp
where gender = '女' and age between 20 and 23;

select * from emp
where gender = '女' and age = 20 or age = 21 or age = 22 or age = 23;

-- 2. 查询性别为 男，并且年龄在 20-40 岁（含）以内的姓名为三个字的员工
select * from emp
where gender = '男'
and age between 20 and 40
and name like '___';

-- 3. 统计员工表中，年龄小于 60 岁的男性员工和女性员工的人数
select gender, count(*) from emp
where age < 60
group by gender;


-- 4. 查询所有年龄小于等于 35 岁员工的姓名和年龄，
--    并对查询结果按年龄升序排序，
--    如果年龄相同按入职时间降序排序
select name, age, entrydate from emp #添加enteydate使结果直观表达
where age <= 35
order by age, entrydate desc;

-- 5. 查询性别为 男，且年龄在 20-40 岁（含）以内的前 5 个员工信息，
--    对查询结果按年龄升序排序，年龄相同按入职时间升序排序
select * from emp
where gender = '男' and age between 20 and 40
order by age, entrydate
limit 5;

#执行顺序学习

-- 查询年龄大于 15 的员工的姓名、年龄，并根据年龄进行升序排序
select name, age from emp where age > 15 order by age asc;

#通过别名验证
#验证from先执行
select e.name, e.age from emp e where e.age > 15 order by age asc; #将emp表起别名为e, 发现顺利执行，说明from最先执行
#验证select在from和where后面执行
#将name和age在select里面起别名为ename和eage，但是发现where语句报错，证明where在select之前执行
-- select name ename, age eage from emp where eage > 15 order by age asc;
#验证order by在后面执行
#将name和age在select里面起别名为ename和eage，发现order by语句正常运行，说明order by语句在select语句后运行
select name ename, age eage from emp where age > 15 order by eage asc;
#验证limit在后面运行
#将name和age在select里面起别名为ename和eage，发现limit语句正常运行，说明limit语句在select语句后运行
select name ename, age eage from emp where age > 15 order by eage asc limit eage;

/*
 1.from
 2.where
 3.group by
 4.select
 5.order by
 6.limit
 */



 -- 创建用户 itcast，只能够在当前主机 localhost 访问，密码 123456
create user 'itcast'@'localhost' identified by '123456';

-- 创建用户 heima，可以在任意主机访问该数据库，密码 123456
create user 'heima'@'%' identified by '123456';

-- 修改用户 heima 的访问密码为 1234
alter user 'heima'@'%' identified with mysql_native_password by '1234';
-- 删除 itcast@localhost 用户
drop user 'itcast'@'localhost';


-- 查询权限
show GRANTS for 'heima'@'%';

-- 授予权限
grant all on itcast.* to 'heima'@'%';

-- 撤销权限
revoke all on itcast.* from 'heima'@'%';



-- 函数

-- 字符串函数

-- concat
select concat('Hello', ' MySQL');

-- lower
select lower('Hello');


-- upper
select upper('Hello');

-- lpad
select lpad('hello',8,'*');

-- rpad
select rpad('hello',8,'*');

-- trim 去除头部尾部空格
select trim(' hello MySQL ');

-- substring 截取  截取索引从1开始
select substring(' hello mysql ',1,5);


-- 数值函数

-- ceil
select ceil(1.5);

-- floor
select floor(1.5);

-- mod
select mod(10, 3);

-- rand
select rand() * 100;


-- round
select round(54.2675829, 3);

-- 日期函数

-- curdate
select curdate();

-- curtime
select curtime();

-- now
select now();

-- year
select year(curdate());

-- month
select month(curdate());

-- day
select day(curdate());

-- date_add
select date_add(now(), interval 70 day);

-- datediff 相差的天数
select datediff('2026-12-30', now());

-- 流程函数

-- if
select if(true, 'ok', 'error');
select if(false, 'ok', 'error');

-- ifunll
select ifnull('ok', 'default');

select ifnull('', 'default');  #返回空字符串，这个不算空，函数判断是否为null值

select ifnull(null, 'default');

-- case when then else
-- 需求：查询 emp 表的员工姓名和工作地址 （北京 / 上海 ---> 一线城市，其他 ---> 二线城市）

select name, case when workaddress in('北京', '上海') then '一线城市' else '二线城市' end as '工作城市类别' from emp;



select
    name,
    case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end as workaddress
from emp;




-- 1. 由于业务需求变更，企业员工的工号统一为 5 位数，
--    目前不足 5 位数的全部在前面补 0。
--    例如：1 号员工的工号应改为 00001。

select lpad('1', 5, 0);

update emp set workno = lpad(workno, 5, '0');




-- 2. 通过数据库的函数，生成一个六位数的随机验证码。 防止出现不足六位情况，所以进行填充补0

select lpad(round(rand() * 1000000, 0), 6, 0);



-- 3. 查询所有员工的入职天数，并根据入职天数倒序排序
select name, datediff(now(), entrydate) from emp
order by datediff(now(), entrydate) desc;


-- 4. 统计班级各个学员的成绩，
-- 展示规则如下：
--   >= 85  显示：优秀
--   >= 60  显示：及格
--   否则   显示：不及格


-- 创建表
create table score(
    id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '数学',
    english int comment '英语',
    chinese int comment '语文'
) comment '学员成绩表';

insert into score(id, name, math, english, chinese) values
(1, 'Tom', 67, 88, 95),
(2, 'Rose', 23, 66, 90),
(3, 'Jack', 56, 98, 76);





