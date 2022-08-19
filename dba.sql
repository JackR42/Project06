create schema s42

create table s42.t42(
  id int primary key not null
  , description char(32) null
)
insert into s42.t42 values(42, '42')
insert into s42.t42 values(911, '911')
insert into s42.t42 values(1433, '1433')
 
create view s42.v42 as select * from t1
 
create function s42.f42()
returns table
as
return select * from s42.v42
 
create procedure s42.p42 
as
select * from f1
 
execute s42.p42
