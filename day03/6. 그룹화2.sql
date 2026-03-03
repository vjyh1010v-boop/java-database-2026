-- scott 계정 !
-- 부서번호와 직군별 그룹화
SELECT deptno, job
     , count(*)
     , max(sal)
     , avg(sal)
  FROM emp
 GROUP BY deptno, job
 ORDER BY deptno;


-- ROLLUP 함수 적용한 그룹화
SELECT deptno
     , count(*)
     , max(sal)
     , avg(sal)
  FROM emp
 GROUP BY deptno
 ORDER BY deptno;

SELECT deptno
     , count(*)
     , max(sal)
     , avg(sal)
  FROM emp
 GROUP BY ROLLUP (deptno)
 ORDER BY deptno;

-- ROLLUP0 첫번째 컬럼의 값으로 소계, 전체 총계를 도출
SELECT deptno, job
     , count(*)
     , max(sal)
     , avg(sal)
  FROM emp
 GROUP BY ROLLUP(deptno, job)
 ORDER BY deptno;

SELECT deptno, job
     , count(*)
     , max(sal)
     , avg(sal)
  FROM emp
 GROUP BY JOB, ROLLUP(deptno)
 ORDER BY JOB;

-- 각각의 컬럼별로 소계, 전체 총계를 도출
SELECT deptno, job
     , count(*)
     , max(sal)
     , avg(sal)
  FROM emp
 GROUP BY CUBE(deptno, job)
 ORDER BY deptno;

-- GROUPING SETS - 차후
-- GROUPING 함수 : SELECT절에 GROUPING 적용
-- 실무에서는 각 그룹(다중행)함수에 별명을 지정사용
SELECT deptno, job
     , count(*) AS "직원수"
     , max(sal) AS "최고급여"
     , avg(sal) AS "최소급여"
     , GROUPING(JOB) AS "JOB_GRID"
     , GROUPING(DEPTNO) AS "DEP_GRID"
     , GROUPING_ID(DEPTNO, JOB) AS "DEP_JOB_GRID"
  FROM EMP 
 GROUP BY ROLLUP(DEPTNO, JOB)
 ORDER BY DEPTNO;

-- 나만의 예시 --
SELECT 
    CASE GROUPING(deptno) 
 	   WHEN 1 THEN '모든부서' 
    	      ELSE TO_CHAR(deptno) END AS 부서번호,
    CASE GROUPING(job) 
       WHEN 1 THEN '부서합계' ELSE job END AS 직무,
    COUNT(*) 인원수
FROM emp
GROUP BY ROLLUP(deptno, job);


-- ROLLUP , CUBE를 몰라도 SUBQUERY로 구현 가능

-- PIVOT
-- 부서별, 직책별로 그룹화 최고 급여 조회
SELECT DEPTNO, JOB, MAX(SAL)
  FROM EMP
 GROUP BY DEPTNO, JOB
 ORDER BY DEPTNO, JOB;

-- PIVOT 함수 사용
  
SELECT *
  FROM (SELECT DEPTNO, JOB, SAL
  		  FROM EMP)
  PIVOT (MAX(SAL) FOR DEPTNO IN (10, 20, 30))
 ORDER BY JOB;

-- PIVOT 몰라도 CASE -WHEN 으로 구현 가능