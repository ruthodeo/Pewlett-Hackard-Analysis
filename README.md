# Pewlett-Hackard Analysis

## Overview of the analysis: 

Pewlett-Hackard is a big company that have many employees, some employees are starting to retire and the management  wants to be preparate for the future.
For that reason he ask to help him to analyse and determine the number of retiring employees selecting by birth of date, by title, by name, by date to date and who employeers are elegible to participate in the mentorship program that hey offer.

### Results:

1. It is surprising that the more amount of retirement of employees are on the more high areas such as Senior Engineer, Senior Staff, Engineer and staff, followed by techniqye Leader and Assitant Engineer.
2. The number of employees that are on the list for retirement are in total 90, 398 
3. The titles that aplied to works as mentoring are : Staff, Technique leader, Senior Staff , Senior engineer and Engineer.

       SELECT emp.emp_no, emp.first_name, emp.last_name,
             ti.title, ti.from_date, ti.to_date
       INTO retirement_titles
       FROM employees as emp
       LEFT JOIN titles as ti 
       ON emp.emp_no = ti.emp_no
       Where (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
       ORDER BY emp.emp_no;

       SELECT * FROM retirement_titles;
       
<img width="780" alt="retirement_titles" src="https://user-images.githubusercontent.com/82455263/121600573-491c3080-ca0a-11eb-870e-998ae953123c.png">

     
        SELECT DISTINCT ON (emp_no) emp_no,
       first_name,
       last_name,
       title

       INTO Unique_titles
       FROM retirement_titles
       ORDER BY emp_no, to_date DESC;

       SELECT * FROM unique_titles;
 
 <img width="583" alt="unique_titles" src="https://user-images.githubusercontent.com/82455263/121600506-2be76200-ca0a-11eb-9e92-244516907e6d.png">

      SELECT COUNT(unique_titles) AS number_of_titles, title 
      INTO retiring_titles
      FROM unique_titles
      GROUP BY title
      ORDER BY number_of_titles DESC;
      SELECT * FROM retiring_titles;
      DROP TABLE retiring_titles CASCADE;

<img width="250" alt="retiring_titles" src="https://user-images.githubusercontent.com/82455263/121600606-52a59880-ca0a-11eb-9f42-28ef6a58ccf1.png">


      SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name,
                              emp.birth_date ,ti.title, ti.from_date, ti.to_date
      INTO mentorship_eligibilty
      FROM employees as emp
           left JOIN dept_emp as dep
           ON (emp.emp_no = dep.emp_no) 
           left JOIN titles as ti
           ON (emp.emp_no = dep.emp_no)
      WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
      ORDER BY emp_no;

      SELECT * FROM mentorship_eligibilty;
      DROP TABLE mentorship_eligibilty CASCADE;

<img width="855" alt="mentoring_titles" src="https://user-images.githubusercontent.com/82455263/121600611-56d1b600-ca0a-11eb-974e-df09d120bcd8.png">


## Summary: 

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

    It will need to be feeled 90,398 spaces.

<img width="250" alt="retiring_titles" src="https://user-images.githubusercontent.com/82455263/121601230-4a019200-ca0b-11eb-887b-157534255a42.png">

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

    It will be necessary to do another kind of analysis because having the knowlege of something it means the retirement employee is going to be ready to mentor the next generation of Pewlett Hackard emploees.

    However i believe with the years of experience and an aditional capatitation course, that employee that is retiring will be more than ready to mentor the next generation of employees.
