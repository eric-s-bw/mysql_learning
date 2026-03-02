-- 查看隔离级别

select @@transaction_Isolation;

-- 设置事物隔离级别

set session transaction isolation level read uncommitted;

set session transaction isolation level repeatable read;