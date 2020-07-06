-- 05_JOIN.sql

-- JOIN : ���踦 ���� �� ���̺��� ��� ���ϴ� ������ ��ȸ�ϴ� ��

SELECT * FROM EMP; -- ������� ���̺�
SELECT * FROM DEPT; --EMP���̺��� �μ���ȣ�� �������� ������ �μ� ���� TABLE (����μ�/�μ��̸�/����)


-- CROSS JOIN : �� ���̺��� ��� ����� ���� ��ȸ�ϴ� JOIN
SELECT * FROM EMP, DEPT;

SELECT ENAME, EMP.DEPTNO, DEPT.DEPTNO, DNAME FROM EMP, DEPT;
-- �÷����� ��ġ�� ��� ��� ���̺��� �ää������� ��Ȯ�ϰ� ������� �Ѵ٤�.

-- CROSS JOIN�� �ǹ��ִ� �����͸� ã�� ���� �����̴�.
-- CROSS JOIN�����δ� �ƹ��� �ǹ̰� ����.
-- JOIN ����� �ǹ̸� ������ ���ؼ��� CROSS JOIN�� ����� ������ �����ؾ� �Ѵ�.

-- EQUI JOIN : ���� �÷��� �������� JOIN�Ѵ�.
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

-- EX: �̸��� MARTIN�� ����� �̸�/�μ����� ��ȸ�ϰ� ���� ��
SELECT EMP.ENAME,DEPT.DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND EMP.ENAME='MARTIN';

-- ����1 : ���忡 �ٹ��ϴ� ����� �̸��� �޿��� ��ȸ
SELECT ENAME, SAL FROM EMP,DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.LOC = 'NEW YORK';

-- ����2 : SALES �μ� �Ҽ��� ������� �̸��� �Ի����� ��ȸ�غ�����
SELECT EMP.ENAME, EMP.HIREDATE FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO AND DNAME='SALES';

--  ����3 : ������ MANAGER�� ����� �̸�/�μ���ȣ/�μ���/������ ��ȸ�غ�����
SELECT ENAME, D.DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.JOB='MANAGER';      -- EMP E, DEPT D -> ���̺�� ��Ī�� �ο��� �� �ִ�.

-- NON-EQUI JOIN : ���� �������� ���� �÷����� �� ���̺��� JOIN �Ѵ�.
SELECT * FROM SALGRADE;

SELECT * FROM EMP, SALGRADE;
SELECT * FROM EMP, SALGRADE WHERE EMP.SAL BETWEEN LOSAL AND HISAL;

SELECT EMP.*, G.GRADE FROM EMP, SALGRADE G WHERE EMP.SAL BETWEEN LOSAL AND HISAL; 

-- SELF JOIN : ���̺� �ϳ��� �����ϴ� �� (�ڱ� �ڽŰ� JOIN)

-- EX: ������� ������ �Ŵ��� �̸��� �Բ� ��ȸ�ϱ�
SELECT A.* , B.* FROM EMP A, EMP B;
-- A�� �Ŵ��� ��ȣ�� B�� ������ȣ�� ��ġ�Ѵٸ� B�� A�� �Ŵ�����.
SELECT A.*, B.ENAME FROM EMP A, EMP B WHERE A.MGR=B.EMPNO;

-- ����1 : �Ŵ����� KING�� ������� �̸��� ������ ����غ�����.
-- SELECT A.ENAME , B.JOB FROM EMP A, EMP B WHERE A.JOB = 'MANAGER'AND B.ENAME='KING'  ;
SELECT B.ENAME , A.JOB FROM EMP A, EMP B WHERE A.MGR = B.EMPNO AND B.ENAME='KING';

-- ����2 : ALLEN�� ������ �ٹ���(DEPTNO) ���� �ٹ��ϴ� ����� �̸��� ����غ�����.
SELECT * FROM EMP A, EMP B WHERE B.ENAME ='ALLEN' AND B.DEPTNO=A.DEPTNO AND A.ENAME<>'ALLEN';   --AND A.ENAME<>'ALLEN' �� �պκп� �ߴ� ALLEN�� ���ش�.

-- OUTER JOIN : ������ ������Ű�� ���� (NULL ������) ��ȸ���� �ʴ� ������ �Բ� ��ȸ�ϰ� ���� ��쿡 ����ϴ� ����
SELECT * FROM EMP A, EMP B WHERE A.MGR=B.EMPNO; -- KING�� MGR ��ȣ�� NULL �̶� ����� �ȵ�.
 
 -- JOIN ������ �ѹ��� ������Ű�� ���ؼ� �������� ���� ���� (+)�� ���� �ʿ� NULL�� �ٿ����� �����ش�.
 SELECT * FROM EMP A, EMP B WHERE A.MGR=B.EMPNO(+); -- �Ŵ����� ��� ��ȸ���� ���� �࿡ NULL�� �Ŵ����� �߰��ؼ� ��ȸ
 SELECT * FROM EMP A, EMP B WHERE A.MGR(+) = B.EMPNO;   -- �����ϴ� ����� ��� ��ȸ���� ���� �࿡ NULL�� �����ϴ� ����� �߰��ؼ� ������
 -- (+) : ��� �� ���̺� NULL�� �߰��ؼ� ��ȸ�� �������� ��ȸ�Ѵ�.
--�����ϴ� ���̺��� �ݴ��ʿ� +�� ���δ�.

-- ���� : EMP ���̺�� DEPT ���̺��� �����Ͽ� �����/�μ���ȣ/�μ��� �� ����ϰ� ����� �Ѹ� �������� �ʴ� �μ��� ������ ��µǵ��� ������ �ۼ��غ�����.
SELECT ENAME , A.DEPTNO, B.DNAME , B.* FROM EMP A, DEPT B WHERE A.DEPTNO(+) = B.DEPTNO;

-- �μ��� �������� �ʤ��� ����� ����ϰ� �ʹ�.
SELECT ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO(+);

-- �̱� ǥ�ؿ� ���� �� JOIN ����

-- 1. CROSS JOIN
SELECT * FROM EMP, DEPT;
SELECT * FROM EMP CROSS JOIN DEPT; --ANSI

-- 2. INNER JOIN (EQUI, SELF, NON-EQUI JOIN)
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;    -- ON : � �÷��� �Ἥ JOIN �Ұų�.
SELECT * FROM EMP INNER JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO; --ANSI
SELECT * FROM EMP INNER JOIN DEPT USING (DEPTNO);   --ANSI

SELECT * FROM EMP A INNER JOIN EMP B ON A.MGR = B.EMPNO; --ANSI SELF
SELECT * FROM EMP INNER JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL;   --ANSI NON-EQUI


-- 3. NATURAL JOIN (������ �̸��� �÷����� INNER JOIN�� �ϴ� ���)
SELECT * FROM EMP NATURAL JOIN DEPT;

-- 4. OUTER JOIN [LEFT | RIGHT|FULL]
-- ���ǿ� ���� �ʴ� �൵ �����ִ� JOIN

-- ������ ���̺��� �ȳ��� ������ ���� ���̺��� (+) �ؼ� ������� ��
 SELECT * FROM EMP RIGHT OUTER JOIN DEPT USING (DEPTNO);
-- LEFT OUTER JOIN : ���� ���̺��� �ȳ��� ������ ������ ���̺� (+) �ؼ� ������� ��
 SELECT * FROM DEPT LEFT OUTER JOIN EMP USING (DEPTNO);
 
 --FULL OUTER JOIN : ���ʿ� (+) �� �� ���� ���
 SELECT * FROM EMP FULL OUTER JOIN DEPT USING (DEPTNO);
 

 -- INNER JOIN : ������ �´� ����� ���ڴ�.
 SELECT * FROM EMP A INNER JOIN EMP B ON A.MGR= B.EMPNO;
 
 -- OUTER JOIN : ������ ���� �ʴ� ����� ���ڴ�.
 SELECT * FROM EMP A FULL OUTER JOIN EMP B ON A.MGR= B.EMPNO;
 SELECT * FROM EMP A LEFT OUTER JOIN EMP B ON A.MGR= B.EMPNO;


