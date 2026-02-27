-- 문제 풀기

-- 문제 1
SELECT emp_name AS "이름", salary AS "월급" 
  FROM EMPLOYEE 
order BY salary desc;

-- 문제 2
SELECT CUST_ID, CUST_NAME "고객이름", city, REG_DATE "가입일"
  FROM CUSTOMER
 WHERE city = 'Seoul'
ORDER BY REG_DATE desc;

-- 정답
SELECT CUST_ID, CUST_NAME "고객이름", city, REG_DATE "가입일"
  FROM CUSTOMER
 WHERE city = 'Seoul'
ORDER BY REG_DATE desc;

-- 문제 3
SELECT PROD_NAME AS "상품명"
	PRICE  
  FROM PRODUCT
 WHERE p.ㅔ >= '2022-01-01'
   AND p.hire_date <= '2022-12-31';


--1. employee 테이블에서 직원명과 급여를 조회하세요.
--직원명은 "이름", 급여는 "월급"이라는 별명으로 변경하세요. 급여가 높은 순으로 정렬하세요.
--
--2. customer 테이블에서 도시가 'seoul'인 고객만 조회하세요.
--고객명은 "고객이름", reg_date 는 "가입일"로, 가입일이 최근 순으로 정렬하세요.
--
--3. product 테이블에서 가격이 10,000이상 30,000 이하인 상품을 조회하세요.
--"상품명", "판매가"로 별명을 사용하고, 가격이 낮은 순으로 정렬하세요.