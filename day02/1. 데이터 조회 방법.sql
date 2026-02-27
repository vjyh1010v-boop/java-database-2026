-- 현재 날짜 조회
-- dual은 테이블이 아님.
SELECT sysdate FROM dual;

-- 고객정보 조회
-- 셀렉트 올 -> select *
-- * 전부다
-- 셀렉션
SELECT * FROM employee;

-- 셀렉션
SELECT * FROM department;

-- 프로젝션
SELECT emp_name, salary from employee;

-- 테이블 정보 조회
DESC employee;

-- 두 테이블 조인
SELECT * FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;