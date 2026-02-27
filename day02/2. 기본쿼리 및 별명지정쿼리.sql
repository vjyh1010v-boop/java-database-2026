-- 품목 전체 열 조회 1 - 최초 조회
SELECT *
	FROM PRODUCT product;

-- 품목 전체 열 조회 2 - 실제 작업시
SELECT prod_id prod_name, price FROM product;

-- 품목 열이름을 변경하고 싶어요~ 별명
SELECT prod_id AS "품목아이디"
     , prod_name AS "품목명"
     , price AS "가격"
 FROM product;

-- alias 1
SELECT prod_id AS "품목아이디"
     , prod_name AS "품목명"
     , price AS "가격"
 FROM product;

-- alias 2 - as 키워드를 생략해도 되고
SELECT prod_id "품목아이디"
     , prod_name "품목명"
     , price "가격"
 FROM product;

-- alias 3 - 테이블명을 동일하게 쓰면 테이블명. 으로 컬럼을 지정해도 되고
SELECT PRODUCT.prod_id "품목아이디"
     , PRODUCT.prod_name "품목명"
     , price "가격"
 FROM product;

-- alias 4 - 테이블명에 별명을 지정하면, 컬럼명 사용시 반드시 별명. 으로 사용해야
SELECT PRd.prod_id "품목아이디"
     , prd.prod_name "품목명"
     , prd.price "가격"
 FROM product prd;

-- 별명 5
SELECT emp_id
     , emp_name
     , salary
     , salary * 12 AS "annual_salary"
     , hire_date
     , dept_id
	FROM EMPLOYEE;