-- 곱셈연산자, 비교연산자
-- 동등연산자 = (==아님!)
SELECT EMP_NAME,SALARY, SALARY * 12 AS "ANNUAL", HIRE_DATE
  FROM EMPLOYEE
 WHERE (SALARY * 12 ) >= 37000;
 
-- not
SELECT EMP_NAME,SALARY, SALARY * 12 AS "ANNUAL", HIRE_DATE
  FROM EMPLOYEE
 WHERE NOT (SALARY * 12 ) >= 37000;

-- in = or 와 동일
SELECT e.*
  FROM employee e
 WHERE e.dept_id = 1 OR e.DEPT_ID = 4;

SELECT e.*
  FROM employee e
 WHERE e.DEPT_ID in(1,4);

-- BETWEEN
-- hire_data는 날짜형이지만 날짜타입의 문자열과 비교가능
-- 2022년 한해동안 입사한 직원정보 조회
SELECT *
  FROM employee e
 WHERE e.HIRE_DATE >= '2022-01-01'
   AND e.hire_date <= '2022-12-31';

SELECT *
  FROM employee e
 WHERE e.HIRE_DATE BETWEEN '2022-01-01' AND '2022-12-31';

SELECT *
  FROM employee e
 WHERE e.SALARY BETWEEN 3000 AND 6000;

-- LIKE - 문자열에 패턴을 검색
-- % _
-- seoul : _eo__,%eo%,_eo% 전부 동일하게 검색
SELECT *
  FROM customer
 WHERE city = 'Busan';
 
SELECT *
  FROM customer
 WHERE city LIKE '%eo%';

SELECT *
  FROM customer
 WHERE cust_name LIKE 'Cust___';

-- null 비교
-- empty와 다름 !!
SELECT *
  FROM CUSTOMER
 WHERE city IS NULL; --'' empty 와 다름
SELECT *
  FROM CUSTOMER
 WHERE city IS NOT NULL;

-- 집합연산
-- 가상테이블 - 조인, 유니온처럼 쿼리 결과로 나오는 테이블
SELECT PROD_NAME, PRICE 
  FROM PRODUCT 
 WHERE PRICE >= 45000
 UNION -- union all 은 중복제거없이 모두 출력
SELECT EMP_NAME, SALARY 
  FROM EMPLOYEE
 WHERE salary >= 9000;

-- 교집합 union 대신 intersect 사용 - 별로 중요하지 않아 넘어감.