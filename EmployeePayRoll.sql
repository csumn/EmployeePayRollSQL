show databases;
create database Emp_Payroll_service;
Use Emp_Payroll_service;
create table employee_payroll(
id int unsigned not null auto_increment,
name varchar(50) not null,
salary double not null,
start date not null,
primary key (id)
);
desc employee_payroll;
insert into employee_payroll(name, salary, start) values
('Jeff','100000.0','2022-01-01'),
('Satya','130000.0','2019-05-01'),
('Bill Gates','150000.0','2021-09-08');
select * from employee_payroll;
select salary from employee_payroll where name = 'Bill Gates';
Alter table employee_payroll add gender char(1) after name;
select * from employee_payroll;
insert into employee_payroll(name, salary, start) values
('Teresa','250000.0','2020-007-05');
select * from employee_payroll;
update employee_payroll set gender = 'F' where name = 'Teresa';
update employee_payroll set gender = 'M' where name = 'Jeff';
update employee_payroll set gender = 'M' where name = 'Satya';
update employee_payroll set gender = 'M' where name = 'Bill Gates';
select * from employee_payroll;
select sum(salary) from employee_payroll where gender = 'M' group by gender;
select gender, count(name) from employee_payroll group by gender;
select min(salary) from employee_payroll;
select name, max(salary) from employee_payroll;
alter table employee_payroll add phone_number varchar(50) after name;
select * from employee_payroll;
alter table employee_payroll add Address varchar(50) after phone_number;
select * from employee_payroll;
alter table employee_payroll add Deduction double not null after basic_pay;
select * from employee_payroll;
alter table employee_payroll add Taxable_pay double not null after Deduction;
alter table employee_payroll add Tax double not null after Taxable_pay;
alter table employee_payroll add Net_pay double not null after Tax;
select * from employee_payroll;
alter table employee_payroll add Department varchar(50) not null after Address;
update employee_payroll set department = 'Sales' where name = 'Teresa';
Insert into employee_payroll(name, Department, gender, Basic_pay, Deduction, Taxable_pay, Tax, Net_pay, start) values 
('Mahi', 'Marketing', 'F', 3000000.00, 100000.00, 2000000.00, 500000.00, 1500000, '2018-11-20');
create table employee_department
(employee_id int unsigned not null,
foreign key (employee_id) references employee_payroll(id),
Department varchar(50) not null
);
desc employee_department;
insert into employee_department(employee_id, department) 
values(2,'sales'),(3,'Marketing');
select * from employee_department;
insert into employee_department(employee_id, department) 
values(1,'sales'),(4,'Marketing');
select * from employee_department;
select department from employee_department where employee_id = 3;
select department, count(department) from employee_department group by department;
select * from employee_department;
select * from employee_payroll;
