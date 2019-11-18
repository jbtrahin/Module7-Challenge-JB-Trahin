# Module7-Challenge-JB-Trahin

Module 7 challenge on performing an employee database analysis by applying knowledge of DataFrames and tabular data, creating entity relationship diagrams (ERDs), importing data into a database, troubleshooting common errors, and creating SQL queries that use data to answer questions.

## Project Overview

In this challenge, we will use advanced queries and joins to create a list of candidates for a mentorship program. To complete this task, you’ll use your knowledge of aliasing, filtering, and creating new tables and work on top of the PH-EmployeeDB database we created throughout the module.

The goals for this challenge are to:

1. Use an ERD to understand relationships between SQL tables.
2. Create new tables in pgAdmin by using different joins.
3. Write basic- to intermediate-level SQL statements.
4. Export new tables to a CSV file.

## Resources

- Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
- Database: PH-EmployeeDB  
- Software: pgAdmin 4.13, QuickDBD, Visual Studio Code 1.39.0

## Summary

Here is a visual of the ERD we worked with for this challenge:
![alt text](https://github.com/jbtrahin/Module7-Challenge-JB-Trahin/blob/master/EmployeeDB.png)

Here is the three queries used for the challenge in [challenge.sql](https://github.com/jbtrahin/Module7-Challenge-JB-Trahin/blob/master/queries/challenge.sql).

During the module, we created a new table called **retirement_info** using the [following query](https://github.com/jbtrahin/Pewlett-Hackard-Analysis/blob/master/queries/queries.sql) that we exported in a [retirement_info.csv](https://github.com/jbtrahin/Module7-Challenge-JB-Trahin/blob/master/data/module/retirement_info.csv). For QUERY 1 of the challenge (as labeled in challenge.sql), we query on top of that table. 

+-------------------------------------------------------------------------------------------------------------------------+

With QUERY 1, we retrieved all employee titles from **retirement info** and created a new table called **number_of_titles_retiring**. Table columns contain the following data:
- employee number
- first name
- last name
- title
- from date
- salary

Here is a visual of the first 5 rows that QUERY 1 returns:

| emp_no |    first_name   |     last_name   |      title         | from_date    |   salary    |
|:------:|:----------------|:----------------|:-------------------|:------------:|:-----------:|
| 10001  | Georgi          | Facello         | Senior Engineer    | 1986-06-26   | 60117       |
| 10004  | Christian       | Koblick         | Engineer           | 1986-12-01   | 40054       |
| 10004  | Christian       | Koblick         | Senior Engineer    | 1995-12-01   | 40054       |
| 10009  | Sumant          | Peac            | Assistant Engineer | 1985-02-18   | 60929       |
| 10009  | Sumant          | Peac            | Engineer           | 1990-02-18   | 60929       |


We exported the data into [number_of_titles_retiring.csv](https://github.com/jbtrahin/Module7-Challenge-JB-Trahin/blob/master/data/challenge_output/number_of_titles_retiring.csv).

+-------------------------------------------------------------------------------------------------------------------------+

With QUERY 2, we retrieved the frequency count of employee titles for retiring employees and created a new table called **retiring_employees_with_same_title**. Table columns contain the following data:
- title
- count of unique employees per title (using last title)

Here is a visual of what QUERY 2 returns:

| title              | count  |
|:-------------------|:------:|
| Assistant Engineer |     501|
| Engineer           |    4692|
| Manager            |       2|
| Senior Engineer    |   15600|
| Senior Staff       |   14735|
| Staff              |    3837|
| Technique Leader   |    2013|

We exported the data into [retiring_employees_with_same_title.csv](https://github.com/jbtrahin/Module7-Challenge-JB-Trahin/blob/master/data/challenge_output/retiring_employees_with_same_title.csv)

+-------------------------------------------------------------------------------------------------------------------------+

With QUERY 3, we retrieved a list of current employees who are ready for mentorship and created a new table called **whos_ready_for_a_mentor**. The criteria to be ready for mentorship is that your birthdate is between 01/01/1965 and 12/01/1965. Table columns contain the following data:
- employee number
- first name
- last name
- birth date
- current title (most recent title associated with employee number)
- first hire date (from date for the oldest title associated with employee number)
- to date (to filter for current employees)

Here is a visual of the first 5 rows that QUERY 3 returns:

| emp_no |    first_name   |     last_name   | birth_date  | current_title     |first_hire_date |   to_date  |
|:------:|:----------------|:----------------|:------------|:------------------|:--------------:|:----------:|
| 10095  | Hilari          | Morton          | 1965-01-03  |Senior Staff       | 1994-03-10     | 9999-01-01 |
| 10122  | Ohad            | Esposito        | 1965-01-19  |Technique Leader   | 1998-08-06     | 9999-01-01 |
| 10291  | Dipayan         | Seghrouchni     | 1965-01-23  |Senior Staff       | 1987-03-30     | 9999-01-01 |
| 10476  | Kokou           | Iisaka          | 1965-01-01  |Senior Staff       | 1987-09-20     | 9999-01-01 |
| 10663  | Teunis          | Noriega         | 1965-01-09  |Technique Leader   | 1993-01-23     | 9999-01-01 |


We exported the data into [whos_ready_for_a_mentor.csv](https://github.com/jbtrahin/Module7-Challenge-JB-Trahin/blob/master/data/challenge_output/whos_ready_for_a_mentor.csv)


## Further Analysis

When we look over the original set of data the was provided, we noticed that some employees have been at the company for many years and have held different titles over the years. When we take a look at salaries, we notice that there is only one salary per employee. We're making the assumption that this is the most recent salary associated with the most recent tile. 

It would be interesting to find every salary associated with every single title to be able to do an analysis on salary progression, as well as draw a comparison across departments, titles, age, gender. This would allow management to make adjustments and guarantee fairness across the workforce.






























