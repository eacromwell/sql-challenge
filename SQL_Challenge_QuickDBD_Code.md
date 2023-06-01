
### For use with http://app.quickdatabasediagrams.com/


employees as emp
---
emp_no int PK FK - dept_emp.emp_no
emp_title_id VARCHAR FK >- titles.title_id
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date DATE

titles as ttl
---
title_id PK VARCHAR
title VARCHAR

dept_emp as deptemp
---
emp_no int PK
dept_no VARCHAR PK FK >- depts.dept_no

departments as depts
---
dept_no PK VARCHAR FK -< dept_manager.dept_no
dept_name VARCHAR

dept_manager as deptmgr
---
dept_no VARCHAR
emp_no int PK FK -< employees.emp_no

salaries as sal
---
emp_no PK int FK - employees.emp_no
salary money