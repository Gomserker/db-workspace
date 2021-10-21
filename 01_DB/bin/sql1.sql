-- �ּ� (sql������ �ּ�)

-- ���̺� ����
create table product(
	p_name varchar2(10 char),
	p_price number(4);
);


-- ������ ����
insert into PRODUCT values ('����', 1000);

-- ��ȸ
select * from PRODUCT

--------------------------
--��(row) �ϳ��� ������ �ϳ���. aka record.
--��(field, �Ӽ�, column)
--oracle�� ��/�ҹ��� ������ ���Ѵ�. ���� �빮�� ����Ѵ�.

--DBA : ���� ��������, ���/����, ��������
--DBP : CRUD(Create, Read, Update, Delete)
--SQL : Structured Query Language, DB�� �����ϴ� ���
---------------------------------------------------
--1) ���̺� �����
--    �л� ���̺� ����, 
--    �л��� �ְ�, �̸�, ����, ��,��,�� ����
--2) ������ ����
-- �л� �ϳ� ������ ����

--3) ��ȸ
create table student(
	s_student varchar2(10 char),
	s_age number(3),
	s_korScore number(3),
	s_engScore number(3),
	s_mathScore number(3),
);

insert into student values ('jake', 23, 100, 95, 80);

select * from student;