-- 06_서브쿼리.sql


-- 서브쿼리란?
-- 하나의 SELECT문 안에 포함된 또 하나의 select문을 서브쿼리라고 한다.
-- 서브쿼리를 포함하고 있는 쿼리를 메인쿼리라고 부른다.
-- 비교 연산자와 사용할 때는 반드시 비교 연산자의 오른쪽에 기술해야 한다.
--   ()로 둘러쌓아야 한ㄷㅏ.


-- EX) 서브쿼리를 이용해 KING과 같은 부서에서 근무하는 사원의 모든 정보 조회하기
SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME ='KING');
SELECT * FROM EMP A, EMP B WHERE A.DEPTNO = B.DEPTNO AND B.ENAME='KING';    --JOIN 방식으로 서브쿼리와 같은 값을 출력할 수 있다.

-- 서브쿼리를 이용하여
-- 연습 1 : SMITH와 같은 부서에서 근무하는 사원의 이름과 부서번호를 조회해보세요.
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');
 SELECT B.* FROM EMP A, EMP B WHERE A.DEPTNO=B.DEPTNO AND A.ENAME='SMITH';   --JOIN방식 --여기서 A.ENAME과 B.ENAME은 다르다.
 
--연습 2 : SMITH와 동일한 직급을 가진 사원정보를 모두 출력하는 쿼리문
SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SMITH');
SELECT * FROM EMP A, EMP B WHERE B.JOB = A.JOB AND B.ENAME='SMITH';      --JOIN방식

-- 연습 3 : MARTIN의 급여와 동일하거나 더 많이 받는 사원의 이름과 급여 출력
SELECT ENAME, SAL FROM EMP WHERE SAL>=(SELECT SAL FROM EMP WHERE ENAME='MARTIN');
SELECT A.ENAME,A.SAL FROM EMP A, EMP B WHERE A.SAL>=B.SAL AND B.ENAME ='MARTIN';     --JOIN방식

-- 연습 4 : DALLAS 에서 근무하는 사원의 이름과 부서번호 출력
SELECT ENAME, EMP.DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS' );
SELECT A.ENAME, A.DEPTNO FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND B.LOC='DALLAS';       --JOIN방식


-- 여태까지는 서브쿼리의 결과가 딱 한 줄만 나오도록 사용했다.
-- 이처럼 결과가 한 줄만 나오는 서브쿼리를 단일 행(SINGLE Row) 서브쿼리라고 부른다.
-- 단일 행 서브쿼리는 그룹함수와 사용하면 더욱 안전하다.

-- 예 ) 평균 월급보다 월급을 많이 받는 사원의 정보를 조회하기
SELECT  * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

SELECT AVG(SAL) FROM EMP ;

-- 다중행(MULTI row) 서브쿼리
-- 다중행 서브쿼리는 반드시 다중 행 연산자와 함께 사용해야 한다..
-- 다중행 연산자 ( IN, ANY , ALL , EXIST ...)

-- IN : ()안의 여러 값들 중 하나라도 일치하면 참
-- EX) 월급이 3000 이상인 사원이 소속된 부서와 동일한 부서에서 근무하는 사원을 출력
SELECT ENAME , DEPTNO FROM EMP WHERE SAL>=3000; -- 내가 작성한것

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >=3000 ); -- DISTINCT : 중복제거

SELECT * FROM EMP WHERE DEPTNO IN (10,20);

-- ALL : ()안의 여러 값들을 이용한 비교가 모두 참이어야 참
-- EX) 직급이 SALESMAN인 모든 사람보다 급여를 더 많이 받는 사람을 조회하고 싶을 때
SELECT * FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');    
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');    --윗줄의 ALL과 MAX는 지금 같은 기능..

-- ANY : () 안의 여러 값들을 이용한 비교 중 하나만 만족시켜도 참
-- EX) : 직급이 SALESMAN인 사원 중 가장 적게 받는 사원보다 급여를 더 많이 받는 사람
 SELECT * FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN');    --윗줄의 ANY와 현재 MIN은 같은 기능

-- EXISTS : 서브쿼리의 결과가 존재하면 참이다.
-- EX) : 소속된 사원이 존재하는 부서정보만 출력

SELECT * FROM DEPT WHERE EXISTS (SELECT * FROM EMP WHERE EMP.DEPTNO= DEPT.DEPTNO);
SELECT * FROM DEPT WHERE NOT EXISTS (SELECT * FROM EMP WHERE EMP.DEPTNO= DEPT.DEPTNO);  --NOT EXISTS : 쿼리 정보가 존재하지 않을 때 출력


-- 연습 1 : 부서별로 가장 급여를 많이 받는 사원의 이름과 급여와 부서번호 출력 <다중 열(Multi Column) 서브쿼리>

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE (SAL, DEPTNO) IN (SELECT MAX(SAL), DEPTNO FROM EMP GROUP BY DEPTNO);   
-- 각 부서별 최대 월급으 ㄹ구하기
SELECT DEPTNO, MAX(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO;
-- 연습 1-1 : 부서별로 평균보다 많이 받는 사원의 이름과 급여와 부서번호를 출력
SELECT ename, sal, deptno FROM emp where sal > all(select avg(sal) from emp ) ORDER BY DEPTNO;  --GROUP BY deptno 해야하는지 안해야하는지..?

-- 선생님 답안 (JOIN형식)
SELECT A.ENAME, A.SAL, A.DEPTNO FROM EMP A,
(SELECT AVG(SAL) AS AVGSAL , DEPTNO FROM EMP GROUP BY DEPTNO) B 
-- 테이블 자리에 서브쿼리를 사용해 잠시 사용할 테이블(VIEW) 생성 : INLINE-VIEW
WHERE B.DEPTNO=A.DEPTNO AND A.SAL > B.AVGSAL;

-- 연습 2 : 30번 부서 소속의 모든 사원들보다 급여를 더 많이 받는 사원의 정보를 출력
SELECT * FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO =30);
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO =30);

-- 연습 3 : 모든 SALESMAN들 중 적어도 한명의 급여와 보너스를 합친 금액보다 급여를 더 많이 받는 사원의 정보를 출력
SELECT * FROM EMP WHERE SAL > ANY (SELECT SAL+NVL(COMM, 0) FROM EMP WHERE JOB='SALESMAN') ORDER BY ENAME;
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL+COMM) FROM EMP WHERE JOB = 'SALESMAN') ORDER BY ENAME;


-- 연습문제 2,3번 모두 MAX,MIN으로 바꿀 수 있는지?
SELECT ENAME, SAL+COMM, SAL,COMM FROM EMP WHERE JOB='SALESMAN';
