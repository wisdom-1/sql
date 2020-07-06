-- 07_CREATE TABLE.sql
/*
#���̺� �����ϱ�

 CREATE TABLE ���̺��̸�(
    �÷���1 �÷�Ÿ�� (��������),
    �÷���2 �÷�Ÿ�� (��������),
    �÷���3 �÷�Ÿ�� (��������),
    ....    
                    );
 
 */
 
 -- �÷�Ÿ�� ����
/*
    NUMBER(����) : ���� , (EX) NUMBER(7)�� 7�ڸ� ����)
    NUMBER(����, �Ҽ��� �ڸ���) : �Ǽ� (EX : NUMBER(7,2)�� ���� 5�ڸ�, �Ҽ� 2�ڸ�)
    CHAR(ũ��) : ���� ���� ���� ������, �Էµ� �ڷ� ���̿� ������� ������ ���̸� �����ϴ� Ÿ��
    VARCHAR2(ũ��) : ���� ���� ���� ������, ���� �Էµ� ���� ���� ��ŭ�� ������ �����ϴ� Ÿ��
    DATE : ��¥�����͸� ������ �� �ִ� Ÿ��
    TIMESTAMP : �и���������� ������ �� �ִ� Ÿ��
    */
-- ���̺� ���� �� : ȸ�� ���̺�
-- CREATE TABLE ��¼�� �ߴٰ� ALTER�� �ٲٰ� ������ ALTER TABLE ��¼�� MODIFY�� �� ���� CTRL + ENTER ->ALTER TABLE MY_MEMBER MODIFY(
CREATE TABLE MY_MEMBER(
    MEMNO NUMBER(10),
    MEM_NAME VARCHAR(20),
    MEM_AGE NUMBER(3),
    JOIN_DATE DATE DEFAULT SYSDATE -- �⺻���� ������ �ñ�� DEFAULT����
    
);
-- ���̺� Ȯ�� ��ɾ� : DESC TABLE��
DESC EMP;
DESC MY_MEMBER;

-- ���̺� ���� ��ɾ� : DROP TABLE ���̺��
DROP TABLE MY_MEMBER;

-- ���� ���̺� �����ؼ� �����ϱ�(�׽�Ʈ��) ���� :(CREATE TABLE ���Ӱ� ���� �̸� AS SELECT * FROM ����)
-- �������ǵ� �Բ� ��������� �ʴ´�. (NOT NULL ���� ��)
CREATE TABLE EMP02 AS SELECT * FROM EMP;
CREATE TABLE EMP03 AS SELECT * FROM EMP WHERE DEPTNO IN(20,30);
CREATE TABLE EMP04 AS SELECT EMPNO, ENAME, SAL FROM EMP;

SELECT * FROM EMP03;

DROP TABLE EMP02;
DROP TABLE EMP03;
DROP TABLE EMP04;


SELECT * FROM MY_MEMBER;
-- ���̺� �÷� ���� ��ɾ�
-- ALTER TABLE ���̺�� [ADD|MODIFY|DROP DOLUMN] (�÷���1, �÷���2, ...);

-- ADD : �÷� �߰�
ALTER TABLE MY_MEMBER ADD (TEST NUMBER (5));
ALTER TABLE MY_MEMBER ADD (TEST2 NUMBER (5), TEST3 VARCHAR2(50));

-- MODIFY : �÷� Ÿ�� ���� (�÷��� ������ X)
ALTER TABLE MY_MEMBER MODIFY (TEST NUMBER(7));
ALTER TABLE MY_MEMBER MODIFY (TEST DATA);

-- DROP COLUMN : �÷� ���� ()
ALTER TABLE MY_MEMBER DROP COLUMN TEST;
ALTER TABLE MY_MEMBER DROP COLUMN TEST2;
ALTER TABLE MY_MEMBER DROP COLUMN TEST3;

-- SET UNUSED: �÷��� �����ϴ� ��� ��� ������� �ʰ� �����ϱ�      -- ��) ���� ����
ALTER TABLE MY_MEMBER SET UNUSED(TEST);
ALTER TABLE MY_MEMBER SET UNUSED(TEST2);
ALTER TABLE MY_MEMBER SET UNUSED(TEST3);

-- �����ִ� �ð��� UNUSED ó���� �÷����� �����Ѵ�.
ALTER TABLE MY_MEMBER DROP UNUSED COLUMNS;

DESC MY_MEMBER;

-- ��Ÿ ������ : �����Ϳ� ���� ������ (���̺� ����, �÷� ����..)
-- �츮�� �������� �ʰ� DB�� �˾Ƽ� �߰� �����ϸ� �����ϴ� ���̺�  (�̸��� TABS, USER_TABLES�� DB�� �˾Ƽ� ���س��� �̸��̴�.)

SELECT * FROM TABS;
SELECT * FROM USER_TABLES;  -- ���� ���̺� ����
--  �� �� ���� �ΰ��� ��ɾ�� ���� ����-----
SELECT * FROM USER_SEQUENCES;   -- ���� ������ ����
SELECT * FROM USER_INDEXES;     -- ���� �ε��� ����
SELECT * FROM USER_CONSTRAINTS; -- ���� �������� ����

-- --------------------------------------------------------------
SELECT * FROM ALL_TABLES; -- ��� ���̺� ����
SELECT * FROM ALL_SEQUENCES;   -- ��� ������ ����
SELECT * FROM ALL_INDEXES;     -- ��� �ε��� ����
SELECT * FROM ALL_CONSTRAINTS; -- ��� �������� ����

-- ���� ������ �������� �˾Ƴ��� ���ɾ�
SHOW USER;

-- ���� : ���̺� ¥����
-- ��) ���� ���, �п� ���, �Խ��� �Խñ� ���...


-- �������� ���� ������ ���� ���̺�(�ѽ�,�߽�,���,�Ͻ�)
CREATE TABLE RESTAURANT(
    RESTAURANT_NO NUMBER(10),
    KIND_OF_FOOD VARCHAR2(20), 
    MENU VARCHAR2(20),
    PRICE NUMBER(10),
    PREFERENCE_AGE NUMBER(6),
    LOCATION VARCHAR(5)
);

DROP TABLE RESTAURANT;




