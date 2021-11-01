-- RDBMS(Relational DateBase Management System) ������ �����ͺ��̽� ���� �ý���
-- ���̺��� ���踦 �߽����� ��...

-- ���� ȫ�����1ȣ ¥��� 5000�� - 1 primary key(pk)
-- ���� �λ������� ������ 6000�� - 2
-- ���ﵿ ���ٹ� �� 3000�� - 3
-- ��ġ�� ��Ÿ���� ��ü�� 6000�� - 4

create table menu(
	m_no number(3) primary key,
	m_name varchar2 (20 char) not null,
	m_price number(6) not null,
	--��𿡼� �ȸ������� ǥ���ϴ� m_place
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
	--������� ���� ��ȣ, 1�� �������, 2�� ������� ...
	o_restaurant number(3) not null
);

create sequence menu_seq;
create sequence restaurant_seq;
create sequence human_seq;
create sequence owner_seq;

insert into menu values (menu_seq.nextval, '������â', 10000, 1);
insert into menu values (menu_seq.nextval, '�Ұ�â', 15000, 1);
insert into menu values (menu_seq.nextval, '��ä��â', 9000, 2);
insert into menu values (menu_seq.nextval, 'ī���', 6000, 3);
insert into menu values (menu_seq.nextval, '�Ƹ޸�ī��', 4000, 3);
insert into menu values (menu_seq.nextval, '��ü��', 7000, 4);

insert into restaurant values (restaurant_seq.nextval, 'Ȳ�Ұ�â', '����');
insert into restaurant values (restaurant_seq.nextval, '���빮��â', '���빮');
insert into restaurant values (restaurant_seq.nextval, 'Ȳ�Ұ�â', '���빮');
insert into restaurant values (restaurant_seq.nextval, '��Ÿ����', '����');
insert into restaurant values (restaurant_seq.nextval, '��Ÿ����', '����');
insert into restaurant values (501, '��Ÿ����', '��ȭ��');


-- �޴��� �߰��ϰ� �ʹ�
-- ��Ÿ���� ��ȭ������ ü����ν� ���� �߰�
-- ���⽺���� 2�� ��������� �߰�

insert into menu values (menu_seq.nextval, 'ü����ν�', 5000, 501);
insert into menu values (menu_seq.nextval, '���⽺����', 5000, 2);

-- ���� �ٵ� 2�� ��������� ��â���̴�. ���� �������� ���� �ϴµ�
update menu set m_place = 4 where m_name = '���⽺����';

--�װ� �����
-- ü����ν��� ��������

delete from menu where m_name = 'ü����ν�';
select * from human;


insert into human values (human_seq.nextval, '��',  to_date('1980-05-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '��',  to_date('1985-06-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '��',  to_date('1980-07-05', 'YYYY-MM-DD'));
insert into human values (human_seq.nextval, '��',  to_date('1985-08-05', 'YYYY-MM-DD'));
--insert into human values (200, '��',  to_date('1985-08-05', 'YYYY-MM-DD'));


insert into owner values(owner_seq.nextval, 1, 1);
insert into owner values(owner_seq.nextval, 2, 2);
insert into owner values(owner_seq.nextval, 3, 3);
insert into owner values(owner_seq.nextval, 4, 4);
--insert into owner values(owner_seq.nextval, 200, 4);

select * from owner;
drop table owner cascade constraint purge;
