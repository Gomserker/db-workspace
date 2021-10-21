-- 주석 (sql에서의 주석)

-- 테이블 생성
create table product(
	p_name varchar2(10 char),
	p_price number(4);
);


-- 데이터 삽입
insert into PRODUCT values ('볼펜', 1000);

-- 조회
select * from PRODUCT

--------------------------
--행(row) 하나가 데이터 하나다. aka record.
--열(field, 속성, column)
--oracle은 대/소문자 구분을 안한다. 전부 대문자 취급한다.

--DBA : 서버 전원관리, 백업/복구, 계정관리
--DBP : CRUD(Create, Read, Update, Delete)
--SQL : Structured Query Language, DB를 제어하는 언어
---------------------------------------------------
--1) 테이블 만들기
--    학생 테이블 생성, 
--    학생이 있고, 이름, 나이, 국,영,수 점수
--2) 데이터 삽입
-- 학생 하나 데이터 삽입

--3) 조회
create table student(
	s_name varchar2(50 char),
	s_age number(3),
	s_kor number(3),
	s_eng number(3),
	s_math number(3)
);

insert into student values ('jake', 23, 100, 95, 80);

insert into student(s_name, s_age) values ('mark', 30);
insert into student(s_kor, s_math, s_eng, s_age, s_name)
values (10, 30, 20, 1, 'luke');

select * from student;


create table student2(
	s_no number(2) primary key,
	s_name varchar2(30 char) not null,
	s_age number(3) not null,
	s_kor number(3) not null,
	s_eng number(3) not null,
	s_jp number(3) not null
);

--옵션
-- not null : 사실상 기본, 필수
-- primary key : not null + 중복 불허 기능
-- 그 테이블을 대표하는 값 -> 테이블 하나에는 primary key가 하나 있는게 좋음
-- like 주민번호, 사번, 번호 등등

--데이터 생성(Create rud)
insert into student2 values (1, '재식', 25, 100, 90, 90);
insert into student2 values (20, '건우', 25, 90, 30, 40);
insert into student2 values (30, '두현', 23, 90, 90, 90);

--데이터 조회(c Read ud)
select * from student2;

--테이블 삭제
drop table student2 -- 휴지통으로 들어감
cascade constraint purge; -- 완전히 삭제

--데이터 수정 (cr Update d)
--10번 사람의 영어점수를 100점으로 바꿀것
update student2
set s_eng = 100
where s_no = 10

select * from student2;

--데이터 삭제 (cru Delete)
--10번 데이터 삭제
delete from student2 where s_no = 10

select * from student2;

--student2 테이블의 학생 이름만 확인하고 싶다.
select s_name, s_age, s_eng from student2;