-- 09_SEQUENCE.sql

-- 기본키 (Primary Key) : 각 행을 유일하게 구분할 수 있는 컬럼
-- 기본키는 유일한 값을 가져야 하는데, 사용자가 그것을 매번 직접 생성하려면 귀찮다.
-- 그래서... 자동으로 겹치지 않ㄴ는 숫자를 생성하는 프로그램을 구현해 놓은 것을 DB의 시퀀스라고 한ㄷ ㅏ.
-- 즉, 시퀀스는 자동번호발생기다.

/* 
    CREATE SEQUENCE 시퀀스명
            INCREMENT BY 증감숫자   -- 기본값 +1 , 양수/음수 모두 사용 가능함. 
            START WITH 시작숫자     -- 시작값을 설정할 수 있다. 기본값은  증가할 때(INCREMENT가 양수일때 +1) MINVALUE,
                                                                    감소할 때(INCREMENT가 음수일때 -1) MAXVALUE
            MINVALUE 최소값 -- 시퀀스의 최소값을 설정한다.
            MAXVALUE 최대값 -- 시퀀스의 최대값을 설정
            CYCLE | NOCYCLE -- CYCLE인 경우 최대값에 도달하면 최소값부터 다시 시작
            CACHE | NOCACHE -- 다음 번호를 미리 생성해놓을지 말지 결정 EX) 인기있는 게시판의 경우
*/

-- 시퀀스 데이터 딕셔너리
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

-- 일단 이전에 작업해둔거 다 지우기
SELECT * FROM MY_MEMBER;    -- 확인하기
DELETE FROM MY_MEMBER;      -- 삭제하기
COMMIT;         -- 굳히기

-- 시퀀스 생성
CREATE SEQUENCE MY_MEMBER_MEMNO_SEQ NOCYCLE NOCACHE; -- 생성
DROP SEQUENCE MY_MEMBER_MEMNO_SEQ;      --삭제

-- 시퀀스를 사용해 데이터 생성
INSERT INTO MY_MEMBER(MEMNO, MEM_NAME, MEM_AGE)
VALUES 
(MY_MEMBER_MEMNO_SEQ.nextval, 'tester' , 10);    --시퀀스명.NEXTVAL : 다음 숫자를 꺼내서 사용한다. 숫자를 갱신한다.


-- 서브쿼리를 이용해 데이터 복사하면서 시퀀스 이용하기
INSERT INTO
    MY_MEMBER(MEMNO, MEM_NAME, MEM_AGE)
    (SELECT MY_MEMBER_MEMNO_SEQ.NEXTVAL, MEM_NAME, MEM_AGE FROM MY_MEMBER)
    ;
    COMMIT;
    
    SELECT * FROM MY_MEMBER;
    
-- DAUAL : 테스트용 테이블
    SELECT MY_MEMBER_MEMNO_SEQ.CURRVAL FROM DUAL;
SELECT 10+10 FROM DUAL;
SELECT 1 FROM DUAL;

/*
시퀀스 수정
            ALTER SEQUENCE 시퀀스명
            INCREMENT BY 증감숫자   
            START WITH 시작숫자                                 
            MINVALUE 최소값
            MAXVALUE 최대값
            CYCLE | NOCYCLE 
            CACHE | NOCACHE 
    한번 지나가버린 시퀀스 값을 예ㅓ전으로 돌릴 순 없다.
*/
ALTER SEQUENCE MY_MEMBERT_MEMNO_SEQ INCREMENT BY 2;
SELECT * FROM MY_MEMBER ORDER BY MEM_NO DESC;

--시퀀스 삭제
DROP SEQUENCE 시퀀스명;



-- 연습문제 :만들어온 테이블에서 사용할 시퀀스를 생성하고 INSERT로 데이터를 여러개 추가해보세요
-- 1. 시퀀스를 사용할 적당한 컬럼을 고른다. (없다면 ALTER TABLE로 추가)
-- 2. 시퀀스를 생성
-- 3. 데이터를 생성
SELECT * FROM RESTAURANT;
--생성
CREATE SEQUENCE RESTAURANT_NO_SEQ NOCYCLE NOCACHE;  -- 시퀀스 생성

--시퀀스 이용 데이터 생성..?
INSERT INTO RESTAURANT VALUES (RESTAURANT_NO_SEQ.NEXTVAL, 'KOREAN_FOOD' , '김밥', 5000, 20, 'SEOUL');
INSERT INTO RESTAURANT VALUES (RESTAURANT_NO_SEQ.NEXTVAL, 'CHINESE_FOOD' , '짜장', 5000, 10, 'BEI');




