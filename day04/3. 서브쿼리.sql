-- 서브쿼리

-- 1. 사원 이름 JONES인 사원 급여 조회
SELECT e.sal -- * > sal 로 변경
  FROM emp e
 WHERE e.ename = 'JONES';

-- 2. 급여가 2,975보다 높은 사원 조회
SELECT *
  FROM emp e
 WHERE e.sal >= 2975; -- 고정된 값

-- 서브쿼리 = 1, 2번 쿼리 합친것
SELECT *
  FROM emp e
 WHERE e.sal >= (SELECT sal FROM emp WHERE ename = 'JONES');

-- 9-2 단일행 서브쿼리
-- SCOTT 직원의 입사날짜보다 이전에 입사한 직원 조회
SELECT E.HIREDATE -- * > 날짜 나오는 거 확인
  FROM EMP E
WHERE E.ENAME = 'SCOTT';

-- 1987-07-13이 1980-01-01보다 큰 수
SELECT *
  FROM EMP O
 WHERE O.HIREDATE < (SELECT E.HIREDATE
 					   FROM EMP E
                      WHERE E.ENAME = 'SCOTT');

-- 모든 직원의 평균 급여보다 높은 급여를 받는 직원 조회
-- SELECT AVG(E.SAL)  FROM EMP E;
SELECT *
  FROM EMP O
 WHERE O.SAL >= (SELECT AVG(E.SAL)
                   FROM EMP E)
   AND  O.DEPTNO = 20;

SELECT O.*, D.DNAME
  FROM EMP O, DEPT D
 WHERE O.DEPTNO = D.DEPTNO
   AND O.SAL >= (SELECT AVG(E.SAL)
                   FROM EMP E)
   AND  O.DEPTNO = 20;

-- 서브쿼리와 조인을 같이 사용가능
SELECT O.*, D.DNAME
  FROM EMP O, DEPT D
 WHERE O.DEPTNO = D.DEPTNO
   AND O.SAL >= (SELECT AVG(E.SAL)
                  FROM EMP E)
   AND O.DEPTNO = 20;

-- 9-3 다중행 서브쿼리
-- DEPTNO 가 20, 30인 직원조회 -- 'RESERCH', 'SALES'인 부서에 다니는 직원들만 조회
SELECT *
  FROM EMP E
 WHERE E.DEPTNO IN (SELECT D.DEPTNO
                      FROM DEPT D
                    WHERE D.DNAME IN ('RESERCH', 'SALES'));

-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 조회
SELECT MAX(E.SAL), E.DEPTNO
  FROM EMP E
 GROUP BY E.DEPTNO;
-- 부서별로 2850, 3000, 5000 행이 조회됨
SELECT MAX(E.SAL), E.DEPTNO
  FROM EMP E
 GROUP BY E.DEPTNO;

-- IN 구문을 쓰면 다중행 데이터를 조회가능
--SELECT *
--  FROM EMP
-- WHERE DEPTNO IN (10, 20, 30);

-- IN도 OR구문과 동일
SELECT *
  FROM EMP O
 WHERE O.SAL IN (SELECT MAX(E.SAL)
                   FROM EMP E
                  GROUP BY E.DEPTNO);

-- ANY, SOME 서브쿼리 변환 결과들 중 메인쿼리의 조건이 하나로 참이면
SELECT *
  FROM EMP O
 WHERE O.SAL = ANY (SELECT MAX(E.SAL)
                   FROM EMP E
                  GROUP BY E.DEPTNO);

-- 39번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원정보 조회
-- ANY, SOME -> OR조건
SELECT *
  FROM EMP O
WHERE SAL > ANY (SELECT SAL
                   FROM EMP
                  WHERE DEPTNO = 30);

-- 39번 부서 사원들의 모든 급여보다 적은 급여를 받는 사원정보 조회
-- ALL -> AND 조건
SELECT *
  FROM EMP O
WHERE O.SAL < ANY (SELECT SAL
                   FROM EMP
                  WHERE DEPTNO = 30);

-- 서브쿼리 결과 값이 존재하면 메인쿼리가 조회
-- 내가 찾는 부서가 있다면 모든 직원 조회하라
SELECT *
  FROM EMP O
WHERE EXISTS (SELECT DNAME
                   FROM DEPT
                  WHERE DEPTNO = 50);

-- 9-3 다중열 서브쿼리
SELECT *
 WHERE (O.SAL, O.DEPTNO) IN (SELECT MAX(E.SAL), E.DEPTNO
                               FROM EMP E
                              GROUP BY E.DEPTNO);

-- FROM 절
-- 가상테이블이다 !!!!
SELECT E.EMPNO
     , E.DEPTNO 
     , TO_CHAR(E.HIREDATE, 'YYYY-MM-DD') AS "입사일"
  FROM EMP e;

-- 가상의 테이블을 만들어서 마치 실제 테이블인 것처럼 사용가능
SELECT *
  FROM DEPT D, (SELECT EMPNO
                     , DEPTNO
                     , TO_CHAR(HIREDATE, 'YYYY-MM-DD') AS "입사일"
                 FROM EMP) E
 WHERE D.DEPTNO = E.DEPTNO;

-- 복잡한 서브쿼리도 가능! *메모는 안해도 됨 (노션에 있음)

-- 둘다 서브쿼리로 사용
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
       (SELECT * FROM DEPT) D
 WHERE E10.DEPTNO =D.DEPTNO;

-- WITH절로 가상 테이블을 위로 올려서 정의
-- 가독성, 성능개선
WITH 
E10 
AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM E10, D 
WHERE E10.DEPTNO = D.DEPTNO;

-- 상호연관 서브쿼리 - 알고만 있길. 차후 실무에서 확인
-- 메인쿼리 데이터를 서브쿼리 사용, 그 결과를 다시 메인쿼리 반영
SELECT *
  FROM EMP E1
 WHERE E1.SAL > (SELECT MIN(SAL)
                  FROM EMP
                 WHERE DEPTNO = E1.DEPTNO)
 ORDER BY E1.DEPTNO, E1.SAL;

-- 나중에 명건선생님 깃보고 수정하기… 