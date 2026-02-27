-- 문자열 함수
-- 대문자, 소문자, 첫글자만 대문자 변환 함수
SELECT C.CUST_NAME
	 , LOWER(C.CUST_NAME)
	 , C.CITY 
	 , UPPER(c.CITY )
  FROM CUSTOMER c ;

SELECT LOWER(C.CUST_NAME)
	 , C.CITY
  FROM CUSTOMER c ;

-----

SELECT C.CUST_NAME
	 , LOWER(C.CUST_NAME) AS "고객명"
	 , INITCAP(LOWER(C.CUST_NAME)) AS "고객명"
	 , C.CITY 
	 , UPPER(c.CITY ) AS "도시명"
  FROM CUSTOMER c ;

-- WHERE 절에도 사용가능
SELECT *
  FROM CUSTOMER c 
 WHERE LOWER(C.CITY ) = 'seoul';
  
-- 문자열길이
SELECT CITY, LENGTH(CITY) AS "글자길이"
  FROM CUSTOMER;

-- 문자열 추출
SELECT EMP_NAME , SUBSTR(EMP_NAME, 4, 2 )
  FROM EMPLOYEE ;

-- 문자열에서 찾기
SELECT instr('HELLO, ORACLE!', 'L') AS "첫번째 L위치"
     , instr('HELLO, ORACLE!', 'L', 5) AS "5번째 L위치"
     , instr('HELLO, ORACLE!', 'L', 2, 2) AS "2번째 위치 이후 두번째 나타나는 L위치"
  FROM dual;

-- 문자열 교체
SELECT REPLACE('Oh, Hello Orcle!', 'Hello', 'HELL') AS "변경된문자열"
  FROM DUAL;

-- 빈공간을 특정문자로 채우기
SELECT LPAD('Matrix', 20, '#'),
  	   rpad('Oracle', 20, '@')
  FROM dual;

-- 두 문자열 합치기
SELECT concat('Hello', 'World')
  FROM DUAL;

-- 공백제거
SELECT TRIM('      Marvel Universe       ')
     , ltrim('      Marvel Universe       ')
     , rtrim('      Marvel Universe       ')
  FROM dual;

SELECT 1 AS "같아요"
  FROM dual
 WHERE 'Hello World' = trim('      Hello World');

-- 숫자함수
SELECT ROUND(1234.3456)
     , ROUND(1234.3456, 3) -- 소수점 세번째자리까지 반올림
   	 , TRUNC(1234.3456)
   	 , CEIL(3.14)
   	 , FLOOR(3.14)
   	 , MOD(10, 2)
  FROM DUAL;