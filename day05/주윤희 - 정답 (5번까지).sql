SELECT *
  FROM emp;

SELECT *
  FROM dept;

-- 1번
SELECT e.emp_name
     , d.dept_name
FROM emp e
INNER JOIN dept d
   ON e.dept_id = d.dept_id;

-- 2번
SELECT e.emp_name
     , e.salary
FROM emp e
INNER JOIN dept d
   ON e.dept_id = d.dept_id
WHERE d.dept_name = 'DEV';

-- 3번
--SELECT D.DEPT_NAME
--     , COUNT(E.EMP_ID) AS EMP_COUNT
-- FROM EMP E
--INNER JOIN DEPT D
--   ON E.DEPT_ID = D.DEPT_ID
--GROUP BY D.DEPT_NAME;

--SELECT dept_id
--     , COUNT(emp_id) AS emp_count
--FROM emp
--GROUP BY dept_id
--ORDER BY dept_id;

SELECT dept_id
     , COUNT(emp_id) AS emp_count
FROM emp
GROUP BY dept_id
ORDER BY dept_id;

-- 4번
SELECT emp_name
     , salary
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);


--SELECT DEPTNO, JOB, AVG(SAL)
--  FROM EMP
-- GROUP BY DEPTNO, JOB 
-- ORDER BY DEPTNO, JOB;


-- 5번
--SELECT * FROM DEPT d ;
--SELECT * FROM EMP e 
--SELECT * FROM EMP_PROJECT ; 
--SELECT * FROM PROJECT p ;
--
--



SELECT e.emp_name
     , p.proj_name
FROM emp e
INNER JOIN emp_project ep
   ON e.emp_id = ep.emp_id    -- 1단계: 직원과 징검다리 연결
INNER JOIN project p
   ON ep.proj_id = p.proj_id; -- 2단계: 징검다리와 프로젝트 연결
