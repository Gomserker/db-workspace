create table movie_test(
m_no number(3) primary key,
m_title varchar2(30 char) not null,
m_actor varchar2(30 char) not null,
m_img varchar2(200 char) not null,
m_story varchar2(500 char) not null
);

create sequence movie_test_seq;

insert into movie_test values (movie_test_seq.nextval, 'title', 'actor', 'imgSrc', 'scenario');
insert into movie_test values (movie_test_seq.nextval, 'title2', 'actor2', 'imgSrc2', 'scenario2');

select * from MOVIE_TEST;