create table t1(
  id int primary key not null
  , description char(32) null
 )
 insert into t1 values(42, '42')
 insert into t1 values(911, '911')
 insert into t1 values(1433, '1433')
 
 create view v1 as select * from t1
 
 create function f1()
 returns table
 as
 return select * from v1
 
 create procedure p1 
 as
 select * from f1
 
