-- 조건 없는 쿼리
SELECT *
  FROM  PRODUCT;

-- PROD_ID가 108번인 품목 조회
SELECT *
  FROM  PRODUCT
WHERE PROD_ID = 108;

-- EMPLOYEE에서 DEPT_ID 가 2번인 직원만 조회
SELECT *
  FROM  EMPLOYEE e
WHERE E.DEPT_ID = 2;

-- EMPLOYEE에서 DEPT_ID 가 4번이고 월급이 5992달러인 직원 조회
SELECT *
  FROM EMPLOYEE E
 WHERE E.DEPT_ID = 4
   AND E.SALARY = 2000;

-- 연습용 -- 개인적으로 해보기 ---

--  OR 연산자, EMPLOYEE에서 DEPT_ID가 1또는 4인 직원들 조회
SELECT *
  FROM EMPLOYEE E
 WHERE E.DEPT_ID = 1
   OR E.DEPT_ID  = 4;




