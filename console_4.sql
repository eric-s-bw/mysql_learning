-- 事务

-- 创建表
CREATE TABLE account (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    name VARCHAR(10) COMMENT '姓名',
    money INT COMMENT '余额'
) COMMENT = '账户表';

-- 插入数据
INSERT INTO account (id, name, money)
VALUES
(NULL, '张三', 2000),
(NULL, '李四', 2000);

-- 恢复数据
UPDATE account
SET money = 2000
WHERE name = '张三' OR name = '李四';


-- 查看数据默认事物提交方式
select @@autocommit; #查看到默认为1，代表当前事物自动提交

set @@autocommit = 0; #设置为手动提交 0




-- 转账操作 张三给李四转1000元

-- 1.查询张三用户的余额
select * from account where name = '张三';

-- 2.将张三余额减少1000
update account set money = money - 1000 where name = '张三';

select 系统抛出异常 。。。
-- 3.将李四余额增加1000
update account set money = money + 1000 where name = '李四';


-- 提交事物
commit;

-- 回滚事物
rollback;


-- 方式二

-- 转账操作 张三给李四转1000元

BEGIN;

-- 1.查询张三用户的余额
select * from account where name = '张三';

-- 2.将张三余额减少1000
update account set money = money - 1000 where name = '张三';

select 系统抛出异常 。。。
-- 3.将李四余额增加1000
update account set money = money + 1000 where name = '李四';

-- 更改事物为自动提交
set @@autocommit = 1;

select @@autocommit;

-- 提交事物
commit;

-- 回滚事物
rollback;



-- 验证幻读

-- 事物a
begin;

select * from account where id = 3;

insert into account(id, name, money)  values (3,'王五', '4000');

select * from account where id = 3;

commit;

rollback;

-- 事物b

begin;

insert into account(name, money) values ('赵六','5000');

commit;

rollback;






