-- ms sql�� ����� �����ͺ��̽� ��üȮ�� 


select name,create_date from sys.databases;



select name,create_date from sys.databases
where year(create_date)>=2023;



--�������̺� �Ǵ� �ӽ����̺�
--����:���� ����ȭ�鿡���� ��밡�������̺� (�� ����������� �޸𸮿������ŵ�
--����:ssms���α׷��� �����ϸ� �޸𸮿��� ���ŵǴ� ���̺� 




/* ################
���̺�����ϴ����ν���
################ */ 


create procedure ���̺����
as
begin 
	DROP table if exists dbo.ȸ��
	DROP table if exists dbo.�õ��ڵ�

	create table ȸ��(ȸ����ȣ TINYINT primary key, �̸� nchar(5), �õ��ڵ� SMALLINT, ����⵵ SMALLINT, ���� BIT);
	insert into ȸ�� values (1,'a',100,1980,1),
							(2,'a',100,1980,1),
							(3,'b',200,2000,1),
							(4,'c',300,2010,1)

	create table �õ��ڵ�(�õ��ڵ� SMALLINT primary key, �õ��� nchar(10))
	insert into �õ��ڵ� values (10, '����Ư����'),
	(100, '������'),
	(200, '��⵵'),
	(300, '���ֵ�');

end 



exec ���̺����

/* ################

�ӽ����̺�����ϴ����ν���
################ */


SELECT * INTO #ALL 
from

(
select ȸ��.ȸ����ȣ, ȸ��.�̸�, ȸ��.�õ��ڵ�, �õ��ڵ�.�õ��� ,2023-����⵵ as ����
,case when  ����=1 then '��'
when  ����=0 then '��'
else '����'
end ��������


from ȸ��


left join �õ��ڵ�
on ȸ��.�õ��ڵ�=�õ��ڵ�.�õ��ڵ�) as aa






select * from #ALL


select * from #ALL
where ���� between 20 and 40
		and 
		��������='��'
		order by ���� desc

declare @�˻��ϴ��̸� nchar(5)
set @�˻��ϴ��̸�='a'
select * from ȸ��
where �̸�=@�˻��ϴ��̸�
