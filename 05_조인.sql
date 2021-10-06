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