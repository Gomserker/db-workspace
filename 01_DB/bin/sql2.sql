--테이블 생성

--create table 테이블명 (
--	필드명 속성(문자열=varchar2, 숫자=number),
--	필드명 속성
)

--데이터 삽입
-- insert into 테이블명 values (파라미터1, 파라미터2);

--데이터 조회
--select 필드명 from 테이블명

--날짜 필드
--필드명 date

--특정 시간 날짜 :
--to_date('값', '패턴')
--			YYYY MM DD HH : MI : SS
--분은 MI, 초는 SS
create table snack(
	snack_num number(30) primary key,
	snack_name varchar2(50 char) not null,
	snack_maker varchar2(50 char) not null,
	snack_weight number(5,1) not null,
	snack_price number(5) not null,
	snack_expire date not null
);

insert into snack values (1, '양파링', '농심', 60, 1000, sysdate);
insert into snack values (50, '꽃게랑', '해태', 70, 1200, sysdate);
insert into snack values (17, '꼬깔콘', '롯데', 75.5, 1300, to_date('2021-12-01', 'YYYY-MM-DD'));

select * from snack;

drop table snack cascade constraint purge;