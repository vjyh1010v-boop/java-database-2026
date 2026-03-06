-- USER_OBJECTS, USER_RULES, USER_TABLES, USER_INDEXES, USER_VIEWS

-- 인덱스 생성
-- IDX(인덱스 접두어)_테이블_인덱스컬럼
CREATE INDEX IDX_EMP_SALALTER
	ON EMP(SAL);

-- 인덱스 삭제
DROP INDEX IDX_EMP_SAL;

-- 뷰
CREATE VIEW VW_EMP20
	AS (SELECT EMPNO, ENAME, JOB, DEPTNO
		  FROM EMP
		 WHERE DEPTNO = 20);

SELECT * FROM VW_EMP20;

-- 삭제
DROP VIEW VW_EMP20;

SELECT *
  FROM VW_EMP20 V, DEPT D
 WHERE V.DEPTNO = D.DEPTNO;



-- 중간에 필기 못한거 나중에 하기

-- 시퀀스
-- 생성
CREATE SEQUENCE SEQ_BOARD
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;

-- 게시판 테이블 생성
CREATE TAbLE boardtbl (
   board_id     number(7) PRIMARY KEY,
   title		varchar2(200) NOT NULL,
   writer 		varchar2(50)  NOT NULL,
   contents		varchar2(4000),
   regdate		DATE DEFAULT sysdate
);

-- 게시판 데이터 입력
INSERT INTO BOARDTBL 
(board_id, title, writer, contents)
VALUES
(seq_board.nextval, '테스트 제목', '홍길동', '내용입니다.');

INSERT INTO BOARDTBL 
(board_id, title, writer, contents)
VALUES
(seq_board.nextval, '테스트2 제목', '홍길동', '새 내용입니다.');

INSERT INTO BOARDTBL 
(board_id, title, writer, contents)
VALUES
(seq_board.nextval, '테스트3 제목', '유고성', '누구냐 넌~');

COMMIT;

SELECT * FROM boardtbl;

-- 다음 시퀀스 확인
SELECT seq_board.nextval FROM dual;

-- 현재 시퀀스 확인
SELECT seq_board.currval FROM dual;