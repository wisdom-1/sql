-- 08_DML.sql

-- DDL (Data Definition Language) : 테이블 생성/수정/삭제

-- DML (Data Manipulation Language) : 데이터 생성/수정/삭제/조회

-- CRUD : 모든 프로그램에 존재하는 필수적인 기능
-- Create : 데이터 생성 (INSERT)
-- Read   : 데이터 조회 (SELECT)
-- Update : 데이터 수정 (UPDATE)
-- Delete : 데이터 삭제 (DELETE)

--  INSERT : 테이블에 새로운 데이터 생성 (추가, 삽입)

-- INSERT INTO 테이블명 (컬럼1, 컬럼2, ...) VALUES (값1, 값2, ...);

SELECT * FROM MY_MEMBER;
INSERT INTO MY_MEMBER (MEMNO, MEM_NAME, MEM_AGE, JOIN_DATE) VALUES (1,'홍길동', 10, '20/07/02');

-- 컬럼의 순서가 바뀌면 VALUES의 순서도 바꿔서 넣어야 한다.
INSERT INTO MY_MEMBER (MEM_NAME, MEM_AGE, JOIN_DATE, MEMNO) VALUES ('테스트', 13,'19/05/04', 2);
-- 모든 컬럼을 순서대로 추가할 때는 컬럼명을 생략해도 된다.
INSERT INTO MY_MEMBER VALUES (3, '테스트2', 15, '20/05/05');

-- NOT NULL로 설정된 컬럼이 아니라면 값을 넣지 않을 수도 있다.
--(컬럼의 개수와 VALUES의 개수가 차이나면 에러가 발생한다.)
INSERT INTO MY_MEMBER(MEMNO, MEM_NAME) VALUES (4, '테스트3'); -- 누락된 컬럼은 자동으로 NULL이 대입된다.

INSERT INTO MY_MEMBER(MEMNO, MEM_NAME) VALUES(NULL,'test01');  -- 원한다면 의도적으로 NULL을 대입할 수 있다.

INSERT INTO MY_MEMBER (MEMNO, MEM_NAME) VALUES (7, ''); -- ''를 붙여서 데이터를 추가하면 NULL이 된다.

INSERT INTO my_member(MEMNO, MEM_NAME,MEM_AGE) VALUES (4,'테스트4', 9);

SELECT * FROM MY_MEMBER;

-- 서브쿼리로 데이터 추가하기 (테스트에 많이 사용함)
INSERT INTO MY_MEMBER SELECT * FROM MY_MEMBER;

-- UPDATE : 테이블 데이터 수정
-- UPDATE 테이블명 SET 컬럼1 = VALUE1, 컬럼2 = VALUE2, ... WHERE 조건;
-- * 조건을 설정하지 않으면 모든 행이 수정된다.

COMMIT; -- COMMIT : 현재까지 DML로 인해 수정된 테이블 상황을 확정짓는다. -- DDL은 COMMIT과 ROLLBACK이 적용되지 않는다.

SELECT * FROM MY_MEMBER;
UPDATE MY_MEMBER SET MEM_NAME='고길동', MEMNO=10, MEM_AGE=45, JOIN_DATE='08/09/01';

ROLLBACK;   -- DDL은 COMMIT과 ROLLBACK이 적용되지 않는다.

UPDATE MY_MEMBER SET MEM_NAME='고길동' WHERE MEM_NAME='홍길동';   -- 홍길동 들을 고길동으로 바꿔라
-- 만약 컬럼의 여러 값이 겹치는 중복되는 정보가 있으면 어떻게 해야할까?
-- 테이블에는 하나의 행(ROW)을 유일하게 구분할 수 있는 컬럼이 필요하다.
-- 그런 컬럼이 없다면, 같은 값을 지닌 모든 행이 수정되거나 삭제돼버린다.

-- 테이블의 하나의 행을 식별해 줄 수 있는 컬럼을 기본키(PRIMARY KEY => PK)라고 부른다.
-- 기본키가 되기 위한 조건
    -- 1. 중복이 없어야 ㅎ ㅏㄴ다.    (UNIQUE)
    -- 2. NULL이 없어야 한ㄷ.     (NOT NULL) 


 -- 키의 종류
 -- 슈퍼 키 : 키가 될 수 있는 모든 컬럼의 조합 [이름, 이메일], [이메일] , [이름, 전화번호], [ 이름, 보물1호 ]
 -- 복합 키 : 2개 이상의 컬럼을 사용한 키
 -- 후보 키 : 기본 키가 될 수 있는 후보인 컬럼
 -- 기본 키 : (PRIMARY KEY)후보 키 중에서 선택된 키
 -- 대체 키 : 후보 키 중에서 선택되지 않은 키
 -- 외래 키 : (FOREIGN KEY) : 다른 테이블에서는 기본키(혹은 UNIQUE만 만족) 이지만 
 --                                (현재) 이 테이블에서는 중복을 허용하는 컬럼. 다른 테이블의 기본기 컬럼을 반드시 참조해야 한다.
 -- EX: EMP 테이블에서 DEPTNO는 외래키, DEPT테이블엣 DEPTNO는 기본키
 --      EMP 테이블에 새로운 행을 추가할 때(INSERT), DEPT테이블의 DEPTNO에 없는 부서번호는 사용할 수 없다.
 
-- 연습문제
-- 1. EMP테이블을 복사하여 EMP02 테이블을 생성해주세요-- 기존 테이블 복사해서 생성하기(테스트용) 형식 :(CREATE TABLE 새롭게 만들 이름 AS SELECT * FROM 원본)
CREATE TABLE EMP02 AS SELECT * FROM EMP;

--2. 부서번호가 10번인 사원들의 부서번호를 40번으로 수정해보세요

UPDATE EMP02 SET DEPTNO=40 WHERE DEPTNO=10;

SELECT DEPTNO FROM EMP02 WHERE DEPTNO=10;

--3. 급여가 3000 이상인 사원들의 급여를 10% 인상해보세요.

SELECT ENAME, SAL FROM EMP02 WHERE SAL >= 3000; 
UPDATE EMP02 SET SAL=SAL*(1.1) WHERE SAL>=3000;

--4. 1981년에 입사한 사원들의 입사일을 오늘로 수정해 보세요.
SELECT * FROM EMP02 WHERE HIREDATE LIKE '81%';
UPDATE EMP02 SET HIREDATE=SYSDATE;
SELECT * FROM EMP02 WHERE HIREDATE LIKE '20%';


-- DELETE : 테이블 데이터 삭제
-- DELETE FROM 테이블명 WHERE 조건;
--  하나의 컬럼을 삭제하는게 아니고, 행을 삭제하는 것.
-- ** 조건을 지정하지 않으면 모든 행이 삭제됨.

DELETE FROM EMP02;  -- 삭제   
SELECT * FROM EMP02;    --확인
ROLLBACK;               -- 되돌리는 기능

-- 문제 : EMP02 TABLE에서 COMM을 받지 않는 사원을 삭제해 보세요.
SELECT * FROM EMP02 WHERE COMM IS NULL;

DELETE FROM EMP02 WHERE COMM IS NULL;












                 

