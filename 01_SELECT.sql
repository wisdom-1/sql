-- 01_SELECT.sql

/*
세로로 보면 컬럼, 가로로 보면 row

    음식 테이블
        음식명     칼로리     가격      인기도     양       원산지     <- 컬럼명
        떡볶이     500     3000        9/10      9/10     한국           
        튀김   
    
    음식 후기 테이블
        음식명     점수      내용
        떡볶이     10.0     넘 맛있어요ㅜ
        튀김       10         엄마가 해준거 같아요
*/




--SELECT문 : 데이터를 조회할 때 사용하는 쿼리문
--SELECT 컬럼명 FROM 테이블명;
-- 컬럼명 : 표에 있는 '열' 의 대표 이름


--  현재 계정이 가지고 있는 테이블 확인하기
SELECT * FROM TAB;  --현재 SCOTT이 가지고 있는 테이블 이름 BONUS, DEPT, EMP, SALGRADE
SELECT * FROM TABS;

-- 테이블의 구조를 살펴보기
DESC EMP;
/*
EMP 테이블 구조
    EMPNO : 사원번호
    ENAME : 사원명
    JOB   : 직급
    MGR   : 해당 직원 상사(Manager) 의 사원번호
    HIREDATE : 입사일
    SAL   : 월급
    COMM  : 보너스
    DEPTNO : 직원이 속한 부서 번호
    
     NOT NULL : 해당 컬럼에는 빈 값(NULL)이 허용되지 않는다.
     
     NUMBER(4) : 정수 4자리를 저장할 수 있는 컬럼
     DATE      :  날짜 데이터를 저장할 수 있는 컬럼
     NUMBER (7,2)  : 7자리 실수이고, 소수점 2자리 를 저장할 수 있는 컬럼
     VARCHAR2(10) : 문자열 최대길이 10을 저장할 수 있는 컬럼
     

*/

-- 테이블 확인하기
-- 컬럼명 : 표의 제목에 해당하는 것, *를 사용하면 테이블 내의 모든 컬럼을 뜻한다.
SELECT * FROM EMP;
SELECT * FROM dept;
SELECT * FROM EMP;


--컬럼명 : 표의 제목에 해당하는 것
SELECT ENAME, JOB FROM EMP;
select empno, ename, sal from emp;



-- 1. 사원의 모든 정보를 출력하는 쿼리문을 작성해보세요.

SELECT * FROM EMP;

-- 2. 사원의 이름과 급여와 입사일자만 출력하는 SQL 문(쿼리문)을 작성해보세요

SELECT ENAME, SAL, HIREDATE FROM EMP;


-- SELECT 하면서 산술 연산자 사용하기

SELECT SAL + 1000 FROM EMP;
SELECT SAL - 1000 FROM EMP;
SELECT SAL * 2 FROM EMP;
SELECT SAL / 2 FROM EMP;

--급여로 연봉 구하기 (AS로 별칭을 지정)

SELECT SAL *12 AS 연봉 FROM EMP;

-- 보너스 계산하기

SELECT ENAME, SAL + COMM AS 보너스 포함 FROM EMP;
--숫자와 NULL 값을 계산하면 NULL이 된다. (숫자 0과 NULL은 실제로 다르기 때문이다. ) (NULL은 ?같은 알 수 없는 값을 의미한다.)

-- NULL값이 나올 수 있는 컬럼으로 계산하기
SELECT ENAME, SAL + NVL(COMM, -100) AS "보 너 스" FROM EMP;

--문법적인 것 : 대문자, 문법적이지 않은것 : 소문자 (권장사항)
SELECT ename AS 사원명, sal + NVL(COMM, 0) AS "월급(보너스)" FROM emp;

-- DB의 대소문자 구분 여부
-- 쿼리문 : 대소문자 구분 X, SELECT랑 select  상관없음
-- 컬럼명 : 대소문자 구분 X, COMM, comm, ENAME, eName 상관없음
-- --------------------
-- 데이터는 대소문자 구분함!!!

-- DISTINCT : 중복되는 것을 한 번씩만 출력하는 키워드

SELECT DISTINCT JOB AS 직급 FROM EMP;       -- 어떤 직업이 있는지

SELECT DISTINCT DEPTNO AS 부서번호 FROM EMP;    --어떤 부서번호가 있는지

SELECT DISTINCT NVL(MGR, 0) AS 매니저 FROM EMP;    -- EMP 안에 어떤 매니저가 있는지





SELECT * FROM EMP;










