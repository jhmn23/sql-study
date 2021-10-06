--1
SELECT empno, ename, sal
FROM emp
WHERE deptno = '10';

--2
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = '7369';

--3
SELECT *
FROM emp
WHERE ename LIKE 'ALLEN';

--4
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';

--5
SELECT *
FROM emp
WHERE job NOT LIKE 'MANAGER'; -- !=, <>

--6
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

--7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

--8
SELECT *
FROM emp
WHERE deptno >= '20';

--9
SELECT *
FROM emp
WHERE ename >= 'L%';

--10
SELECT *
FROM emp
WHERE hiredate < '81/12/09';



--11
SELECT empno, ename
FROM emp
WHERE empno <= '7698';

--12
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--13
SELECT ename, job, sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999;

--14
SELECT *
FROM emp
WHERE empno NOT BETWEEN '7654' AND '7782';

--15
SELECT *
FROM emp
WHERE ename BETWEEN 'B%' AND 'J%';

--16
SELECT *
FROM emp
WHERE hiredate NOT LIKE '81%';
--             NOT BETWEEN '81/01/01' AND '81/12/31';
--17
SELECT *
FROM emp
WHERE job IN ('MANAGER', 'SALESMAN');

--18
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN ('20', '30');
-- deptno != 20 AND deptno <> 30;
--19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--20
SELECT *
FROM emp
WHERE hiredate LIKE '81%';
-- WHERE hiredate BETWEEN '1981-01-01' AND '1981-12-31';

--21
SELECT *
FROM emp
WHERE ename LIKE '%S%';

--22
SELECT *
FROM emp
WHERE ename LIKE 'M____N';
--WHERE ename LIKE 'M%' AND ename LIKE '%N';

--23
SELECT *
FROM emp
WHERE ename LIKE '_A%';

--24
SELECT *
FROM emp
WHERE comm IS NULL;

--25
SELECT *
FROM emp
WHERE comm IS NOT NULL;

--26
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 AND sal >= 1500;

--27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno = 30;

--28
SELECT *
FROM emp
WHERE (sal >= 1500 AND deptno = 30) AND job LIKE 'MANAGER';

--29
SELECT *
FROM emp
WHERE deptno LIKE 30
ORDER BY empno;

--30
SELECT *
FROM emp
ORDER BY sal DESC;

--31
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

--32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC;

--33
SELECT ename, sal, ROUND(sal*0.13) bonus, deptno
FROM emp
WHERE deptno = 10;

--34
SELECT ename, sal, NVL(comm, 0), sal + NVL(comm, 0) total
FROM emp
ORDER BY total DESC;

--35
SELECT ename, sal, TO_CHAR(ROUND((sal*0.15), 1), '$999.9') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000;


--36
SELECT d.dname, count(e.empno)
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING count(e.empno) > 5;

--37
SELECT job, SUM(sal) 급여합계
FROM emp
WHERE job NOT LIKE 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;

--38
SELECT empno, ename, sal, grade
FROM emp e 
JOIN salgrade s 
ON sal BETWEEN losal AND hisal;

--39
SELECT deptno, count(empno) 사원수, NVL(count(comm), 0) 커미션받은사원수
FROM emp
GROUP BY deptno;

--40
SELECT ename, deptno,
    DECODE (deptno, 10, '총무부',
                    20, '개발부',
                    30, '영업부') 부서명 
/* = CASE WHEN deptno = 10 THEN '총무부'
          WHEN deptno = 20 THEN '개발부'
          WHEN deptno = 30 THEN '영업부' 
          END "부서명" */
FROM emp;