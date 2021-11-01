create table db_bmi(
	d_no number(2) primary key,
	d_name varchar2(20char) not null,
	d_weight number(4,1) not null,
	d_height number(4,1) not null,
	d_bmi number(5,2) not null,
	d_result varchar2(10char) not null
);

create sequence db_bmi_seq;

select * from DB_BMI;