-- ms sql에 저장된 데이터베이스 객체확인 


select name,create_date from sys.databases;



select name,create_date from sys.databases
where year(create_date)>=2023;



--가상테이블 또는 임시테이블
--지역:현재 쿼리화면에서만 사용가능한테이블 (이 쿼리를벗어나면 메모리에서제거됨
--전역:ssms프로그램을 종료하면 메모리에서 제거되는 테이블 




/* ################
테이블생성하는프로시저
################ */ 


create procedure 테이블생성
as
begin 
	DROP table if exists dbo.회원
	DROP table if exists dbo.시도코드

	create table 회원(회원번호 TINYINT primary key, 이름 nchar(5), 시도코드 SMALLINT, 출생년도 SMALLINT, 성별 BIT);
	insert into 회원 values (1,'a',100,1980,1),
							(2,'a',100,1980,1),
							(3,'b',200,2000,1),
							(4,'c',300,2010,1)

	create table 시도코드(시도코드 SMALLINT primary key, 시도명 nchar(10))
	insert into 시도코드 values (10, '서울특별시'),
	(100, '강원도'),
	(200, '경기도'),
	(300, '제주도');

end 



exec 테이블생성

/* ################

임시테이블생성하는프로시저
################ */


SELECT * INTO #ALL 
from

(
select 회원.회원번호, 회원.이름, 회원.시도코드, 시도코드.시도명 ,2023-출생년도 as 나이
,case when  성별=1 then '남'
when  성별=0 then '여'
else '오류'
end 남여구분


from 회원


left join 시도코드
on 회원.시도코드=시도코드.시도코드) as aa






select * from #ALL


select * from #ALL
where 나이 between 20 and 40
		and 
		남여구분='남'
		order by 나이 desc

declare @검색하는이름 nchar(5)
set @검색하는이름='a'
select * from 회원
where 이름=@검색하는이름
