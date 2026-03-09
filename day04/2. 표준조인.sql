-- join ~ using
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.JOB 
     , e.hiredate, e.sal
  FROM dept d join emp e
    ON d.deptno = e.deptno;

-- inner join - 정확하게 이걸 더 하길 원함...
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.JOB 
     , e.hiredate, e.sal
  FROM dept d INNER join emp e
    ON d.deptno = e.deptno
 WHERE d.deptno = 30;

-- outer join
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.JOB 
     , e.hiredate, e.sal
  FROM dept d LEFT OUTER JOIN emp e
    ON d.deptno = e.deptno;

SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.JOB 
     , e.hiredate, e.sal
  FROM dept d RIGHT OUTER JOIN emp e
    ON d.deptno = e.deptno;

-- 세 테이블 조인 쿼리
SELECT d.deptno
     , d.dname
     , e.empno
     , e.ename
     , e.job
     , e.sal
     , s.grade
  from emp e
 INNER JOIN dept d
    ON e.deptno = d.DEPTNO
  JOIN salgrade s
    ON e.sal BETWEEN s.losal AND s.HISAL
 ORDER BY d.deptno, e.empno;

-- 오라클 쿼리로.
SELECT d.deptno
     , d.dname
     , e.empno
     , e.ename
     , e.job
     , e.sal
     , s.grade
  from emp e, dept d, salgrade s
 WHERE e.deptno = d.DEPTNO   
   AND e.sal BETWEEN s.losal AND s.HISAL
 ORDER BY d.deptno, e.empno;