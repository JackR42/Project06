if (OBJECT_ID('s42.t43') IS NOT NULL) drop table [s42].[t43]
go
create table s42.t43(
	id int primary key not null
	,t42_id int not null
	,description varchar(64)
)
go
insert into s42.t43 values(1, 1, 'The Hitchhikers Guide')
insert into s42.t43 values(2, 1, 'So long and thanks for all the fun')
insert into s42.t43 values(3, 2, 'Porsche 964')
insert into s42.t43 values(4, 2, 'Porsche 996')
insert into s42.t43 values(5, 2, 'Porsche 997')
insert into s42.t43 values(6, 2, 'Porsche 991')
insert into s42.t43 values(7, 2, 'Porsche 992')
insert into s42.t43 values(8, 3, 'SQL Engine')
go
create or alter view [s42].[v42]
as
	select Number=t1.Description, Item=t2.Description
	from s42.t42 t1
	left outer join s42.t43 t2 on t2.t42_id = t1.id
go
select * from s42.v42
exec s42.p42
go
