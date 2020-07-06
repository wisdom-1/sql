-- 10_CONSTRAINT.sql

-- �������� : ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���� �÷����� �����ϴ� ��Ģ
-- NOT NULL : NULL�� ������� �ʴ´�.
-- UNIQUE : �ߺ����� ������� �ʴ´�. �׻� ������ ���� ������ �Ѵ�.
-- PRIMARY KEY : NOT NULL + UNIQUE. ���̺��� �⺻Ű�� �ȴ�.
-- FOREIGN KEY : �����ϴ� ���̺��� Ư�� �÷�(PK OR UNIQUE)�� �����ϴ� ���� ����Ѵ�.
--                �ܷ�Ű�� �����Ϸ��� �÷��� �ݵ�� �⺻Ű�̰ų� UNIQUE���� �Ѵ�.
-- CHECK    : ���� ���ϴ� ���� ������ �����Ѵ�.


-- �������� ��Ÿ������ Ȯ��
-- USER_CONSTRAINTS ���̺��� CONSTRAINT_TYPE �÷��� ���� ���� � ������������ �� �� �ִ�.
 SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='MY_MEMBER';
--      P : PRIMARY KEY
--      R : FOREIGN KEY
--      U : UNIQUE
--      C : NOT NULL, CHECK



SELECT * FROM MY_MEMBER;
DESC MY_MEMBER;


-- ��� �÷��� ���������� �����Ǿ����� Ȯ��
SELECT * FROM USER_CONS_COLUMNS;    -- ERROR....


-- �̹� �����ϴ� ���̺� �������� �߰��ϱ�
-- ���������� �߰��Ϸ��� �÷��� ���������� ������Ű�� ���ϴ� ���� �����ϸ� ���������� �߰��� �� ����.(�̹� ������ �ִ�.)
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� �������� (�÷�);

-- �⺻Ű �������� �߰��ϱ�
ALTER TABLE MY_MEMBER ADD CONSTRAINT MY_BOARD_MEMNO_PK PRIMARY KEY(MEMNO);

SELECT * FROM MY_MEMBER ORDER BY MEMNO;
SELECT * FROM USER_CONSTRAINTS;
DESC MY_MEMBER;


-- NOT NULL �������� �߰��ϱ�
-- NOT NULL ���������� ADD CONSTRAINT�� �ƴ϶� MODIFY CONSTRAINT�� ����ؾ� �Ѵ�.
-- NULL�� ����ϴ� ���¿��� NULL�� ������� �ʤ��� ���·� �����ϴ� ���̱� ������ MODIFY�� ����Ѵ�.

-- ALTER TABLE ���̺�� MODIFY �÷���   CONSTRAINT �������Ǹ� NOTNULL;
ALTER TABLE MY_MEMBER MODIFY MEM_NAME CONSTRAINT MY_MEMBER_MNAME_NN NOT NULL;

SELECT * FROM USER_CONSTRAINTS; -- �����Ȱ� Ȯ��

-- �Ʒ� �� ����..
INSERT INTO MY_MEMBER(MEMNO, MEM_AGE, JOIN_DATE) VALUES (MY_MEMBER_MEMNO_SEQ.NEXTVAL, 123, SYSDATE); -- ���� �ߴµ�????
SELECT * FROM MY_MEMBER ORDER BY MEMNO DESC;


-- �������� ���Ź��
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;
-- �⺻Ű �������� �����ϱ�---------------
ALTER TABLE MY_MEMBER DROP CONSTRAINT MY_BOARD_MEMNO_PK;


-- NOTNULL �������� �����ϱ�
ALTER TABLE MY_MEMBER DROP CONSTRAINT MY_MEMBER_MNAME_NN;



-- <�ܷ�Ű �߰��ϱ� �ǽ�>
-- EMP02�� DEPT�� ����
DROP TABLE EMP02;   -- ������ �ǽ��� ���̺� ���� ����
CREATE TABLE EMP02 AS SELECT * FROM EMP;    -- �����ؼ� ���� ����

DROP TABLE DEPT02;  -- ������ ����� ���� ���̺� ����
CREATE TABLE DEPT02 AS SELECT * FROM DEPT;

SELECT * FROM EMP02;    -- �����Ǿ����� Ȯ��
SELECT * FROM DEPT02;   -- Ȯ��

-- EMP02�� FK �߰�
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� FOREIGN KEY (�÷���) REFERENCES ���������̺�� (�÷���);
ALTER TABLE EMP02 ADD CONSTRAINT EMP02_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT02 (DEPTNO);  
-- REFERENCES DEPT02 (DEPTNO) : DEPT02�� DEPTNO �÷��� �����Ѵ�.

-- FK�� �߰��Ϸ��� DEPT02�� DEPTNO�� PK Ȥ�� UNIQUE �����Ѵ�.
ALTER TABLE DEPT02 ADD CONSTRAINT DEPT02_DEPTNO_UNQ UNIQUE(DEPTNO);

SELECT * FROM EMP02 ;

-- FK ���������� �ɸ� �÷��� NULL���� ��������� â���ϰ� �ִ� ���� �������� �ʴ°��� ������� �ʴ´�.
INSERT INTO EMP02 VALUES(1, 'TEST', 'TEST', 7792, SYSDATE, 0, NULL, NULL);
INSERT INTO EMP02 VALUES(1, 'TEST', 'TEST', 7792, SYSDATE, 0, NULL, 11);
INSERT INTO EMP02 VALUES(1, 'TEST', 'TEST', 7792, SYSDATE, 0, NULL, 12);


SELECT * FROM MY_MEMBER;
SELECT * FROM USER_CONSTRAINTS;


-- CHECK �������� �߰�
-- ���� 
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� (�÷���)
ALTER TABLE MY_MEMBER ADD CONSTRAINT MY_MEMBER_AGE_CHK CHECK (MEM_AGE BETWEEN 1 AND 999);

INSERT INTO MY_MEMBER VALUES (MY_MEMBER_MEMNO_SEQ.NEXTVAL, 'TESTER', -5, SYSDATE);  -- �ùٸ� ���� �ƴ�
INSERT INTO MY_MEMBER VALUES (MY_MEMBER_MEMNO_SEQ.NEXTVAL, 'TESTER', 0, SYSDATE);   -- �ùٸ� ���� �ƴ�
INSERT INTO MY_MEMBER VALUES (MY_MEMBER_MEMNO_SEQ.NEXTVAL, 'TESTER', 999.0, SYSDATE); -- ����

ALTER TABLE MY_MEMBER ADD (GENDER VARCHAR2(1) DEFAULT 'M'); -- �÷� ���� , ����Ʈ �� M

ALTER TABLE MY_MEMBER DROP COLUMN GENDER;   -- �÷� ����

SELECT * FROM MY_MEMBER;    -- �ܼ� Ȯ��

ALTER TABLE MY_MEMBER ADD CONSTRAINT MY_MEMBER_GENDER_CHK CHECK(GENDER IN ('M','F'));   -- GENDER �÷��� �������� ����

SELECT * FROM USER_CONSTRAINTS; -- USER_CONSTRAINTS Ȯ��

INSERT INTO MY_MEMBER VALUES (MY_MEMBER_MEMNO_SEQ.NEXTVAL, 'TESTER', 66, SYSDATE, 'F');    -- ��� �߰�
INSERT INTO MY_MEMBER VALUES (MY_MEMBER_MEMNO_SEQ.NEXTVAL, 'TESTER', 60, SYSDATE, 'K');  -- 'K'��� GENDER���� �������� �ʾƼ� ����



SELECT * FROM USER_CONSTRAINTS; -- ���� ���� �������� ���̺� ���� Ȯ��
-- ���̺� ������ ���ÿ� �������� �߰�
CREATE TABLE TEST_CONS(
    TNO NUMBER(5) PRIMARY KEY,
    TNAME VARCHAR2(10) NOT NULL,
    GENDER VARCHAR2(1) CHECK(GENDER IN ('M', 'F')),
    JOINDATE DATE DEFAULT SYSDATE 
);
DESC TEST_CONS;
-- �̷��� ���̺�� ���������� ���ÿ� �����ϸ� ������ �ִ�.
-- �������� �̸��� ����Ŭ���� �������ִ� �̸��� �ȴ�. �ſ� ����


-- <�ǽ�> ���̺� ������ ���ÿ� �������Ǹ�� �������� �߰�
CREATE TABLE TEST_CONS2(
    TNO NUMBER(5) CONSTRAINT CONS2_TNO_PK PRIMARY KEY,
    TNAME VARCHAR2(10) CONSTRAINT CONS2_TNAME_NN NOT NULL,
    GENDER VARCHAR2(1)CONSTRAINT CONS2_GEN_CHK CHECK(GENDER IN ('M', 'F')),
    JOINDATE DATE DEFAULT SYSDATE 
);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEST_CONS2';

--���̺� ������ ���ÿ�  �������Ǹ�� �������� �߰�2
CREATE TABLE TEST_CONS3(
    TNO NUMBER(5) ,
    TNAME VARCHAR2(10),
    GENDER VARCHAR2(1),
    JOINDATE DATE DEFAULT SYSDATE,
    CONSTRAINT CONS2_TNO_PK PRIMARY KEY(TNO),
    CONSTRAINT CONS2_GEN_CHK CHECK(GENDER IN ('M', 'F'))
);
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='TEST_CONS3';

--<�ǽ�> ����� �ִ� ���̺� �˸��� �������ǵ��� �߰��غ�����.
-- NOT NULL, CHECK, PRIMARY KEY, FOREIGN KEY(�ʿ��ϴٸ� ���̺� �߰�),  UNIQUE
SELECT * FROM RESTAURANT;
DESC RESTAURANT;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='RESTAURANT';   -- �������� Ȯ���ϴ� ��ɾ�


-- NOT NULL �߰��ϱ�
ALTER TABLE RESTAURANT MODIFY MENU CONSTRAINT BACK_MENU NOT NULL;   -- �������� ����

INSERT INTO RESTAURANT(RESTAURANT_NO, KIND_OF_FOOD,MENU,PRICE) VALUES(RESTAURANT_NO_SEQ.NEXTVAL, '�Ͻ�', '�ʹ�', 11000);    -- �������ǿ� ����� �ʵ� ä���
INSERT INTO RESTAURANT(RESTAURANT_NO, KIND_OF_FOOD,MENU,PRICE) VALUES(RESTAURANT_NO_SEQ.NEXTVAL, '�ѽ�', '��ȸ�����', 8000);

SELECT * FROM RESTAURANT ORDER BY RESTAURANT_NO DESC;   -- ������ ������ Ȯ��

-- �⺻Ű �������� �߰��ϱ�
ALTER TABLE MY_MEMBER ADD CONSTRAINT MY_BOARD_MEMNO_PK PRIMARY KEY(MEMNO);  -- �������� �߰�


-- FOREIGN KEY �߰�
CREATE TABLE RES01 AS SELECT * FROM RESTAURANT;
SELECT * FROM RES01;

-- CHECK �߰��ϱ�

-- UNIQUE �߰�



