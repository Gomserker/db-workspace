--���̺� ����

--create table ���̺�� (
--	�ʵ�� �Ӽ�(���ڿ�=varchar2, ����=number),
--	�ʵ�� �Ӽ�
)

--������ ����
-- insert into ���̺�� values (�Ķ����1, �Ķ����2);

--������ ��ȸ
--select �ʵ�� from ���̺��

--��¥ �ʵ�
--�ʵ�� date

--Ư�� �ð� ��¥ :
--to_date('��', '����')
--			YYYY MM DD HH : MI : SS
--���� MI, �ʴ� SS
create table snack(
	snack_num number(30) primary key,
	snack_name varchar2(50 char) not null,
	snack_maker varchar2(50 char) not null,
	snack_weight number(5,1) not null,
	snack_price number(5) not null,
	snack_expire date not null
);

insert into snack values (1, '���ĸ�', '���', 60, 1000, sysdate);
insert into snack values (50, '�ɰԶ�', '����', 70, 1200, sysdate);
insert into snack values (17, '������', '�Ե�', 75.5, 1300, to_date('2021-12-01', 'YYYY-MM-DD'));

select * from snack;

drop table snack cascade constraint purge;