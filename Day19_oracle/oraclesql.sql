select * from EMP;
--1)��scott.emp���в���һ�����Լ�¼  ʱ���ʽ��to_date('�ַ���','YYYY-MM--DD')
insert into emp values(9000,'ROSE','WAITER',7839,to_date('2017-11-09','YYYY-MM-DD'),100,6000,10);

commit;--�ύ����

--2)�޸�scott.emp���е�SMITH��нˮΪ3456
select * from emp where ename='smith';
select * from emp where ename='SMITH';
update emp set sal = 3456 where ename='SMITH';

--3)��FORD�ӱ���ɾ��
delete from emp where ename='FORD';

--4)��ѯ���������а���S�Ĺ�Ա��Ϣ
select * from emp where ename like '%S%';
--5)��ѯ������2000~3000֮��Ĺ�Ա���Ͳ�����
select ename,deptno,sal from emp where sal between 2000 and 3000;

select emp.ename,dept.dname,emp.sal from emp,dept where sal between 2000 and 3000 and emp.deptno = dept.deptno;


select emp.ename,dept.dname,emp.sal from emp inner join dept on emp.deptno = dept.deptno where sal between 2000 and 3000;

--6)��ѯSMITH�Ĳ��ž�����˭��ͬʱ��SMITH���ڲ��ŵ�ַ������?(��������˺Ͳ��ž�����ͬһ����ַ)
--����1
select mgr from emp where ename='ROSE';
select ename from emp where empno = (select mgr from emp where ename='ROSE');
select  emp.ename,dept.loc   from emp inner join dept on emp.deptno = dept.deptno where  empno = (select mgr from emp where ename='ROSE');

--����2
select e1.ename,e2.ename  from emp e1 inner join emp e2 on e1.empno = e2.mgr where e2.ename='ROSE';

select e1.ename,e2.ename,dept.loc from emp e1 inner join emp e2 on e1.empno = e2.mgr inner join dept on e2.deptno = dept.deptno where e2.ename='ROSE';


