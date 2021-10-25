-- SELECT

select * from snack;
-- ��ü ���� �̸�, ����, ���� ��ȸ
select snack_name, SNACK_price, snack_weight from snack;

-- ��ü ���� �̸�, ������, ����, �������

select snack_name, snack_maker, snack_price, SNACK_expire from snack;

--�ʵ���� ������ �ȵ�� as ���ñ�� �ٲ� �� ����
select snack_name, snack_maker as manufacturer, snack_price, SNACK_expire from snack;

--�ٽ� ���� �̸��̶� ���ݸ�
select snack_name, snack_price from snack;

--�� ���¿��� �ΰ��� �ο� (snack_vat �÷��� ���� �����޶�� ������ drop table ���� �ʾƵ� �ȴ�.)
select snack_name, snack_price, snack_price * 0.1 as snack_VAT from snack;

-- test
-- ��ü ���� �̸�, ������, ����, g�� ��(snack_perGram)
-- ���ѼҼ� �ڸ��� ���� round �� ���� �Լ��� ����(ã�ƺ� ��)
select snack_name, snack_maker, snack_price, round(snack_price / snack_weight) as snack_pergram from snack;

-- ��ü ���� ��� ������?
-- ���ݱ����� ���ڵ�(��) ����ε� �÷�(��) ����� �ʿ��� ��Ȳ,
-- ����Ŭ�� ����Լ��� ����ؾ� �Ҷ� : max, min, sum, avg, count etc...

select avg(snack_price) from snack;

-- ���� �Ѱ��ڴ�?
select min(snack_price) from snack;

-- ��������� ���� ���� ���� ����
-- ������ ������ ��¥���� ����ȴ�.
select max(snack_expire) from snack;

-- db�� ��ϵ� ���ڰ� �� �? : ���ڵ�(��)�� ������ ���� ���̹Ƿ� �Ķ���ͷ� �� �ᵵ �Ȱ���.
select count(snack_num) from snack;

-- ��ü ������ �̸�, ����, ȸ���
-- ���� �̸��� �������ΰ�(����)

select snack_name, snack_price, snack_maker
from snack
where snack_name = '������';

-- ��� ������ �̸��� ����
select snack_name, snack_price
from snack
where snack_maker = '���';

-- ��ɰ����� ��� ����
select avg(snack_price)
from SNACK
where snack_maker = '���';

--������ �ȵǴ� ������ �̸�(������� ������), ����
select snack_name, snack_price from snack
where snack_expire < sysdate;


-- '%��' : ���� �����°�
-- '��%' : ���� �����ϴ°�
-- '%��%' : ���� ���ԵȰ�
-- �� �˻������� ����Ҷ��� =�� ���� �ȵȴ�. like '%��' �̷��� ����ؾ���.

--������ ������ �ø��� ������ �̸�, ����

select snack_name, snack_price
from snack
where snack_name like '%��';

--������ �ø����� ���� �̸�, ����
select snack_name, snack_price
from snack
where snack_name like '%������'

--�� �ø��� �� �ְ���
select max(snack_price)
from snack
where snack_name like '%��';

--���� ��� ����(�̸�, ������, ����)
select snack_name, snack_maker, snack_price
from snack
where s_price = max(snack_price);

---------------------------------------
-- subQuery (���� �� ����)

--'���� ���'�� �߶󳽴�.



-- where ���� ����Լ��� �� ����.
--���� ��� ����(�̸�, ������, ����)
select snack_name, snack_maker, snack_price
from snack
where snack_price = (select max(snack_price) from snack)--��Ѱ� �;��ϴ� �ڸ�


select * from snack;

-- ��հ����� ��� ����(�̸�, ����)
select snack_name, snack_price
from snack
where snack_price > (select avg(snack_price) from snack);


-- ���� ������ ����(�̸�, ����)

select snack_name, snack_price
from snack
where snack_weight = (select min(snack_weight) from snack);