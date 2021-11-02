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

update restaurant set r_place = '광화문' where r_no = 501;

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

select * from menu;
select * from restaurant;
select * from human;
select * from owner;

-- 내가 알고 있는 맛집 이름, 위치 - 이름 가나다순

select r_name, r_place
from restaurant
order by r_name;

-- 제일 비싼 메뉴의 정보

select * from restaurant
where m_price = (select max(m_price) from menu);


-- 최연장자 정보
select * from human where h_birth = (select min(h_birth) from human);

-- 곱창 시리즈 평균가
select avg(m_price)
from menu
where m_name like '%곱창%';

-- 종로 가게 정보
select *
from RESTAURANT
where r_place = '종로';

-- 제일 싼 메뉴를 파는 식당의 이름과 위치

--select r_name, r_place
--from restaurant
--where m_price = (select min(m_price) from menu);

select m_place
from menu
where m_price = (select min(m_price) from menu);


select r_name, r_place
from RESTAURANT
where r_no in (
	select m_place
	from menu
	where m_price = (select min(m_price) from menu
	)
)

-- 동대문에서 먹을 수 있는 음식의 이름, 가격
select m_name, m_price
from MENU
where m_place in (
	select r_no
	from RESTAURANT
	where r_place = '동대문'
);

-- 곱창 시리즈는 어느 지역에가면 먹을 수 있나? (어느 가게? 가게 이름, 장소를 알고 싶다.)
select r_name, r_place
from restaurant
where r_no in (
	select m_place
	from menu
	where m_name like '%곱창%'
)

-- 제일 싼 커피를 파는 매장의 이름 지역
select r_name, r_place
from restaurant
where r_no in (
	select m_place
	from menu
	where m_price = (
	select min(m_price)
	from menu
	-- 땜빵처리, 올바르지는 않음(카푸치노나 민트초코 있으면 어떡하려고?)
	-- 근데 지금 상황에서는 답이 없음, 아예 테이블을 나눠서 만들던가, 아니면 메뉴 테이블에 카테고리를 분류하던가.
	-- 데이터베이스 설계를 잘해야하는 이유
	where m_name like '%라떼%' or m_name like '%카노%'
	)
)

--------------------------------------------------
-- 서브쿼리를 통해 다른 테이블에도 접근할 수 있다.

-- join
-- 서로 다른 테이블을 연결하려면 그 관계를 명시하라
select m_name, m_price, r_name, r_place
from menu, RESTAURANT
-- 데이터가 이게 뭐야...? 테이블 사이의 관계가 명시가 안되서 그렇다.
where r_no = m_place
-- r_no와 m_place가 같다는 관계를 명시함으로서 원하는 데이터를 사용할 수 있게한다.

-- 스타벅스 종로지점의 메뉴 이름 가격(레스토랑 정보도)

select m_name, m_price, r_name, r_place
from menu, restaurant
where r_name = '스타벅스' and r_place = '종로';
--위 쿼리에서도 관계가 명시되지 않았다.
select m_name, m_price, r_name, r_place
from menu, restaurant
where r_no = m_place and r_name = '스타벅스' and r_place = '종로';
-- 이렇게 더 간단하게도 처리할 수 있다.

select m_name, m_price, r_name, r_place
from menu, RESTAURANT
where m_place = (
	select r_no
	from restaurant
	where r_place = '종로' and r_name = '스타벅스'
)
-- 여전히 관계가 명시 되지 않았음.

select m_name, m_price, r_name, r_place
from menu, RESTAURANT
where r_no = m_place and m_place = (
	select r_no
	from restaurant
	where r_place = '종로' and r_name = '스타벅스'
)
-- 두 테이블 사이의 관계를 명시해 주고 and를 사용하여 서브쿼리를 작성한다.(이 테이블과 저 테이블은 이런 관계'고' 이런 정보가 필요해)

-- 제일 젊은 사장님네 가게의 매장명, 위치, 사장님 이름, 생일, 메뉴명, 가격
select r_name, r_place, h_name, h_birth, m_name, m_price
from RESTAURANT, HUMAN, MENU, owner
where r_no = m_place
	and h_no = o_ceo
	and o_restaurant = r_no
	and h_birth = (select max(h_birth) from human)

-- 최연장자 아저씨게 메뉴명, 메뉴 가격

select m_name, m_price
from menu, HUMAN, restaurant, owner
where m_place = r_no
	and r_no = o_restaurant
	and h_no = o_ceo
	and h_birth = (select min(h_birth) from human)


	
	
	
-----------------------
황소곱창 가게의 전체 메뉴명, 가격, 매장위치
select * from menu
select * from RESTAURANT
	
select m_name, m_price, r_place
from menu, RESTAURANT
where r_no = m_place and r_name = '황소곱창'

제일 싼거 파는 매장명, 위치, 메뉴명, 가격

select r_name, r_place, m_name, m_price
from menu, restaurant
where r_no = m_place
	and m_price = (select min(m_price) from menu)
	
-------------------------

	-- 돼지곱창 가격 인상 (13000)
	update menu
	set m_price = 13000
	where m_name = '돼지곱창'
	
	select * from menu
	
	-- 제일 싼 메뉴 무료 이벤트
	update menu
	set m_price = 0
	where m_price = (select min(m_price) from menu)
	
	-- 메뉴 전체 평균보다 비싼 메뉴 10% 할인
	
	select avg(m_price) from menu
	
	update menu
	set m_price = (m_price * 0.9)
	where m_price > (select avg(m_price) from menu)
	
	
	-- 동대문 지역 메뉴들 1000원 인상
	
	update menu
	set m_price = m_price + 1000
	where m_place in (select r_no
					from restaurant
					where r_place = '동대문'
	)
	
	-- 커피 중 '라떼' 가격 500원 인상
	update menu
	set m_price = m_price + 500
	where m_name like '%라떼%'
	
	
	----------------------------
	-- 라떼 전부 삭제
	delete MENU
	where m_name like '%라떼'
	
	select * from menu;
	
	-- 강남 스벅 메뉴 삭제
	
	select * from RESTAURANT
	delete MENU
	where m_place = (
		select r_no
		from restaurant
		where r_place = '강남' and r_name = '스타벅스'
	)
	
	-- 강남 스벅 폐점
	
	delete RESTAURANT
	where r_name = '스타벅스' and r_place = '강남'
	
	-- 곱창 들어간 매장의 메뉴 다 삭제
	delete menu
	where m_place in (
		select r_no
		from restaurant
		where r_name like '%곱창'
	);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
select * from menu
select * from RESTAURANT
drop table menu cascade constraint purge;
