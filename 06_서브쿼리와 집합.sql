-- 서브쿼리


-- Popp 직원보다 고용일이 최근(이후)에 고용한 사람
-- 주의점 : 단일행 서브쿼리를 사용할 때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야 한다
SELECT last_name 이름, hire_date 고용날짜
FROM employees
WHERE hire_date > ( SELECT hire_date FROM employees WHERE last_name = 'Popp');

-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = ( SELECT min(salary) FROM employees );

-- 예제 1,2,3,4)
SELECT last_name 이름, salary 급여
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name LIKE 'Abel');

SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE last_name LIKE 'Bull')
AND salary > ( SELECt salary FROM employees WHERE last_name LIKE 'Bull');

SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name LIKE 'Russell');

SELECT *
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title LIKE 'Stock Manager');


-- 다중행 서브쿼리 (서브쿼리 결과가 여러개의 행으로 출력)

SELECT MIN(salary) FROM employees GROUP BY department_id; -- 부서별 최저월급

-- 다중행 서브쿼리에서는 바로 = >< 비교를 할 수 없음
-- IN 은 값이 하나라도 같으면 검색됨
SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN ( SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANY 도 값이 하나라도 맞으면 검색됨
SELECT department_id, last_name, salary
FROM employees
WHERE salary < ANY ( SELECT salary FROM employees WHERE job_id = 'IT_PROG')
    AND job_id != 'IT_PROG'
    ORDER BY salary DESC;
    
-- ALL 은 값이 전부 다 만족 해야 된다.
SELECT department_id, last_name, salary
FROM employees
WHERE salary < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG')
    AND job_id != 'IT_PROG'
    ORDER BY salary DESC;
    
-- 예제 1)
SELECT employee_id, first_name, job_id 직종, salary 급여
FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees WHERE department_id = 20)
    AND department_id != 20;
    
-- 예제 2)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id LIKE 'ST_MAN');

-- 예제 3)
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id LIKE 'IT_PROG');


-- 다중열 서브쿼리 ( 열이 여러개일때 )
-- 이름이 브루스인 직원과 같은 매니저, 같은 직업인 직원들을 출력
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id FROM employees WHERE first_name = 'Bruce')
    AND first_name != 'Bruce';
    
-- 부서별 최소 급여를 받는 직원들을 검색
SELECT department_id 부서번호, employee_id 사원번호, first_name, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
                                  FROM employees
                                  GROUP BY department_id)
ORDER BY department_id;

-- 예제)
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, MIN(salary) FROM employees GROUP BY job_id)
ORDER BY salary DESC;


-- 집합
-- UNION 합집합 : 중복을 제거한다.
SELECT employee_id 직원번호, job_id 직종 FROM employees
UNION
SELECT employee_id, job_id FROM job_history;

-- UNION ALL 합집합 : 두 개 셀렉트문의 결과를 합친다.
SELECT employee_id 직원번호, job_id 직종 FROM employees
UNION ALL
SELECT employee_id, job_id FROM job_history;

-- INTERSECT 교집합 (2)
SELECT employee_id 직원번호, job_id 직종 FROM employees
INTERSECT
SELECT employee_id, job_id FROM job_history;

-- MINUS 차집합 ( 결과 줄 수 105 = 107 - 2 )
SELECT employee_id 직원번호, job_id 직종 FROM employees
MINUS
SELECT employee_id, job_id FROM job_history;

-- 예제 1,2,3,4)
SELECT department_id FROM employees
UNION
SELECT department_id FROM departments;

SELECT department_id FROM employees
UNION ALL
SELECT department_id FROM departments;

SELECT department_id FROM employees
INTERSECT
SELECT department_id FROM departments;

SELECT department_id FROM departments
MINUS
SELECT department_id FROM employees;


