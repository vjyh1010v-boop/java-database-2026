-- 그룹화
-- 테이블 데이터도 사용어렵고, 쿼리가 복잡해짐
SELECT avg(salary), 1 FROM employee WHERE dept_id =1
UNION ALL 
SELECT avg(salary), 2 FROM employee WHERE dept_id =2
UNION ALL 
SELECT avg(salary), 3 FROM employee WHERE dept_id =3
UNION all
SELECT avg(salary), 4 FROM employee WHERE dept_id =4;

-- 그룹화를 하면 간결
SELECT avg(salary), dept_id
  FROM EMPLOYEE
 gROUP BY dept_id
 ORDER BY dept_id;

-- 다중행 함수를 사용할 때
-- 일반 컬럼을 사용하려면 무조건 !
-- group by에 추가해야 함. **
SELECT avg(salary), min(salary), max(salary), DEPT_ID 
  FROM EMPLOYEE
 gROUP BY dept_id;

SELECT avg(salary), COUNT(SALARY), DEPT_ID
  FROM EMPLOYEE
 gROUP BY dept_id;

-- HAVING 절, 다중행의 필터링
SELECT avg(salary), COUNT(SALARY), DEPT_ID
  FROM EMPLOYEE
--WHERE SALARY <= 8000  -- 일반 값 필터링
 GROUP BY dept_id
 HAVING AVG(SALARY) >= 6000   -- 다중행함수 필터링
 ORDER BY DEPT_ID;

-- 그룹화 통계
SELECT DEPT_ID, AVG(SALARY), COUNT(SALARY)
  FROM EMPLOYEE
 GROUP BY ROLLUP(DEPT_ID);

SELECT NVL(TO_CHAR(DEPT_ID), '--총합--') AS "부서코드"
     , AVG(SALARY), COUNT(SALARY)
  FROM EMPLOYEE
 GROUP BY ROLLUP(DEPT_ID)
 ORDER BY DEPT_ID;

SELECT NVL(TO_CHAR(DEPT_ID), '--총합--') AS "부서코드"
     , AVG(SALARY), COUNT(SALARY)
  FROM EMPLOYEE
 GROUP BY CUBE(DEPT_ID)
 ORDER BY DEPT_ID;