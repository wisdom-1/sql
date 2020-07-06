-- 07_CREATE TABLE.sql
/*
#테이블 생성하기

 CREATE TABLE 테이블이름(
    컬럼명1 컬럼타입 (제약조건),
    컬럼명2 컬럼타입 (제약조건),
    컬럼명3 컬럼타입 (제약조건),
    ....    
                    );
 
 */
 
 -- 컬럼타입 종류
/*
    NUMBER(길이) : 정수 , (EX) NUMBER(7)은 7자리 정수)
    NUMBER(길이, 소수점 자릿수) : 실수 (EX : NUMBER(7,2)는 정수 5자리, 소수 2자리)
    CHAR(크기) : 고정 길이 문자 데이터, 입력된 자료 길이와 상관없이 정해진 길이를 차지하는 타입
    VARCHAR2(크기) : 가변 길이 문자 데이터, 실제 입력된 문자 길이 만큼만 공간을 차지하는 타입
    DATE : 날짜데이터를 저장할 수 있는 타입
    TIMESTAMP : 밀리세컨드까지 저장할 수 있는 타입
    */
-- 테이블 생성 예 : 회원 테이블
-- CREATE TABLE 어쩌고 했다가 ALTER로 바꾸고 싶으면 ALTER TABLE 어쩌고 MODIFY로 쓴 이후 CTRL + ENTER ->ALTER TABLE MY_MEMBER MODIFY(
CREATE TABLE MY_MEMBER(
    MEMNO NUMBER(10),
    MEM_NAME VARCHAR(20),
    MEM_AGE NUMBER(3),
    JOIN_DATE DATE DEFAULT SYSDATE -- 기본값을 가입한 시기로 DEFAULT설정
    
);
-- 테이블 확인 명령어 : DESC TABLE명
DESC EMP;
DESC MY_MEMBER;

-- 테이블 삭제 명령어 : DROP TABLE 테이블명
DROP TABLE MY_MEMBER;

-- 기존 테이블 복사해서 생성하기(테스트용) 형식 :(CREATE TABLE 새롭게 만들 이름 AS SELECT * FROM 원본)
-- 제약조건도 함께 복사되지는 않는다. (NOT NULL 같은 것)
CREATE TABLE EMP02 AS SELECT * FROM EMP;
CREATE TABLE EMP03 AS SELECT * FROM EMP WHERE DEPTNO IN(20,30);
CREATE TABLE EMP04 AS SELECT EMPNO, ENAME, SAL FROM EMP;

SELECT * FROM EMP03;

DROP TABLE EMP02;
DROP TABLE EMP03;
DROP TABLE EMP04;


SELECT * FROM MY_MEMBER;
-- 테이블 컬럼 수정 명령어
-- ALTER TABLE 테이블명 [ADD|MODIFY|DROP DOLUMN] (컬럼명1, 컬럼명2, ...);

-- ADD : 컬럼 추가
ALTER TABLE MY_MEMBER ADD (TEST NUMBER (5));
ALTER TABLE MY_MEMBER ADD (TEST2 NUMBER (5), TEST3 VARCHAR2(50));

-- MODIFY : 컬럼 타입 변경 (컬럼명 수정은 X)
ALTER TABLE MY_MEMBER MODIFY (TEST NUMBER(7));
ALTER TABLE MY_MEMBER MODIFY (TEST DATA);

-- DROP COLUMN : 컬럼 삭제 ()
ALTER TABLE MY_MEMBER DROP COLUMN TEST;
ALTER TABLE MY_MEMBER DROP COLUMN TEST2;
ALTER TABLE MY_MEMBER DROP COLUMN TEST3;

-- SET UNUSED: 컬럼을 삭제하는 대신 잠깐 사용하지 않게 설정하기      -- 예) 은행 업무
ALTER TABLE MY_MEMBER SET UNUSED(TEST);
ALTER TABLE MY_MEMBER SET UNUSED(TEST2);
ALTER TABLE MY_MEMBER SET UNUSED(TEST3);

-- 여유있는 시간에 UNUSED 처리된 컬럼들을 삭제한다.
ALTER TABLE MY_MEMBER DROP UNUSED COLUMNS;

DESC MY_MEMBER;

-- 메타 데이터 : 데이터에 대한 데이터 (테이블 정보, 컬럼 정보..)
-- 우리가 관리하지 않고 DB가 알아서 추가 삭제하며 관리하는 테이블  (이름은 TABS, USER_TABLES로 DB가 알아서 정해놓은 이름이다.)

SELECT * FROM TABS;
SELECT * FROM USER_TABLES;  -- 유저 테이블 정보
--  이 줄 위의 두가지 명령어는 자주 쓰임-----
SELECT * FROM USER_SEQUENCES;   -- 유저 시퀀스 정보
SELECT * FROM USER_INDEXES;     -- 유저 인덱스 정보
SELECT * FROM USER_CONSTRAINTS; -- 유저 제약조건 정보

-- --------------------------------------------------------------
SELECT * FROM ALL_TABLES; -- 모든 테이블 정보
SELECT * FROM ALL_SEQUENCES;   -- 모든 시퀀스 정보
SELECT * FROM ALL_INDEXES;     -- 모든 인덱스 정보
SELECT * FROM ALL_CONSTRAINTS; -- 모든 제약조건 정보

-- 현재 유저가 누구인지 알아내는 명ㅇ령어
SHOW USER;

-- 숙제 : 테이블 짜오기
-- 예) 음식 목록, 학원 목록, 게시판 게시글 등등...


-- 백종원의 전국 음식점 종류 테이블(한식,중식,양식,일식)
CREATE TABLE RESTAURANT(
    RESTAURANT_NO NUMBER(10),
    KIND_OF_FOOD VARCHAR2(20), 
    MENU VARCHAR2(20),
    PRICE NUMBER(10),
    PREFERENCE_AGE NUMBER(6),
    LOCATION VARCHAR(5)
);

DROP TABLE RESTAURANT;




