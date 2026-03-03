-- NULL 데이터로 발생하는 현상
-- NULL은 개수나, 통계에서 계산되지 않는 문제발생
SELECT SUM(SALARY), COUNT(SALARTY), COUNT(*)
  FROM EMPLOYEE;

-- NVL() NULL여부를 판단, 값이 NULL일 경우 다른 데이터로 반환
SELECT EMP_ID
     , EMP_NAME
     , nvl(SALARY, 0) AS "salary"
     , nvl2(SALARY, '0', 'x') AS "is_salary_ok" 
     , TO_char(hire_date, 'yyyy-mm-dd') AS "입사일"
     , DEPT_ID
  FROM EMPLOYEE
-- WHERE SALARY IS NULL;