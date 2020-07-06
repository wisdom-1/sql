
-- 02_WHERE.sql

-- WHERE�� : �����͸� ��ȸ�� �� ������ ������ �� �ִ�.
-- SELECT �÷� FROM ���̺� WHERE  ����;
/*
    = : ����
    !=, <>, ^= : �ٸ���
    >,<, >=, <= : ��

*/


SELECT * FROM EMP;
SELECT * FROM EMP WHERE SAL =1600;

--������ 1600�� �ƴ� ���� ��ȸ
SELECT * FROM EMP WHERE SAL!=1600;
SELECT * FROM EMP WHERE SAL<>1600;
SELECT * FROM EMP WHERE SAL^=1600;

-- ������ 1600 �̻�, ������ ���� ��ȸ
SELECT * FROM EMP WHERE SAL>=1600;
SELECT * FROM EMP WHERE SAL<=1600;

-- ���� Ȥ�� ��¥ �����͵� ũ�� �񱳰� �����ϴ�.
SELECT * FROM EMP WHERE ENAME >= 'S';
SELECT * FROM EMP WHERE HIREDATE < '81/05/05';  -- ��¥ ũ�Ⱑ �� �۴ٴ� �� ==�����ƴ�.
SELECT * FROM EMP WHERE HIREDATE >= '81/05/05'; -- ��¥ ũ�Ⱑ �� ũ�ٴ� �� == �ֽ��̴�.

-- �������� : �޿��� 1500 ������ ����� �����ȣ/����̸�/�޿��� ����غ�����.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL <=1500;

-- �������� : ����̸��� 'MARTIN'�� ����� �����ȣ/�̸�/�޿� �� ����غ�����.
SELECT EMPNO,ENAME,SAL FROM EMP WHERE ENAME = 'MARTIN';

-- AND, OR , NOT
SELECT * FROM EMP WHERE SAL >=1500 AND JOB = 'SALESMAN';
-- 10�� �μ��� ������ ���� ���. NOT�� �� �� WHRER �ڿ� ����.
SELECT * FROM EMP WHERE NOT DEPTNO =10;

-- COLUMN BETWEEN A AND B
-- �޿��� 2õ �̻��̰� 3õ ������ ����� ��ȸ
SELECT * FROM EMP WHERE SAL >=2000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- �̸��� 'A'���� ũ�� 'D'���� ���� ������� ��ȸ
SELECT * FROM EMP WHERE ENAME BETWEEN 'A' AND 'D';

-- IN (A , B, C, ...)  : IN ������ : OR �����ڿ� ����� ����.
-- �޿��� 800 �̰ų� 1600 �̰ų� 2850 �� ����� ��ȸ
SELECT * FROM EMP WHERE SAL= 800 OR SAL=1600 OR SAL=2850;
SELECT * FROM EMP WHERE SAL IN (800, 1600, 2850);

-- �������� : �����ȣ�� 7521 �̰ų� 7654 �̰ų� 7844�� ������� �����ȣ/�̸�/����� ��ȸ
SELECT EMPNO, ENAME , HIREDATE FROM EMP WHERE EMPNO IN (7521, 7654, 7844);

-- �������� : �����ȣ�� 7521�� �ƴϰ� 7654�� �ƴϰ� 7844�� �ƴ� ������� ��ȸ
SELECT ENAME  FROM EMP WHERE NOT EMPNO IN (7521, 7654, 7844);
SELECT ENAME  FROM EMP WHERE EMPNO NOT IN (7521, 7654, 7844);
SELECT ENAME  FROM EMP WHERE EMPNO !=7521 AND EMPNO != 7654 AND EMPNO != 7844;
-- LIKE �����ڿ� ���פ��� ī��
--      _: �ϳ��� ���ڰ� �ƹ�  ���ڳ� �͵� ��
--      % : �ϳ� �̻��� ���ڰ� ����־ �ǰ�, �ƹ� ���ڳ� �͵� ��

-- �̸��� E�� ���ԵǴ� ����� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '%E%';

-- �ڿ��� �ι�° ���ڰ� E�� ����� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '%E_' ;

-- �տ��� �ι�° ���ڰ� L�� ����� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '_L%' ;

-- �տ��� ����° ���ڰ� L�� ����� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '__L%' ;

-- �������� : �̸��� K�� �����ϴ� ����� �������ȣ, ����̸��� ����ȸ�غ�����.
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE 'K%';
-- �̸��� K �� ���ԵǴ� ���
SELECT EMPNO , ENAME FROM EMP WHERE ENAME LIKE '%K%';

-- �̸��� K�� ������ ���
SELECT EMPNO, ENAME FROM EMP WHERE ENAME LIKE '%K';

-- �̸��� K�� ���Ե��� ���� ��� (NOT�� ��ġ �� ���� ����)
SELECT EMPNO , ENAME FROM EMP WHERE NOT ENAME LIKE '%K%';
SELECT EMPNO , ENAME FROM EMP WHERE ENAME NOT LIKE '%K%';


-- COMM�� NULL�� ����� ��ȸ
SELECT * FROM EMP WHERE COMM=NULL;  -- ���� ��Ͽ��� NULL�� �ִµ� ���� ��°����� �ȳ��´�.
--NULL�� �񱳿����ڷ� �񱳰� �Ұ����ϴ�.
SELECT * FROM EMP WHERE COMM IS NULL;       -- IS NULL �� ���� ��µȴ�.

-- COMM�� NULL�� �ƴ� ����� ��ȸ
SELECT * FROM EMP WHERE  COMM IS NOT NULL;
SELECT * FROM EMP WHERE NOT COMM IS NOT NULL;

-- �Ŵ����� ���� ����� ��ȸ
SELECT * FROM EMP WHERE MGR IS NULL;

SELECT * FROM EMP;


