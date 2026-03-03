-- decode 함수
-- 1 hr 2 sales 3 it 4 marketing
SELECT emp_id
     , emp_name
     , dept_id
     , salary
     , decode(dept_id
            , 1, salary * 1.5
            , 2, salary * 1.1
            , 3, salary * 1.8
            , 4, salary * 1.0) AS bonus
 FROM EMPLOYEE;


-- case문 decode가 함수라면, case는 if와 같은 구문
-- decode는 오라클 함수, 다른 db에서는 case문 사용해야 한다.
SELECT emp_id
     , emp_name
     , dept_id
     , salary
     , CASE dept_id
        WHEN 1 THEN salary * 1.5
        WHEN 2 THEN salary * 1.1
        WHEN 3 THEN salary * 1.8
        WHEN 4 THEN salary * 1.0
       END AS bonus
 FROM EMPLOYEE;