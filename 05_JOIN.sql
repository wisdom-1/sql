-- 05_JOIN.sql

-- JOIN : 관계를 맺은 두 테이블을 엮어서 원하는 정보를 조회하는 것

SELECT * FROM EMP; -- 사원정보 테이블
SELECT * FROM DEPT; --EMP테이블의 부서번호를 기준으로 정렬한 부서 정보 TABLE (몇번부서/부서이름/지역)


-- CROSS JOIN : 두 테이블의 모든 경우의 수를 조회하는 JOIN
SELECT * FROM EMP, DEPT;

SELECT ENAME, EMP.DEPTNO, DEPT.DEPTNO, DNAME FROM EMP, DEPT;
-- 컬럼명이 겹치는 경우 어느 테이블의 컬ㅓㅁ명인지 명확하게 적어줘야 한다ㅏ.

-- CROSS JOIN은 의미있는 데이터를 찾기 전의 과정이다.
-- CROSS JOIN만으로는 아무런 의미가 없다.
-- JOIN 결과가 의미를 가지기 위해서는 CROSS JOIN의 결과에 조건을 지정해야 한다.

-- EQUI JOIN : 동일 컬럼을 기준으로 JOIN한다.
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

-- EX: 이름이 MARTIN인 사람의 이름/부서명을 조회하고 싶을 때
SELECT EMP.ENAME,DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.ENAME='MARTIN';

-- 연습1 : 뉴욕에 근무하는 사원의 이름과 급여를 조회
SELECT ENAME, SAL FROM EMP,DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.LOC = 'NEW YORK';

-- 연습2 : SALES 부서 소속인 사원들의 이름과 입사일을 조회해보세요
SELECT EMP.ENAME, EMP.HIREDATE FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND DNAME='SALES';

--  연습3 : 직급이 MANAGER인 사원의 이름/부서번호/부서명/지역을 조회해보세요
SELECT ENAME, D.DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.JOB='MANAGER';      -- EMP E, DEPT D -> 테이블명에 별칭을 부여할 수 있다.

-- NON-EQUI JOIN : 값이 동일하지 않은 컬럼으로 두 테이블을 JOIN 한다.
SELECT * FROM SALGRADE;

SELECT * FROM EMP, SALGRADE;
SELECT * FROM EMP, SALGRADE WHERE EMP.SAL BETWEEN LOSAL AND HISAL;

SELECT EMP.*, G.GRADE FROM EMP, SALGRADE G WHERE EMP.SAL BETWEEN LOSAL AND HISAL; 

-- SELF JOIN : 테이블 하나로 조인하는 것 (자기 자신과 JOIN)

-- EX: 사원들의 정보와 매니저 이름을 함께 조회하기
SELECT A.* , B.* FROM EMP A, EMP B;
-- A의 매니저 번호와 B의 직원번호가 일치한다면 B는 A의 매니저다.
SELECT A.*, B.ENAME FROM EMP A, EMP B WHERE A.MGR=B.EMPNO;

-- 연습1 : 매니저가 KING인 사원들의 이름과 직급을 출력해보세요.
-- SELECT A.ENAME , B.JOB FROM EMP A, EMP B WHERE A.JOB = 'MANAGER'AND B.ENAME='KING'  ;
SELECT B.ENAME , A.JOB FROM EMP A, EMP B WHERE A.MGR = B.EMPNO AND B.ENAME='KING';

-- 연습2 : ALLEN과 동일한 근무지(DEPTNO) 에서 근무하는 사원의 이름을 출력해보세요.
SELECT * FROM EMP A, EMP B WHERE B.ENAME ='ALLEN' AND B.DEPTNO=A.DEPTNO AND A.ENAME<>'ALLEN';   --AND A.ENAME<>'ALLEN' 은 앞부분에 뜨는 ALLEN을 빼준다.

-- OUTER JOIN : 조건을 만족시키지 못해 (NULL 때문에) 조회되지 않는 정보도 함께 조회하고 싶은 경우에 사용하는 조인
SELECT * FROM EMP A, EMP B WHERE A.MGR=B.EMPNO; -- KING은 MGR 번호가 NULL 이라 출력이 안됨.
 
 -- JOIN 조건을 한번도 만족시키지 못해서 등장하지 못한 행을 (+)를 붙인 쪽에 NULL을 붙여서라도 보여준다.
 SELECT * FROM EMP A, EMP B WHERE A.MGR=B.EMPNO(+); -- 매니저가 없어서 조회되지 못한 행에 NULL로 매니저를 추가해서 조회
 SELECT * FROM EMP A, EMP B WHERE A.MGR(+) = B.EMPNO;   -- 관리하는 사원이 없어서 조회되지 못한 행에 NULL로 관리하는 사원을 추가해서 보여줌
 -- (+) : 어느 쪽 테이블에 NULL을 추가해서 조회할 것인지를 조회한다.
--보려하는 테이블의 반대쪽에 +를 붙인다.

-- 연습 : EMP 테이블과 DEPT 테이블을 조인하여 사원명/부서번호/부서명 을 출력하고 사원이 한명도 존재하지 않는 부서의 정보도 출력되도록 쿼리를 작성해보세요.
SELECT ENAME , A.DEPTNO, B.DNAME , B.* FROM EMP A, DEPT B WHERE A.DEPTNO(+) = B.DEPTNO;

-- 부서가 존재하지 않ㄴ는 사원도 출력하고 싶다.
SELECT ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO(+);

-- 미국 표준에 따른 각 JOIN 사용법

-- 1. CROSS JOIN
SELECT * FROM EMP, DEPT;
SELECT * FROM EMP CROSS JOIN DEPT; --ANSI

-- 2. INNER JOIN (EQUI, SELF, NON-EQUI JOIN)
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;    -- ON : 어떤 컬럼을 써서 JOIN 할거냐.
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO; --ANSI
SELECT * FROM EMP INNER JOIN DEPT USING (DEPTNO);   --ANSI

SELECT * FROM EMP A INNER JOIN EMP B ON A.MGR = B.EMPNO; --ANSI SELF
SELECT * FROM EMP INNER JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL;   --ANSI NON-EQUI


-- 3. NATURAL JOIN (동일한 이름의 컬럼으로 INNER JOIN을 하는 경우)
SELECT * FROM EMP NATURAL JOIN DEPT;

-- 4. OUTER JOIN [LEFT | RIGHT|FULL]
-- 조건에 맞지 않는 행도 보여주는 JOIN

-- 오른쪽 테이블에서 안나온 정보를 왼쪽 테이블에서 (+) 해서 보고싶을 때
 SELECT * FROM EMP RIGHT OUTER JOIN DEPT USING (DEPTNO);
-- LEFT OUTER JOIN : 왼쪽 테이블에서 안나온 정보를 오른쪽 테이블에 (+) 해서 보고싶을 때
 SELECT * FROM DEPT LEFT OUTER JOIN EMP USING (DEPTNO);
 
 --FULL OUTER JOIN : 양쪽에 (+) 를 다 붙인 경우
 SELECT * FROM EMP FULL OUTER JOIN DEPT USING (DEPTNO);
 

 -- INNER JOIN : 조건이 맞는 결과만 보겠다.
 SELECT * FROM EMP A INNER JOIN EMP B ON A.MGR= B.EMPNO;
 
 -- OUTER JOIN : 조건이 맞지 않는 결과도 보겠다.
 SELECT * FROM EMP A FULL OUTER JOIN EMP B ON A.MGR= B.EMPNO;
 SELECT * FROM EMP A LEFT OUTER JOIN EMP B ON A.MGR= B.EMPNO;


