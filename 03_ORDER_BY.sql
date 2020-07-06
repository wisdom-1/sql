 -- 03_ORDER_BY.sql
 
 -- ORDER BY절 : SELECT 의 결과를 원하는 컬럼의 기준으로 정렬할 수 있다.
 --       ASC : ASCENDING, 오름차순, 작은값이 먼저 나온다.
 --       DESC : DESCENDING, 내림차순, 큰 값이 먼저 나온다.
 
 --자료구조 시간에 배운 알고리즘 적용
 
 --          오름차순           /       내림차순
 -- 날짜   더 오래된 정보가 먼저 /     최신 정보가 먼저 (최근 날짜)
 -- 숫자      작은 값          /         큰 값
 -- 문자      A TO Z          /        Z TO A
 -- NULL    가장 마지막에 나옴  /       가장 먼저 나옴
 
 
 -- ASC는 생략이 가능하다. (ORDER BY 의 기본값은 ASC다. 오름차순)
 SELECT * FROM EMP ORDER BY COMM ASC;   -- 오름차순
 SELECT * FROM EMP ORDER BY COMM DESC;  -- 내림차순
 
 SELECT * FROM EMP ORDER BY HIREDATE ASC;   -- 입사일 오름차순 정렬
 SELECT * FROM EMP ORDER BY ENAME DESC;     -- 사원 이름 내림차순 정렬
 SELECT * FROM EMP ORDER BY SAL ASC;        -- 월급 오름차순 정렬
 
 
 -- 정렬 기준을 여러개 두기
 -- ex) 부서 번호 기준으로 먼저 정렬한 뒤, 같은 부서 사람들은 이름 순으로 정렬하기.
 SELECT * FROM EMP ORDER BY DEPTNO ASC, ENAME ASC;      -- 정렬 순서 : 부서 -> 이름 
 
 -- 연습 문제 : 사원번호 /사원이름/직급/입사일을 최근 입사한 순서대로 출력해보세요
 SELECT EMPNO,ENAME,JOB,HIREDATE FROM EMP ORDER BY HIREDATE;
 -- 연습문제 : 모든 사원 정보를 직급 기준 오름차순으로 출력하되, 같은 직급인 경우 월급을 많이 받는 순으로 정렬하여 출력하세요.
 SELECT * FROM EMP ORDER BY JOB, SAL DESC;
 
 
 
 SELECT * FROM EMP;



