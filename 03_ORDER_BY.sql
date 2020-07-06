 -- 03_ORDER_BY.sql
 
 -- ORDER BY�� : SELECT �� ����� ���ϴ� �÷��� �������� ������ �� �ִ�.
 --       ASC : ASCENDING, ��������, �������� ���� ���´�.
 --       DESC : DESCENDING, ��������, ū ���� ���� ���´�.
 
 --�ڷᱸ�� �ð��� ��� �˰��� ����
 
 --          ��������           /       ��������
 -- ��¥   �� ������ ������ ���� /     �ֽ� ������ ���� (�ֱ� ��¥)
 -- ����      ���� ��          /         ū ��
 -- ����      A TO Z          /        Z TO A
 -- NULL    ���� �������� ����  /       ���� ���� ����
 
 
 -- ASC�� ������ �����ϴ�. (ORDER BY �� �⺻���� ASC��. ��������)
 SELECT * FROM EMP ORDER BY COMM ASC;   -- ��������
 SELECT * FROM EMP ORDER BY COMM DESC;  -- ��������
 
 SELECT * FROM EMP ORDER BY HIREDATE ASC;   -- �Ի��� �������� ����
 SELECT * FROM EMP ORDER BY ENAME DESC;     -- ��� �̸� �������� ����
 SELECT * FROM EMP ORDER BY SAL ASC;        -- ���� �������� ����
 
 
 -- ���� ������ ������ �α�
 -- ex) �μ� ��ȣ �������� ���� ������ ��, ���� �μ� ������� �̸� ������ �����ϱ�.
 SELECT * FROM EMP ORDER BY DEPTNO ASC, ENAME ASC;      -- ���� ���� : �μ� -> �̸� 
 
 -- ���� ���� : �����ȣ /����̸�/����/�Ի����� �ֱ� �Ի��� ������� ����غ�����
 SELECT EMPNO,ENAME,JOB,HIREDATE FROM EMP ORDER BY HIREDATE;
 -- �������� : ��� ��� ������ ���� ���� ������������ ����ϵ�, ���� ������ ��� ������ ���� �޴� ������ �����Ͽ� ����ϼ���.
 SELECT * FROM EMP ORDER BY JOB, SAL DESC;
 
 
 
 SELECT * FROM EMP;



