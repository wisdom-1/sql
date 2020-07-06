-- 08_DML.sql

-- DDL (Data Definition Language) : ���̺� ����/����/����

-- DML (Data Manipulation Language) : ������ ����/����/����/��ȸ

-- CRUD : ��� ���α׷��� �����ϴ� �ʼ����� ���
-- Create : ������ ���� (INSERT)
-- Read   : ������ ��ȸ (SELECT)
-- Update : ������ ���� (UPDATE)
-- Delete : ������ ���� (DELETE)

--  INSERT : ���̺� ���ο� ������ ���� (�߰�, ����)

-- INSERT INTO ���̺�� (�÷�1, �÷�2, ...) VALUES (��1, ��2, ...);

SELECT * FROM MY_MEMBER;
INSERT INTO MY_MEMBER (MEMNO, MEM_NAME, MEM_AGE, JOIN_DATE) VALUES (1,'ȫ�浿', 10, '20/07/02');

-- �÷��� ������ �ٲ�� VALUES�� ������ �ٲ㼭 �־�� �Ѵ�.
INSERT INTO MY_MEMBER (MEM_NAME, MEM_AGE, JOIN_DATE, MEMNO) VALUES ('�׽�Ʈ', 13,'19/05/04', 2);
-- ��� �÷��� ������� �߰��� ���� �÷����� �����ص� �ȴ�.
INSERT INTO MY_MEMBER VALUES (3, '�׽�Ʈ2', 15, '20/05/05');

-- NOT NULL�� ������ �÷��� �ƴ϶�� ���� ���� ���� ���� �ִ�.
--(�÷��� ������ VALUES�� ������ ���̳��� ������ �߻��Ѵ�.)
INSERT INTO MY_MEMBER(MEMNO, MEM_NAME) VALUES (4, '�׽�Ʈ3'); -- ������ �÷��� �ڵ����� NULL�� ���Եȴ�.

INSERT INTO MY_MEMBER(MEMNO, MEM_NAME) VALUES(NULL,'test01');  -- ���Ѵٸ� �ǵ������� NULL�� ������ �� �ִ�.

INSERT INTO MY_MEMBER (MEMNO, MEM_NAME) VALUES (7, ''); -- ''�� �ٿ��� �����͸� �߰��ϸ� NULL�� �ȴ�.

INSERT INTO my_member(MEMNO, MEM_NAME,MEM_AGE) VALUES (4,'�׽�Ʈ4', 9);

SELECT * FROM MY_MEMBER;

-- ���������� ������ �߰��ϱ� (�׽�Ʈ�� ���� �����)
INSERT INTO MY_MEMBER SELECT * FROM MY_MEMBER;

-- UPDATE : ���̺� ������ ����
-- UPDATE ���̺�� SET �÷�1 = VALUE1, �÷�2 = VALUE2, ... WHERE ����;
-- * ������ �������� ������ ��� ���� �����ȴ�.

COMMIT; -- COMMIT : ������� DML�� ���� ������ ���̺� ��Ȳ�� Ȯ�����´�. -- DDL�� COMMIT�� ROLLBACK�� ������� �ʴ´�.

SELECT * FROM MY_MEMBER;
UPDATE MY_MEMBER SET MEM_NAME='��浿', MEMNO=10, MEM_AGE=45, JOIN_DATE='08/09/01';

ROLLBACK;   -- DDL�� COMMIT�� ROLLBACK�� ������� �ʴ´�.

UPDATE MY_MEMBER SET MEM_NAME='��浿' WHERE MEM_NAME='ȫ�浿';   -- ȫ�浿 ���� ��浿���� �ٲ��
-- ���� �÷��� ���� ���� ��ġ�� �ߺ��Ǵ� ������ ������ ��� �ؾ��ұ�?
-- ���̺��� �ϳ��� ��(ROW)�� �����ϰ� ������ �� �ִ� �÷��� �ʿ��ϴ�.
-- �׷� �÷��� ���ٸ�, ���� ���� ���� ��� ���� �����ǰų� �����Ź�����.

-- ���̺��� �ϳ��� ���� �ĺ��� �� �� �ִ� �÷��� �⺻Ű(PRIMARY KEY => PK)��� �θ���.
-- �⺻Ű�� �Ǳ� ���� ����
    -- 1. �ߺ��� ����� �� ������.    (UNIQUE)
    -- 2. NULL�� ����� �Ѥ�.     (NOT NULL) 


 -- Ű�� ����
 -- ���� Ű : Ű�� �� �� �ִ� ��� �÷��� ���� [�̸�, �̸���], [�̸���] , [�̸�, ��ȭ��ȣ], [ �̸�, ����1ȣ ]
 -- ���� Ű : 2�� �̻��� �÷��� ����� Ű
 -- �ĺ� Ű : �⺻ Ű�� �� �� �ִ� �ĺ��� �÷�
 -- �⺻ Ű : (PRIMARY KEY)�ĺ� Ű �߿��� ���õ� Ű
 -- ��ü Ű : �ĺ� Ű �߿��� ���õ��� ���� Ű
 -- �ܷ� Ű : (FOREIGN KEY) : �ٸ� ���̺����� �⺻Ű(Ȥ�� UNIQUE�� ����) ������ 
 --                                (����) �� ���̺����� �ߺ��� ����ϴ� �÷�. �ٸ� ���̺��� �⺻�� �÷��� �ݵ�� �����ؾ� �Ѵ�.
 -- EX: EMP ���̺��� DEPTNO�� �ܷ�Ű, DEPT���̺� DEPTNO�� �⺻Ű
 --      EMP ���̺� ���ο� ���� �߰��� ��(INSERT), DEPT���̺��� DEPTNO�� ���� �μ���ȣ�� ����� �� ����.
 
-- ��������
-- 1. EMP���̺��� �����Ͽ� EMP02 ���̺��� �������ּ���-- ���� ���̺� �����ؼ� �����ϱ�(�׽�Ʈ��) ���� :(CREATE TABLE ���Ӱ� ���� �̸� AS SELECT * FROM ����)
CREATE TABLE EMP02 AS SELECT * FROM EMP;

--2. �μ���ȣ�� 10���� ������� �μ���ȣ�� 40������ �����غ�����

UPDATE EMP02 SET DEPTNO=40 WHERE DEPTNO=10;

SELECT DEPTNO FROM EMP02 WHERE DEPTNO=10;

--3. �޿��� 3000 �̻��� ������� �޿��� 10% �λ��غ�����.

SELECT ENAME, SAL FROM EMP02 WHERE SAL >= 3000; 
UPDATE EMP02 SET SAL=SAL*(1.1) WHERE SAL>=3000;

--4. 1981�⿡ �Ի��� ������� �Ի����� ���÷� ������ ������.
SELECT * FROM EMP02 WHERE HIREDATE LIKE '81%';
UPDATE EMP02 SET HIREDATE=SYSDATE;
SELECT * FROM EMP02 WHERE HIREDATE LIKE '20%';


-- DELETE : ���̺� ������ ����
-- DELETE FROM ���̺�� WHERE ����;
--  �ϳ��� �÷��� �����ϴ°� �ƴϰ�, ���� �����ϴ� ��.
-- ** ������ �������� ������ ��� ���� ������.

DELETE FROM EMP02;  -- ����   
SELECT * FROM EMP02;    --Ȯ��
ROLLBACK;               -- �ǵ����� ���

-- ���� : EMP02 TABLE���� COMM�� ���� �ʴ� ����� ������ ������.
SELECT * FROM EMP02 WHERE COMM IS NULL;

DELETE FROM EMP02 WHERE COMM IS NULL;












                 

