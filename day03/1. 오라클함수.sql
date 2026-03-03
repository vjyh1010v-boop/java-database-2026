-- 날짜출력
 SELECT sysdate AS now
      , sysdate-1 AS "내일날짜"
      , sysdate+1 AS tomorrow
   FROM dual;

-- 달을 증가시키는 함수
SELECT sysdate AS "current"
     , ADD_MONTHS(sysdate,3) AS "3monthlater"
  FROM dual;

-- 입사 10주년이 되는 사원 조회
SELECT emp_id, emp_name, hire_date
     , ADD_MONTHS(HIRE_DATE ,120) AS "anniversal10years"
FROM employee;

-- 두 날짜간의 개월 수 차이
-- 우리회사 가장 입사 오래된 직원과 가장 최근 입사한 직원 사이 개월수
SELECT min(hire_date), max(HIRE_DATE)
     , MONTHS_BETWEEN(max(hire_date), min(hire_date)) AS "OldestbetNewst"
FROM EMPLOYEE;

-- 돌아오는 요일, 달의 마지막 날짜 구하기
SELECT sysdate
     , next_day(sysdate, '금요일')
     , last_day(add_months(sysdate, -1))
FROM dual;

--
SELECT *
FROM nls_session_parameters
WHERE PARAMETER = 'nls_date_language';

ALTER SESSION SET nls_date_language = korean; -- AMERICAN;

-- sysdat보다 current_date(세션타임)로 현재
SELECT CURRENT_DATE FROM dual;ALTER 


/* 형변환*/
SELECT emp_id, EMP_NAME, EMP_ID + '500' -- 자동형변환
  FROM EMPLOYEE;

SELECT 'emp' + emp_id, EMP_name
  FROM EMPLOYEE;

-- To_CHAR() 날짜, 숫자 데이터를 문자 데이터로 변환
SELECT TO_CHAR(current_date, 'YYYY/MM/DD HH24:MM:SS') AS "현재일시"
  FROM dual;

SELECT to_char(salary, '$999,999') AS "sal_$"
     , TO_char(salary, 'l999,999') AS "sal_l" -- 지역화폐단위
     , TO_char(salary, 'l999,999.00') AS "sal_l" -- 소수점 표현
  FROM employee;

-- To_number() 문자 데이터를 숫자 데이터로
SELECT 1300 + '1500'
  FROM dual;

SELECT '1,300' + '1,500' -- 1000단위 쉼표가 포함된 문자열은 자동 형변환x
  FROM dual;

-- 1000 단위 쉼표가 표현된 문자 데이터면 숫자포맷을 사용, 숫자로 형변환 해줘야 한다.
SELECT to_number('1,300','999,999') + to_number('1,500', '999,999')
  FROM dual;

SELECT to_number('천삼백', '999,999') -- 천삼백 문자로 절대 안됨! 숫자로 된 문자데이터만 됨.
  FROM dual;


-- to_date() 문자형식으로 된 날짜데이터를 날짜형으로 변경
SELECT TO_DATE('2026-03-03') AS todate1
     , to_date('2026-03-03','yyyy-mm-dd') AS todate2
     , to_char(to_date('2026-03-03', 'yyyy-mm-dd'), 'yyyy-mm-dd') as todate3
  FROM dual;
