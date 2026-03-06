-- 기본
SELECT * FROM dept;

SELECT * FROM emp;

SELECT * FROM project;

SELECT * FROM emp_project;

SELECT * FROM pay_history;

-- 1번 사원의 이름과 부서 이름을 같이 조회하세요.  
-- 두테이블 조인 
SELECT e.emp_name, d.dept_name
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
  FROM emp e
  JOIN dept d
    ON e.dept_id = d.dept_id
 ORDER BY e.hire_date;

-- 2번 DEV 부서에 속한 사원의 이름과 급여를 조회하시오.
-- emp, dept 조인, DEV 이름의 부서명에 속한...
-- Oracle 조인
SELECT e.emp_name, e.salary
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id
   AND d.dept_name = 'DEV';

SELECT e.emp_name, e.salary
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id
   AND d.dept_id = 10;

-- 표준 SQL조인
SELECT e.emp_name, e.salary
  FROM emp e 
  JOIN dept d
    on e.dept_id = d.dept_id
 WHERE d.dept_name = 'DEV';

-- 3번. 부서별 사원 수를 조회하시오.
SELECT e.dept_id, count(*) AS "EMP_COUNT"
  FROM emp e
 GROUP BY e.dept_id;
 
-- 4번. 전체 평균 급여보다 높은 급여를 받는 사원을 조회하시오. 
-- 서브쿼리
SELECT e.emp_name, e.salary
  FROM emp e
 WHERE e.salary > (SELECT AVG(salary) 
                     FROM emp);

-- 5번. 프로젝트에 참여하는 사원의 이름과 프로젝트 이름을 조회하시오.
-- 3개 테이블 조인
SELECT e.emp_name, p.PROJ_NAME
  FROM emp e, emp_project ep, project p
 WHERE e.emp_id = ep.emp_id
   AND ep.proj_id = p.proj_id
   



 
 