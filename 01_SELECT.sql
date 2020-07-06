-- 01_SELECT.sql

/*
���η� ���� �÷�, ���η� ���� row

    ���� ���̺�
        ���ĸ�     Į�θ�     ����      �α⵵     ��       ������     <- �÷���
        ������     500     3000        9/10      9/10     �ѱ�           
        Ƣ��   
    
    ���� �ı� ���̺�
        ���ĸ�     ����      ����
        ������     10.0     �� ���־���
        Ƣ��       10         ������ ���ذ� ���ƿ�
*/




--SELECT�� : �����͸� ��ȸ�� �� ����ϴ� ������
--SELECT �÷��� FROM ���̺��;
-- �÷��� : ǥ�� �ִ� '��' �� ��ǥ �̸�


--  ���� ������ ������ �ִ� ���̺� Ȯ���ϱ�
SELECT * FROM TAB;  --���� SCOTT�� ������ �ִ� ���̺� �̸� BONUS, DEPT, EMP, SALGRADE
SELECT * FROM TABS;

-- ���̺��� ������ ���캸��
DESC EMP;
/*
EMP ���̺� ����
    EMPNO : �����ȣ
    ENAME : �����
    JOB   : ����
    MGR   : �ش� ���� ���(Manager) �� �����ȣ
    HIREDATE : �Ի���
    SAL   : ����
    COMM  : ���ʽ�
    DEPTNO : ������ ���� �μ� ��ȣ
    
     NOT NULL : �ش� �÷����� �� ��(NULL)�� ������ �ʴ´�.
     
     NUMBER(4) : ���� 4�ڸ��� ������ �� �ִ� �÷�
     DATE      :  ��¥ �����͸� ������ �� �ִ� �÷�
     NUMBER (7,2)  : 7�ڸ� �Ǽ��̰�, �Ҽ��� 2�ڸ� �� ������ �� �ִ� �÷�
     VARCHAR2(10) : ���ڿ� �ִ���� 10�� ������ �� �ִ� �÷�
     

*/

-- ���̺� Ȯ���ϱ�
-- �÷��� : ǥ�� ���� �ش��ϴ� ��, *�� ����ϸ� ���̺� ���� ��� �÷��� ���Ѵ�.
SELECT * FROM EMP;
SELECT * FROM dept;
SELECT * FROM EMP;


--�÷��� : ǥ�� ���� �ش��ϴ� ��
SELECT ENAME, JOB FROM EMP;
select empno, ename, sal from emp;



-- 1. ����� ��� ������ ����ϴ� �������� �ۼ��غ�����.

SELECT * FROM EMP;

-- 2. ����� �̸��� �޿��� �Ի����ڸ� ����ϴ� SQL ��(������)�� �ۼ��غ�����

SELECT ENAME, SAL, HIREDATE FROM EMP;


-- SELECT �ϸ鼭 ��� ������ ����ϱ�

SELECT SAL + 1000 FROM EMP;
SELECT SAL - 1000 FROM EMP;
SELECT SAL * 2 FROM EMP;
SELECT SAL / 2 FROM EMP;

--�޿��� ���� ���ϱ� (AS�� ��Ī�� ����)

SELECT SAL *12 AS ���� FROM EMP;

-- ���ʽ� ����ϱ�

SELECT ENAME, SAL + COMM AS ���ʽ� ���� FROM EMP;
--���ڿ� NULL ���� ����ϸ� NULL�� �ȴ�. (���� 0�� NULL�� ������ �ٸ��� �����̴�. ) (NULL�� ?���� �� �� ���� ���� �ǹ��Ѵ�.)

-- NULL���� ���� �� �ִ� �÷����� ����ϱ�
SELECT ENAME, SAL + NVL(COMM, -100) AS "�� �� ��" FROM EMP;

--�������� �� : �빮��, ���������� ������ : �ҹ��� (�������)
SELECT ename AS �����, sal + NVL(COMM, 0) AS "����(���ʽ�)" FROM emp;

-- DB�� ��ҹ��� ���� ����
-- ������ : ��ҹ��� ���� X, SELECT�� select  �������
-- �÷��� : ��ҹ��� ���� X, COMM, comm, ENAME, eName �������
-- --------------------
-- �����ʹ� ��ҹ��� ������!!!

-- DISTINCT : �ߺ��Ǵ� ���� �� ������ ����ϴ� Ű����

SELECT DISTINCT JOB AS ���� FROM EMP;       -- � ������ �ִ���

SELECT DISTINCT DEPTNO AS �μ���ȣ FROM EMP;    --� �μ���ȣ�� �ִ���

SELECT DISTINCT NVL(MGR, 0) AS �Ŵ��� FROM EMP;    -- EMP �ȿ� � �Ŵ����� �ִ���





SELECT * FROM EMP;










