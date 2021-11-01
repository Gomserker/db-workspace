-- RDBMS(Relational DateBase Management System) 관계형 데이터베이스 관리 시스템
-- 테이블간의 관계를 중심으로 몬가...

-- 강남 홍콩반점1호 짜장면 5000원 - 1 primary key(pk)
-- 종로 인생설렁탕 설렁탕 6000원 - 2
-- 역삼동 빽다방 라떼 3000원 - 3
-- 대치동 스타벅스 돌체라떼 6000원 - 4

create table menu(
	m_no number(3) primary key,
	m_name varchar2 (20 char) not null,
	m_price number(6) not null,
	--어디에서 팔리는지를 표시하는 m_place
	m_place number(3) not null
);

create table restaurant(
	r_no number(3) primary key,
	r_name varchar2 (30 char) not null,
	r_place varchar2(20 char) not null
);

create table human(
	h_no number(3) primary key,
	h_name varchar2(30 char) not null,
	h_birth date not null
);

create table owner(
	o_no number(3) primary key,
	o_ceo number(3) not null,
	--레스토랑 고유 번호, 1번 레스토랑, 2번 레스토랑 ...
	o_restaurant number(3) not null
);

create sequence menu_seq;
create sequence restaurant_seq;
create sequence human_seq;
create sequence owner_seq;

insert into menu values (menu_seq.nextval, '돼지곱창', 10000, 1);
insert into menu values (menu_seq.nextval, '소곱창', 15000, 1);
insert into menu values (menu_seq.nextval, '야채곱창', 9000, 2);
insert into menu values (menu_seq.nextval, '카페라떼', 6000, 3);
insert into menu values (menu_seq.nextval, '아메리카노', 4000, 3);
insert into menu values (menu_seq.nextval, '돌체라떼', 7000, 4);

insert into restaurant values (restaurant_seq.nextval, '황소곱창', '종로');
insert into restaurant values (restaurant_seq.nextval, '동대문곱창', '동대문');
insert into restaurant values (restaurant_seq.nextval, '황소곱창', '동대문');
insert into restaurant values (restaurant_seq.nextval, '스타벅스', '종로');
insert into restaurant values (restaurant_seq.nextval, '스타벅스', '강남');
insert into restaurant values (501, '스타벅스', '광화문');


-- 메뉴를 추가하고 싶다
-- 스타벅스 광화문점에 체리블로썸 음료 추가
-- 딸기스무디 2번 레스토랑에 추가

insert into menu values (menu_seq.nextval, '체리블로썸', 5000, 501);
insert into menu values (menu_seq.nextval, '딸기스무디', 5000, 2);

-- 아차 근데 2번 레스토랑은 곱창집이다. 스벅 종로점에 들어가야 하는데
update menu set m_place = 4 where m_name = '딸기스무디';

--그거 지우기
-- 체리블로썸을 삭제하자

delete from menu where m_name = '체리블로썸';
select * from human;


insert into human values (human_seq.nextval, '김',  to_date('1980-05-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '나',  to_date('1985-06-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '박',  to_date('1980-07-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '이',  to_date('1985-08-05', 'YYYY-MM-DD'));
--insert into human values (200, '최',  to_date('1985-08-05', 'YYYY-MM-DD'));


insert into owner values(owner_seq.nextval, 1, 1);
insert into owner values(owner_seq.nextval, 2, 2);
insert into owner values(owner_seq.nextval, 3, 3);
insert into owner values(owner_seq.nextval, 4, 4);
--insert into owner values(owner_seq.nextval, 200, 4);

select * from owner;
drop table owner cascade constraint purge;
