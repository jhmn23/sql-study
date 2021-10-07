-- 조인(JOIN)

-- on을 사용한 기본 조인
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서이름
FROM employees e JOIN departments d
    ON e.department_id = d.department_id;
    
-- where 절을 이용한 예전 조인방법
SELECT e.employee_id 직원번호, e.last_name 이름, e.department_id 부서번호, d.department_name 부서이름
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 3개 테이블 (직원 부서 로케이션) 조인하기
SELECT e.employee_id 직원번호, d.department_name 부서이름, l.city 도시
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

-- 예제)
SELECT department_name 부서명, city 시티명, country_name 국가명
FROM countries c
JOIN locations l ON l.country_id = c.country_id
JOIN departments d ON l.location_id = d.location_id
WHERE l.city IN('Seattle','London') AND c.country_name LIKE 'United%';


-- 자체 조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e JOIN employees m ON e.manager_id = m.employee_id;


-- 외부 조인
-- 기본 조인
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employees WHERE department_id is NULL; -- 부서번호가 null인 직원

-- LEFT 외부 조인 : 직원 테이블 중에 부서가 없는 직원도 출력
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- RIGHT 외부 조인 : 부서 테이블에 있지만 직원 테이블에서 사용하지 않는 부서도 전부 출력
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- FULL 외부 조인 : 조건에 맞지 않는 모든 데이터 줄을 출력
SELECT e.last_name 이름, d.department_id 부서번호, d.department_name 부서명
FROM employees e 
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

-- 예제)
SELECT c.country_name 국가, c.country_id 국가번호, l.location_id 지역번호, l.city 도시
FROM countries c
JOIN locations l
ON c.country_id = l.country_id
ORDER BY 지역번호 DESC;


-- 교차 조인 예제)
SELECT c.country_name 국가, r.region_name 지역이름
FROM countries c
CROSS JOIN regions r;