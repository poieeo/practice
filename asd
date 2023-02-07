where 는 그룹바이 무조건 위에 넣어야함  
whrere 은 조건을 정해주는 것이다 


group by 에는 조건을 붙일려면 having을 쓴다 

----
    
select 계절,구분,count(*) from
(SELECT *,
case 
when name is null then '비정상'
else '정상'
end 구분

,case
when month(datetime)<=6 then '상반기'
else '하반기'
end 계절

from ANIMAL_INS) a
group by 계절,구분 having 계절='상반기'

------





-- 코드를 입력하세요
SELECT CAR_TYPE,count(car_type)  as CARS	 from CAR_RENTAL_COMPANY_CAR
group by CAR_TYPE
order by car_type asc 

SELECT CAR_TYPE,count(car_type)  as CARS from CAR_RENTAL_COMPANY_CAR 
where OPTIONS like '%통풍시트%' or 
    OPTIONS like '%열선시트%' or
    OPTIONS like '%가죽시트%'
group by car_type
order by car_type

-- not like 도 되지않는가 

-- 코드를 입력하세요
SELECT MCDP_CD as "진료과코드" from APPOINTMENT
group by MCDP_CD

SELECT APNT_NO,
case 
when APNT_YMD="2022-05*"
end '5월예약건수'
from APPOINTMENT


SELECT APNT_YMD,APNT_NO	,PT_NO,	MCDP_CD,	MDDR_ID,

where APNT_YMD like '%m=05'

from APPOINTMENT


SELECT NAME,	COUNT(NAME) as count from ANIMAL_INS 
group by NAME


where NAME like '%el%'


SELECT ANIMAL_ID,	NAME,	SEX_UPON_INTAKE from ANIMAL_INS
where NAME='Lucy' or NAME='Ella' or NAME='Pickle' or NAME='Rogan'
or name='Sabrina'or name=' Mitty'
order by ANIMAL_ID desc

SELECT ANIMAL_ID,	NAME,	SEX_UPON_INTAKE from ANIMAL_INS
where NAME='Lucy' or NAME='Ella' or NAME='Pickle' or NAME='Rogan'
or name='Sabrina'or name=' Mitty'

order by ANIMAL_ID 



-- 코드를 입력하세요
SELECT ANIMAL_TYPE,
case
when name is null then 'No name'
else name
end name,SEX_UPON_INTAKE
from ANIMAL_INS




SELECT APNT_NO,
case 
when date_format(APNT_YMd,'%Y-%m')="2022-05" then '5월예약건수'
end 예약 
from APPOINTMENT


SELECT APNT_YMD,APNT_NO	,PT_NO,	MCDP_CD, MDDR_ID
where date_format(APNT_YMD,'%Y-%m')='05'

from APPOINTMENT




select MCDP_CD as 진료과코드,	count(	MCDP_CD) as 5월예약건수

from
(SELECT APNT_YMD,APNT_NO	,PT_NO,	MCDP_CD, MDDR_ID

from APPOINTMENT
where date_format(APNT_YMD,'%m')='05') a
group by MCDP_CD







