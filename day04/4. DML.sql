-- DML

-- DEPT 테이블 복사 DEPT_TEMP 만들기
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;  -- 테이블 새로고침해주기
    
-- 조회
SELECT * FROM DEPT_TEMP;
    
-- marketing 추가
INSERT INTO dept_temp(deptno, dname, loc)
VALUES (50, 'MARKETING', 'SEOUL');
    
-- 에러 -- 컬럼갯수와 데이터갯수 불일치
INSERT INTO dept_temp(deptno, dname, loc)
VALUES (50, 'STOCK');

-- 에러 -- 컬럼의 데이터타입과 데이터형이 불일치
INSERT INTO dept_temp(deptno, dname, loc)
VALUES ('SEVEN', 'STOCK','BUSAN');

-- 이건들어가요
INSERT INTO dept_temp (deptno, dname)
VALUES (60, 'STOCK');

INSERT INTO dept_temp (deptno, dname, loc)
VALUES (70, 'TEST', NULL);


-- EMP를 복사해서 EMP_TEMP 생성
CREATE TABLE emp_temp
    AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP;

-- EMP_TEMP 모든 데이터 삭제
DELETE FROM EMP_TEMP;