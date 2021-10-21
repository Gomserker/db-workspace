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

--�ɼ�
-- not null : ��ǻ� �⺻, �ʼ�
-- primary key : not null + �ߺ� ���� ���
-- �� ���̺��� ��ǥ�ϴ� �� -> ���̺� �ϳ����� primary key�� �ϳ� �ִ°� ����
-- like �ֹι�ȣ, ���, ��ȣ ���

--������ ����(Create rud)
insert into student2 values (1, '���', 25, 100, 90, 90);
insert into student2 values (20, '�ǿ�', 25, 90, 30, 40);
insert into student2 values (30, '����', 23, 90, 90, 90);

--������ ��ȸ(c Read ud)
select * from student2;

--���̺� ����
drop table student2 -- ���������� ��
cascade constraint purge; -- ������ ����

--������ ���� (cr Update d)
--10�� ����� ���������� 100������ �ٲܰ�
update student2
set s_eng = 100
where s_no = 10

select * from student2;

--������ ���� (cru Delete)
--10�� ������ ����
delete from student2 where s_no = 10

select * from student2;

--student2 ���̺��� �л� �̸��� Ȯ���ϰ� �ʹ�.
select s_name, s_age, s_eng from student2;