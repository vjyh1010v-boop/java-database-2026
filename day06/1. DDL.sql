-- DDL - CREATE
CREATE TABLE DEPT_DDL (
	DEPTNO NUMBER(2),
	DNAME VARCHAR2(14),
	LOC	  VARCHAR2(13)
	);

-- DROP
DROP TABLE DEPT_DDL;

-- DDL용 테이블 복사
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

-- ALTER  - 테이블 변경(컬럼명 변경, 컬럼 추가, 컬럼 삭제 ...)
ALTER TABLE EMP_ALTER
  ADD PHONE VARCHAR2(20); -- 여러 번 엔터 금지.
  
-- ALTER 여러 컬럼 추가
ALTER TABLE EMP_ALTER
  ADD (
      FAX VARCHAR2(20)
      email VARCHAR2(100),
      address VARCHAR2(200)
); -- 왜 안되지 ㅠ

-- alter 컬럼(열)이름 변경
ALTER TABLE emp_alter
  RENAME COLUMN phone TO tel;ALTER 
 
-- alter 컬럼(열) 자료형 변경
ALTER TABLE emp_alter
  MODIFY empno number(8);

-- alter 특정컬럼 삭제
ALTER TABLE emp_alter
 DROP COLUMN fax; -- 실행x
 
-- 여러컬럼 삭제시는 COLUMN 키워드 대신 소괄호 사용
ALTER TABLE emp_alter
 DROP (
    email, address
);

-- RENAAME 객체이름 변경
RENAME EMP_ALTER TO EMP_RENAME;

-- TRUNCATE 객체 중 테이블 데이터 초기화(완전삭제)
-- COMMIT, ROLLBACK 안됨(트랜잭션 불가)
SELECT * FROM EMP_RENAME;

TRUNCATE TABLE EMP_RENAME;