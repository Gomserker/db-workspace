create table login_test2(
	l_id varchar2 (20 char) primary key,
	l_pw varchar2 (20 char) not null,
	l_name varchar2 (20 char) not null
);

insert into login_test2 values ('bg', 'bg', '����');

select * from login_test2;