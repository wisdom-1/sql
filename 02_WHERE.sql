
-- 02_WHERE.sql

-- WHERE절 : 데이터를 조회할 때 조건을 지정할 수 있다.
-- SELECT 컬럼 FROM 테이블 WHERE  조건;
/*
    = : 같다
    !=, <>, ^= : 다르다
    >,<, >=, <= : 비교

*/


SELECT * FROM EMP;
SELECT * FROM EMP WHERE SAL =1600;

--월급이 1600이 아닌 직원 조회
SELECT * FROM EMP WHERE SAL!=1600;
SELECT * FROM EMP WHERE SAL<>1600;
SELECT * FROM EMP WHERE SAL^=1600;

-- 월급이 1600 이상, 이하인 직원 조회
SELECT * FROM EMP WHERE SAL>=1600;
SELECT * FROM EMP WHERE SAL<=1600;

-- 문자 혹은 날짜 데이터도 크기 비교가 가능하다.
SELECT * FROM EMP WHERE ENAME >= 'S';
SELECT * FROM EMP WHERE HIREDATE < '81/05/05';  -- 날짜 크기가 더 작다는 것 ==오래됐다.
SELECT * FROM EMP WHERE HIREDATE >= '81/05/05'; -- 날짜 크기가 더 크다는 것 == 최신이다.

-- 연습문제 : 급여가 1500 이하인 사원의 사원번호/사원이름/급여를 출력해보세요.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL <=1500;

-- 연습문제 : 사원이름이 'MARTIN'인 사원의 사원번호/이름/급여 를 출력해보세요.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE ENAME = 'MARTIN';

-- AND, OR , NOT
SELECT * FROM EMP WHERE SAL >=1500 AND JOB = 'SALESMAN';
-- 10번 부서에 속하지 않은 사람. NOT을 쓸 땐 WHRER 뒤에 쓴다.
SELECT * FROM EMP WHERE NOT DEPTNO =10;

-- COLUMN BETWEEN A AND B
-- 급여가 2천 이상이고 3천 이하인 사원을 조회
SELECT * FROM EMP WHERE SAL >=2000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- 이름이 'A'보다 크고 'D'보다 작은 사원들을 조회
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'D';

-- IN (A , B, C, ...)  : IN 연산자 : OR 연산자와 기능이 같다.
-- 급여가 800 이거나 1600 이거나 2850 인 사원을 조회
SELECT * FROM EMP WHERE SAL= 800 OR SAL=1600 OR SAL=2850;
SELECT * FROM EMP WHERE SAL IN (800, 1600, 2850);

-- 연습문제 : 사원번호가 7521 이거나 7654 이거나 7844인 사원들의 사원번호/이름/고용일 조회
SELECT EMPNO, ENAME , HIREDATE FROM EMP WHERE EMPNO IN (7521, 7654, 7844);

-- 연습문제 : 사원번호가 7521도 아니고 7654도 아니고 7844도 아닌 사원들을 조회
SELECT ENAME  FROM EMP WHERE NOT EMPNO IN (7521, 7654, 7844);
SELECT ENAME  FROM EMP WHERE EMPNO NOT IN (7521, 7654, 7844);
SELECT ENAME  FROM EMP WHERE EMPNO !=7521 AND EMPNO != 7654 AND EMPNO != 7844;
-- LIKE 연산자와 와잉ㄹ드 카드
--      _: 하나의 문자가 아무  문자나 와도 됨
--      % : 하나 이상의 문자가 비어있어도 되고, 아무 문자나 와도 됨

-- 이름에 E가 포함되는 사원을 조회
SELECT * FROM EMP WHERE ENAME LIKE '%E%';

-- 뒤에서 두번째 글자가 E인 사원을 조회
SELECT * FROM EMP WHERE ENAME LIKE '%E_' ;

-- 앞에서 두번째 글자가 L인 사원을 조회
SELECT * FROM EMP WHERE ENAME LIKE '_L%' ;

-- 앞에서 세번째 글자가 L인 사원을 조회
SELECT * FROM EMP WHERE ENAME LIKE '__L%' ;

-- 연습문제 : 이름이 K로 시작하는 사원의 사원ㄴ번호, 사원이름으 ㄹ조회해보세요.
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE 'K%';
-- 이름에 K 가 포함되는 사원
SELECT EMPNO , ENAME FROM EMP WHERE ENAME LIKE '%K%';

-- 이름이 K로 끝나는 사원
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%K';

-- 이름에 K가 포함되지 않은 사원 (NOT의 위치 두 군데 가능)
SELECT EMPNO , ENAME FROM EMP WHERE NOT ENAME LIKE '%K%';
SELECT EMPNO , ENAME FROM EMP WHERE ENAME NOT LIKE '%K%';


-- COMM이 NULL인 사원을 조회
SELECT * FROM EMP WHERE COMM=NULL;  -- 실제 목록에는 NULL이 있는데 지금 출력값에는 안나온다.
--NULL은 비교연산자로 비교가 불가능하다.
SELECT * FROM EMP WHERE COMM IS NULL;       -- IS NULL 로 쓰면 출력된다.

-- COMM이 NULL이 아닌 사원을 조회
SELECT * FROM EMP WHERE  COMM IS NOT NULL;
SELECT * FROM EMP WHERE NOT COMM IS NOT NULL;

-- 매니저가 없는 사람을 조회
SELECT * FROM EMP WHERE MGR IS NULL;

SELECT * FROM EMP;


