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

update restaurant set r_place = '��ȭ��' where r_no = 501;

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

select * from menu;
select * from restaurant;
select * from human;
select * from owner;

-- ���� �˰� �ִ� ���� �̸�, ��ġ - �̸� �����ټ�

select r_name, r_place
from restaurant
order by r_name;

-- ���� ��� �޴��� ����

select * from restaurant
where m_price = (select max(m_price) from menu);


-- �ֿ����� ����
select * from human where h_birth = (select min(h_birth) from human);

-- ��â �ø��� ��հ�
select avg(m_price)
from menu
where m_name like '%��â%';

-- ���� ���� ����
select *
from RESTAURANT
where r_place = '����';

-- ���� �� �޴��� �Ĵ� �Ĵ��� �̸��� ��ġ

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

-- ���빮���� ���� �� �ִ� ������ �̸�, ����
select m_name, m_price
from MENU
where m_place in (
	select r_no
	from RESTAURANT
	where r_place = '���빮'
);

-- ��â �ø���� ��� ���������� ���� �� �ֳ�? (��� ����? ���� �̸�, ��Ҹ� �˰� �ʹ�.)
select r_name, r_place
from restaurant
where r_no in (
	select m_place
	from menu
	where m_name like '%��â%'
)

-- ���� �� Ŀ�Ǹ� �Ĵ� ������ �̸� ����
select r_name, r_place
from restaurant
where r_no in (
	select m_place
	from menu
	where m_price = (
	select min(m_price)
	from menu
	-- ����ó��, �ùٸ����� ����(īǪġ�볪 ��Ʈ���� ������ ��Ϸ���?)
	-- �ٵ� ���� ��Ȳ������ ���� ����, �ƿ� ���̺��� ������ �������, �ƴϸ� �޴� ���̺� ī�װ��� �з��ϴ���.
	-- �����ͺ��̽� ���踦 ���ؾ��ϴ� ����
	where m_name like '%��%' or m_name like '%ī��%'
	)
)

--------------------------------------------------
-- ���������� ���� �ٸ� ���̺��� ������ �� �ִ�.

-- join
-- ���� �ٸ� ���̺��� �����Ϸ��� �� ���踦 ����϶�
select m_name, m_price, r_name, r_place
from menu, RESTAURANT
-- �����Ͱ� �̰� ����...? ���̺� ������ ���谡 ��ð� �ȵǼ� �׷���.
where r_no = m_place
-- r_no�� m_place�� ���ٴ� ���踦 ��������μ� ���ϴ� �����͸� ����� �� �ְ��Ѵ�.

-- ��Ÿ���� ���������� �޴� �̸� ����(������� ������)

select m_name, m_price, r_name, r_place
from menu, restaurant
where r_name = '��Ÿ����' and r_place = '����';
--�� ���������� ���谡 ��õ��� �ʾҴ�.
select m_name, m_price, r_name, r_place
from menu, restaurant
where r_no = m_place and r_name = '��Ÿ����' and r_place = '����';
-- �̷��� �� �����ϰԵ� ó���� �� �ִ�.

select m_name, m_price, r_name, r_place
from menu, RESTAURANT
where m_place = (
	select r_no
	from restaurant
	where r_place = '����' and r_name = '��Ÿ����'
)
-- ������ ���谡 ��� ���� �ʾ���.

select m_name, m_price, r_name, r_place
from menu, RESTAURANT
where r_no = m_place and m_place = (
	select r_no
	from restaurant
	where r_place = '����' and r_name = '��Ÿ����'
)
-- �� ���̺� ������ ���踦 ����� �ְ� and�� ����Ͽ� ���������� �ۼ��Ѵ�.(�� ���̺�� �� ���̺��� �̷� ����'��' �̷� ������ �ʿ���)

-- ���� ���� ����Գ� ������ �����, ��ġ, ����� �̸�, ����, �޴���, ����
select r_name, r_place, h_name, h_birth, m_name, m_price
from RESTAURANT, HUMAN, MENU, owner
where r_no = m_place
	and h_no = o_ceo
	and o_restaurant = r_no
	and h_birth = (select max(h_birth) from human)

-- �ֿ����� �������� �޴���, �޴� ����

select m_name, m_price
from menu, HUMAN, restaurant, owner
where m_place = r_no
	and r_no = o_restaurant
	and h_no = o_ceo
	and h_birth = (select min(h_birth) from human)


	
	
	
-----------------------
Ȳ�Ұ�â ������ ��ü �޴���, ����, ������ġ
select * from menu
select * from RESTAURANT
	
select m_name, m_price, r_place
from menu, RESTAURANT
where r_no = m_place and r_name = 'Ȳ�Ұ�â'

���� �Ѱ� �Ĵ� �����, ��ġ, �޴���, ����

select r_name, r_place, m_name, m_price
from menu, restaurant
where r_no = m_place
	and m_price = (select min(m_price) from menu)
	
-------------------------

	-- ������â ���� �λ� (13000)
	update menu
	set m_price = 13000
	where m_name = '������â'
	
	select * from menu
	
	-- ���� �� �޴� ���� �̺�Ʈ
	update menu
	set m_price = 0
	where m_price = (select min(m_price) from menu)
	
	-- �޴� ��ü ��պ��� ��� �޴� 10% ����
	
	select avg(m_price) from menu
	
	update menu
	set m_price = (m_price * 0.9)
	where m_price > (select avg(m_price) from menu)
	
	
	-- ���빮 ���� �޴��� 1000�� �λ�
	
	update menu
	set m_price = m_price + 1000
	where m_place in (select r_no
					from restaurant
					where r_place = '���빮'
	)
	
	-- Ŀ�� �� '��' ���� 500�� �λ�
	update menu
	set m_price = m_price + 500
	where m_name like '%��%'
	
	
	----------------------------
	-- �� ���� ����
	delete MENU
	where m_name like '%��'
	
	select * from menu;
	
	-- ���� ���� �޴� ����
	
	select * from RESTAURANT
	delete MENU
	where m_place = (
		select r_no
		from restaurant
		where r_place = '����' and r_name = '��Ÿ����'
	)
	
	-- ���� ���� ����
	
	delete RESTAURANT
	where r_name = '��Ÿ����' and r_place = '����'
	
	-- ��â �� ������ �޴� �� ����
	delete menu
	where m_place in (
		select r_no
		from restaurant
		where r_name like '%��â'
	);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
select * from menu
select * from RESTAURANT
drop table menu cascade constraint purge;
