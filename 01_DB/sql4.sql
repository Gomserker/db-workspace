-- SELECT

select * from snack;
-- 전체 과자 이름, 가격, 무게 조회
select snack_name, SNACK_price, snack_weight from snack;

-- 전체 과자 이름, 제조사, 가격, 유통기한

select snack_name, snack_maker, snack_price, SNACK_expire from snack;

--필드명이 마음에 안들면 as 뭐시기로 바꿀 수 있음
select snack_name, snack_maker as manufacturer, snack_price, SNACK_expire from snack;

--다시 과자 이름이랑 가격만
select snack_name, snack_price from snack;

--이 상태에서 부과세 부여 (snack_vat 컬럼을 새로 만들어달라고 했을때 drop table 하지 않아도 된다.)
select snack_name, snack_price, snack_price * 0.1 as snack_VAT from snack;

-- test
-- 전체 과자 이름, 제조사, 가격, g당 얼마(snack_perGram)
-- 무한소수 자릿수 제한 round 등 여러 함수가 있음(찾아볼 것)
select snack_name, snack_maker, snack_price, round(snack_price / snack_weight) as snack_pergram from snack;

-- 전체 과자 평균 가격은?
-- 지금까지는 레코드(행) 계산인데 컬럼(열) 계산이 필요한 상황,
-- 오라클의 통계함수를 사용해야 할때 : max, min, sum, avg, count etc...

select avg(snack_price) from snack;

-- 제일 싼과자는?
select min(snack_price) from snack;

-- 유통기한이 제일 오래 남은 과자
-- 데이터 유형이 날짜여도 적용된다.
select max(snack_expire) from snack;

-- db에 등록된 과자가 총 몇개? : 레코드(행)의 갯수를 세는 것이므로 파라미터로 뭘 써도 똑같다.
select count(snack_num) from snack;

-- 전체 과자의 이름, 가격, 회사명
-- 과자 이름이 고래밥인거(조건)

select snack_name, snack_price, snack_maker
from snack
where snack_name = '고래밥';

-- 농심 과자의 이름과 가격
select snack_name, snack_price
from snack
where snack_maker = '농심';

-- 농심과자의 평균 가격
select avg(snack_price)
from SNACK
where snack_maker = '농심';

--먹으면 안되는 과자의 이름(유통기한 지난거), 가격
select snack_name, snack_price from snack
where snack_expire < sysdate;


-- '%ㅋ' : ㅋ로 끝나는거
-- 'ㅋ%' : ㅋ로 시작하는거
-- '%ㅋ%' : ㅋ이 포함된거
-- 위 검색조건을 사용할때는 =를 쓰면 안된다. like '%ㅋ' 이렇게 사용해야함.

--깡으로 끝나는 시리즈 과자의 이름, 가격

select snack_name, snack_price
from snack
where snack_name like '%깡';

--빼빼로 시리즈의 과자 이름, 가격
select snack_name, snack_price
from snack
where snack_name like '%빼빼로'

--깡 시리즈 중 최고가
select max(snack_price)
from snack
where snack_name like '%깡';

--제일 비싼 과자(이름, 제조사, 가격)
select snack_name, snack_maker, snack_price
from snack
where s_price = max(snack_price);

---------------------------------------
-- subQuery (쿼리 속 쿼리)

--'제일 비싼'만 잘라낸다.

-- where 절에 통계함수를 못 쓴다.
--제일 비싼 과자(이름, 제조사, 가격)
select snack_name, snack_maker, snack_price
from snack
where snack_price = (select max(snack_price) from snack)--비싼거 와야하는 자리


select * from snack;

-- 평균가보다 비싼 과자(이름, 가격)
select snack_name, snack_price
from snack
where snack_price > (select avg(snack_price) from snack);


-- 제일 가벼운 과자(이름, 가격)

select snack_name, snack_price
from snack
where snack_weight = (select min(snack_weight) from snack);



-- 농심 과자의 평균가보다 비싼 과자의 전체 정보
select *
from snack
where snack_price > (select avg(snack_price) from snack where snack_maker = '농심');






-- 해태 과자중 제일 비싼 과자보다 싼 나머지 과자들의 정보 전체

select * from SNACK
where snack_price < (select max(snack_price) from snack where snack_maker = '해태');

--농심, 해태 과자 정보 전체

select * from snack
where snack_maker = '농심' or '해태';

--Oracle에서는 or나 and는 그냥 쓰면 된다.

--1000 < 가격 < 1500인 과자 정보 전체
select * from SNACK
where 1000 < snack_price and snack_price < 1500;

---------------------------------------------------------
--정렬 order by column    desc(역순)

--해태 과자 전체 이름순으로 정렬
select * from SNACK
where snack_maker = '해태'
order by snack_name;

--과자 전체 정보를 가격순(오름차순)
select * from SNACK
order by snack_price, snack_name;

-- 1500원이 전재산
-- 내가 사먹을 수 있는 과자 리스트
-- 유통기한이 짧은걸 위로

select * from snack
where snack_price <= 1500
order by snack_expire;



















