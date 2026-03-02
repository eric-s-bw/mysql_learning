insert into employee (id, workno, name, gender, age, idcard, entrydate)
values (1, '1', 'Itcast', '男', 10, '123456789012345678', '2000-01-01');


insert into employee
values (2, '2', '张无忌', '男', 20, '123456789012345678', '2005-01-01');


select * from employee;


insert into employee
values (3, '3', '韦一笑', '男', 25, '123456739012345678', '2005-01-01'),
       (4, '4', '张敏', '女', 30, '123456739012345668', '2005-01-01');

#修改id为1的人名为itheima
update employee set name = 'itheima' where id = 1;

#修改id为1的人名为小昭性别为女
update employee set name = '小昭', gender = '女' where id = 1;

#修改所有员工入职时间为2008-01-01
update employee set entrydate = '2008-01-01';

#删除gender为女的员工
delete from employee where gender = '女';

#删除所有员工
delete from employee;

#创建用户
create user 'itcast'@'localhost' identified by '123456';
