-- DDL 테이블 생성, 수정, 삭제

-- 테이블 생성
CREATE TABLE 테스트 (
    문자열 VARCHAR2(100),
    숫자   NUMBER,
    날짜   DATE DEFAULT sysdate
);

DESC 테스트;
SELECT * FROM 테스트;
-- 데이터 입력
INSERT INTO 테스트 VALUES ('HTML', 5, '2021-10-08');
INSERT INTO 테스트 VALUES ('CSS', 3, sysdate);
INSERT INTO 테스트(문자열, 숫자) VALUES ('JAVA', 7);


-- 테이블 삭제
DROP TABLE 테스트;


-- 기존 테이블 복사해서 만드는 방법

-- 열 구조만 복사
CREATE TABLE EMP_TEMP
AS
SELECT * FROM employees WHERE 1 <> 1;

SELECT * FROM EMP_TEMP;
DESC emp_temp;

-- 80번 부서의 직원들만 따로 테이블 생성(복사)
CREATE TABLE EMP80
AS
SELECT employee_id 직원번호, last_name 이름, salary 월급, salary*12 연봉, hire_date 고용일 
FROM employees WHERE department_id = 80;

DESC emp80;
SELECT * FROM emp80;

-- 예제)
CREATE TABLE stmans (id, job, sal)
AS
SELECT employee_id, job_id, salary
FROM employees WHERE job_id LIKE 'ST_MAN';
/* =
CREATE TABLE stmans
AS
SELECT employee_id ID, job_id JOB, salary SAL
FROM employees WHERE job_id LIKE 'ST_MAN'; */
SELECT * FROM stmans;