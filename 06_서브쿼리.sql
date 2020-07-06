-- 06_��������.sql


-- ����������?
-- �ϳ��� SELECT�� �ȿ� ���Ե� �� �ϳ��� select���� ����������� �Ѵ�.
-- ���������� �����ϰ� �ִ� ������ ����������� �θ���.
-- �� �����ڿ� ����� ���� �ݵ�� �� �������� �����ʿ� ����ؾ� �Ѵ�.
--   ()�� �ѷ��׾ƾ� �Ѥ���.


-- EX) ���������� �̿��� KING�� ���� �μ����� �ٹ��ϴ� ����� ��� ���� ��ȸ�ϱ�
SELECT * FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME ='KING');
SELECT * FROM EMP A, EMP B WHERE A.DEPTNO = B.DEPTNO AND B.ENAME='KING';    --JOIN ������� ���������� ���� ���� ����� �� �ִ�.

-- ���������� �̿��Ͽ�
-- ���� 1 : SMITH�� ���� �μ����� �ٹ��ϴ� ����� �̸��� �μ���ȣ�� ��ȸ�غ�����.
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SMITH');
 SELECT B.* FROM EMP A, EMP B WHERE A.DEPTNO=B.DEPTNO AND A.ENAME='SMITH';   --JOIN��� --���⼭ A.ENAME�� B.ENAME�� �ٸ���.
 
--���� 2 : SMITH�� ������ ������ ���� ��������� ��� ����ϴ� ������
SELECT * FROM EMP WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SMITH');
SELECT * FROM EMP A, EMP B WHERE B.JOB = A.JOB AND B.ENAME='SMITH';      --JOIN���

-- ���� 3 : MARTIN�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿� ���
SELECT ENAME, SAL FROM EMP WHERE SAL>=(SELECT SAL FROM EMP WHERE ENAME='MARTIN');
SELECT A.ENAME,A.SAL FROM EMP A, EMP B WHERE A.SAL>=B.SAL AND B.ENAME ='MARTIN';     --JOIN���

-- ���� 4 : DALLAS ���� �ٹ��ϴ� ����� �̸��� �μ���ȣ ���
SELECT ENAME, EMP.DEPTNO FROM EMP WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS' );
SELECT A.ENAME, A.DEPTNO FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND B.LOC='DALLAS';       --JOIN���


-- ���±����� ���������� ����� �� �� �ٸ� �������� ����ߴ�.
-- ��ó�� ����� �� �ٸ� ������ ���������� ���� ��(SINGLE Row) ����������� �θ���.
-- ���� �� ���������� �׷��Լ��� ����ϸ� ���� �����ϴ�.

-- �� ) ��� ���޺��� ������ ���� �޴� ����� ������ ��ȸ�ϱ�
SELECT  * FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

SELECT AVG(SAL) FROM EMP ;

-- ������(MULTI row) ��������
-- ������ ���������� �ݵ�� ���� �� �����ڿ� �Բ� ����ؾ� �Ѵ�..
-- ������ ������ ( IN, ANY , ALL , EXIST ...)

-- IN : ()���� ���� ���� �� �ϳ��� ��ġ�ϸ� ��
-- EX) ������ 3000 �̻��� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ����� ���
SELECT ENAME , DEPTNO FROM EMP WHERE SAL>=3000; -- ���� �ۼ��Ѱ�

SELECT * FROM EMP WHERE DEPTNO IN (SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >=3000 ); -- DISTINCT : �ߺ�����

SELECT * FROM EMP WHERE DEPTNO IN (10,20);

-- ALL : ()���� ���� ������ �̿��� �񱳰� ��� ���̾�� ��
-- EX) ������ SALESMAN�� ��� ������� �޿��� �� ���� �޴� ����� ��ȸ�ϰ� ���� ��
SELECT * FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE JOB='SALESMAN');    
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');    --������ ALL�� MAX�� ���� ���� ���..

-- ANY : () ���� ���� ������ �̿��� �� �� �ϳ��� �������ѵ� ��
-- EX) : ������ SALESMAN�� ��� �� ���� ���� �޴� ������� �޿��� �� ���� �޴� ���
 SELECT * FROM EMP WHERE SAL > ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN');
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN');    --������ ANY�� ���� MIN�� ���� ���

-- EXISTS : ���������� ����� �����ϸ� ���̴�.
-- EX) : �Ҽӵ� ����� �����ϴ� �μ������� ���

SELECT * FROM DEPT WHERE EXISTS (SELECT * FROM EMP WHERE EMP.DEPTNO= DEPT.DEPTNO);
SELECT * FROM DEPT WHERE NOT EXISTS (SELECT * FROM EMP WHERE EMP.DEPTNO= DEPT.DEPTNO);  --NOT EXISTS : ���� ������ �������� ���� �� ���


-- ���� 1 : �μ����� ���� �޿��� ���� �޴� ����� �̸��� �޿��� �μ���ȣ ��� <���� ��(Multi Column) ��������>

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE (SAL, DEPTNO) IN (SELECT MAX(SAL), DEPTNO FROM EMP GROUP BY DEPTNO);   
-- �� �μ��� �ִ� ������ �����ϱ�
SELECT DEPTNO, MAX(SAL), AVG(SAL) FROM EMP GROUP BY DEPTNO;
-- ���� 1-1 : �μ����� ��պ��� ���� �޴� ����� �̸��� �޿��� �μ���ȣ�� ���
SELECT ename, sal, deptno FROM emp where sal > all(select avg(sal) from emp ) ORDER BY DEPTNO;  --GROUP BY deptno �ؾ��ϴ��� ���ؾ��ϴ���..?

-- ������ ��� (JOIN����)
SELECT A.ENAME, A.SAL, A.DEPTNO FROM EMP A,
(SELECT AVG(SAL) AS AVGSAL , DEPTNO FROM EMP GROUP BY DEPTNO) B 
-- ���̺� �ڸ��� ���������� ����� ��� ����� ���̺�(VIEW) ���� : INLINE-VIEW
WHERE B.DEPTNO=A.DEPTNO AND A.SAL > B.AVGSAL;

-- ���� 2 : 30�� �μ� �Ҽ��� ��� ����麸�� �޿��� �� ���� �޴� ����� ������ ���
SELECT * FROM EMP WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO =30);
SELECT * FROM EMP WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE DEPTNO =30);

-- ���� 3 : ��� SALESMAN�� �� ��� �Ѹ��� �޿��� ���ʽ��� ��ģ �ݾ׺��� �޿��� �� ���� �޴� ����� ������ ���
SELECT * FROM EMP WHERE SAL > ANY (SELECT SAL+NVL(COMM, 0) FROM EMP WHERE JOB='SALESMAN') ORDER BY ENAME;
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL+COMM) FROM EMP WHERE JOB = 'SALESMAN') ORDER BY ENAME;


-- �������� 2,3�� ��� MAX,MIN���� �ٲ� �� �ִ���?
SELECT ENAME, SAL+COMM, SAL,COMM FROM EMP WHERE JOB='SALESMAN';
