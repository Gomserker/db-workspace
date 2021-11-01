create table db_test(
	d_no number(2) primary key,
	d_name varchar2(20char) not null,
	d_age varchar2(2) not null
);

create sequence db_test_seq;

-- 데이터 2~3개 넣기

insert into db_test values (db_test_seq.nextval, '솔리', 20);
insert into db_test values (db_test_seq.nextval, '준석', 25);
insert into db_test values (db_test_seq.nextval, '병관', 30);
insert into db_test values (db_test_seq.nextval, '건우', 30);

select * from db_test;

select * from DB_TEST
where d_name like '%건%';