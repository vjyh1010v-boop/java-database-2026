-- 1.번 답 -
SELECT e.emp_name
     , d.dept_name
FROM emp e
INNER JOIN dept d
   ON e.dept_id = d.dept_id;

-- 2.번 답 - 
SELECT e.emp_name
     , e.salary
FROM emp e
INNER JOIN dept d
   ON e.dept_id = d.dept_id
WHERE d.dept_name = 'DEV';

-- 3.번 답 - 
SELECT dept_id
     , COUNT(emp_id) AS emp_count
FROM emp
GROUP BY dept_id
ORDER BY dept_id;

-- 4.번 답 -
SELECT emp_name
     , salary
FROM emp
WHERE salary > (SELECT AVG(salary) FROM emp);

-- 5.번 답 - 
