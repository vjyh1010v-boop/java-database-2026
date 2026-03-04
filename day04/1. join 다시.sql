-- 조인 한번 더
SELECT *
  FROM dept;

SELECT d.deptno, d.dname, d.LOC
     , e.empno, e.ename, e.job
     , to_char(e.hiredate, 'yyyy-mm-dd') AS giredate
     , e.sal
  FROM dept d, emp e
 WHERE d.deptno = e.deptno
 ORDER BY e.empno ASC;

-- 셀프조인
-- e1 상사를 찾는 (기준) 테이블
-- e2 상사 테이블
--SELECT *
--  FROM emp e1, emp e2 
-- WHERE e1.mgr = e2.empno;
-- ?
SELECT e1.empno, e1.ename, e1.mgr
     , e1.hiredate 
     , e2.empno AS mgr_empno
     , e2.ename AS mgr_ename
  FROM emp e1, emp e2
 WHERE e1.mgr = e2.empno;
     
--SELECT e1.empno, e1.ename, e1.mgr
--     , e1.hiredate mgr_empno
--     , e2.ename AS mgr_ename
--  FROM emp e1, emp e2
-- WHERE e1.mgr = e2.empno;

-- 외부조인 - 등가조인에 일치하지 않는 데이터도 조회
-- mgr 상사가 있는지 확인
SELECT e1.empno, e1.ename, e1.mgr
     , e1.hiredate
     , e2.empno AS mgr_empno
     , e2.ename AS mgr_ename
  FROM emp e1, emp e2
 WHERE e1.mgr = e2.empno (+);

-- 잘못된 조인, e2의 empno를 상사 컬럼(필드)으로 하고, e1의 mgr를 부하컬럼으로 외부조인
SELECT e1.empno AS mgr_empno, e1.ename mgr_ename, e1.MGR 
     , e1.hiredate
     , e2.empno AS empno
     , e2.ename AS enme
  FROM emp e1, emp e2
 WHERE e1.mgr (+) = e2.empno;

-- 외부조인 두번쨰 예제 
-- (일단 이거는) 일반내부조인
SELECT d.deptno, d.dname, d.loc
     , e.empno, e.ename, e.job
     , e.hiredate, e.sal
  FROM dept d, emp e
 WHERE d.deptno = e.deptno;

-- 왼쪽외부조인
SELECT d.deptno, d.dname, d.loc
--     , e.empno, e.ename, e.job
--     , e.hiredate, e.sal
     , e.* 
  FROM dept d, emp e
 WHERE d.deptno = e.deptno (+);

-- 오른쪽외부조인
SELECT d.deptno, d.dname, d.loc
--     , e.empno, e.ename, e.job
--     , e.hiredate, e.sal
      , e.*
  FROM emp e, dept d
 WHERE d.deptno (+) = e.deptno;

-- 오른쪽 '외부조인' 외부아우터조인 (물건을 안산사람을 찾아서 문자보낼 때)
SELECT d.deptno, d.dname, d.loc
     , e.* 
  FROM dept d, emp e-- 자식테이블 기준을 했을 때는 부모테이블 전부를 가져올 수 없다. 
                                -- 부모기준으로 했을 때 null 나오지만, 자식기준으로는 
 WHERE d.deptno (+) = e.deptno;  

-- 왼쪽 '외부조인'
SELECT d.deptno, d.dname, d.loc
     , e.* 
  FROM dept d, emp e 
 WHERE d.deptno = e.deptno (+)
   AND e.empno IS NULL;