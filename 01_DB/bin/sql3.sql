create table snack(
	snack_num number(30) primary key,
	snack_name varchar2(50 char) not null,
	snack_maker varchar2(50 char) not null,
	snack_weight number(5,1) not null,
	snack_price number(5) not null,
	snack_expire date not null
);


-- ���� �ڵ����� �ø��� : sequence(���̺��� ����) - oracle DB�� ���
-- create sequence ��������;
create sequence snack_seq;
-- ��������.nextval �� ���
insert into snack values (snack_seq.nextval, '���ĸ�', '���', 60, 1000, sysdate);
insert into snack values (snack_seq.nextval, '�����', '���', 80, 1200, sysdate);

insert into snack values (2, '�����', '���', 80, 1200, sysdate);

insert into snack values (snack_seq.nextval, '������', '������', 50, 1600, sysdate);
insert into snack values (snack_seq.nextval, '������', '����', 80, 1400, sysdate);
insert into snack values (snack_seq.nextval, '������', '����', 120, 2800, sysdate);

select * from snack;