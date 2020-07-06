-- 09_SEQUENCE.sql

-- �⺻Ű (Primary Key) : �� ���� �����ϰ� ������ �� �ִ� �÷�
-- �⺻Ű�� ������ ���� ������ �ϴµ�, ����ڰ� �װ��� �Ź� ���� �����Ϸ��� ������.
-- �׷���... �ڵ����� ��ġ�� �ʤ��� ���ڸ� �����ϴ� ���α׷��� ������ ���� ���� DB�� ��������� �Ѥ� ��.
-- ��, �������� �ڵ���ȣ�߻����.

/* 
    CREATE SEQUENCE ��������
            INCREMENT BY ��������   -- �⺻�� +1 , ���/���� ��� ��� ������. 
            START WITH ���ۼ���     -- ���۰��� ������ �� �ִ�. �⺻����  ������ ��(INCREMENT�� ����϶� +1) MINVALUE,
                                                                    ������ ��(INCREMENT�� �����϶� -1) MAXVALUE
            MINVALUE �ּҰ� -- �������� �ּҰ��� �����Ѵ�.
            MAXVALUE �ִ밪 -- �������� �ִ밪�� ����
            CYCLE | NOCYCLE -- CYCLE�� ��� �ִ밪�� �����ϸ� �ּҰ����� �ٽ� ����
            CACHE | NOCACHE -- ���� ��ȣ�� �̸� �����س����� ���� ���� EX) �α��ִ� �Խ����� ���
*/

-- ������ ������ ��ųʸ�
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

-- �ϴ� ������ �۾��صа� �� �����
SELECT * FROM MY_MEMBER;    -- Ȯ���ϱ�
DELETE FROM MY_MEMBER;      -- �����ϱ�
COMMIT;         -- ������

-- ������ ����
CREATE SEQUENCE MY_MEMBER_MEMNO_SEQ NOCYCLE NOCACHE; -- ����
DROP SEQUENCE MY_MEMBER_MEMNO_SEQ;      --����

-- �������� ����� ������ ����
INSERT INTO MY_MEMBER(MEMNO, MEM_NAME, MEM_AGE)
VALUES 
(MY_MEMBER_MEMNO_SEQ.nextval, 'tester' , 10);    --��������.NEXTVAL : ���� ���ڸ� ������ ����Ѵ�. ���ڸ� �����Ѵ�.


-- ���������� �̿��� ������ �����ϸ鼭 ������ �̿��ϱ�
INSERT INTO
    MY_MEMBER(MEMNO, MEM_NAME, MEM_AGE)
    (SELECT MY_MEMBER_MEMNO_SEQ.NEXTVAL, MEM_NAME, MEM_AGE FROM MY_MEMBER)
    ;
    COMMIT;
    
    SELECT * FROM MY_MEMBER;
    
-- DAUAL : �׽�Ʈ�� ���̺�
    SELECT MY_MEMBER_MEMNO_SEQ.CURRVAL FROM DUAL;
SELECT 10+10 FROM DUAL;
SELECT 1 FROM DUAL;

/*
������ ����
            ALTER SEQUENCE ��������
            INCREMENT BY ��������   
            START WITH ���ۼ���                                 
            MINVALUE �ּҰ�
            MAXVALUE �ִ밪
            CYCLE | NOCYCLE 
            CACHE | NOCACHE 
    �ѹ� ���������� ������ ���� ���������� ���� �� ����.
*/
ALTER SEQUENCE MY_MEMBERT_MEMNO_SEQ INCREMENT BY 2;
SELECT * FROM MY_MEMBER ORDER BY MEM_NO DESC;

--������ ����
DROP SEQUENCE ��������;



-- �������� :������ ���̺��� ����� �������� �����ϰ� INSERT�� �����͸� ������ �߰��غ�����
-- 1. �������� ����� ������ �÷��� ����. (���ٸ� ALTER TABLE�� �߰�)
-- 2. �������� ����
-- 3. �����͸� ����
SELECT * FROM RESTAURANT;
--����
CREATE SEQUENCE RESTAURANT_NO_SEQ NOCYCLE NOCACHE;  -- ������ ����

--������ �̿� ������ ����..?
INSERT INTO RESTAURANT VALUES (RESTAURANT_NO_SEQ.NEXTVAL, 'KOREAN_FOOD' , '���', 5000, 20, 'SEOUL');
INSERT INTO RESTAURANT VALUES (RESTAURANT_NO_SEQ.NEXTVAL, 'CHINESE_FOOD' , '¥��', 5000, 10, 'BEI');




