create table snack(
	snack_num number(30) primary key,
	snack_name varchar2(50 char) not null,
	snack_maker varchar2(50 char) not null,
	snack_weight number(5,1) not null,
	snack_price number(5) not null,
	snack_expire date not null
);

drop table snack cascade constraint purge;

-- 숫자 자동으로 올리기 : sequence(테이블과 무관) - oracle DB의 기능
-- create sequence 시퀀스명;
create sequence snack_seq;
-- 시퀀스명.nextval 로 사용
insert into snack values (snack_seq.nextval, '양파링', '농심', 60, 1000, sysdate);
insert into snack values (snack_seq.nextval, '새우깡', '농심', 80, 1200, sysdate);
insert into snack values (snack_seq.nextval, '다이제', '오리온', 50, 1600, sysdate);
insert into snack values (snack_seq.nextval, '고래밥', '해태', 80, 1400, sysdate);
insert into snack values (snack_seq.nextval, '하몽', '해태', 120, 1100, sysdate);

select * from snack;