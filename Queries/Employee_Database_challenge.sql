--Deliverable 1: The Number of Retiring Employees by Title

-- create a final table that has the number of retirement-age employees by most recent job title.
SELECT emp.emp_no, emp.first_name, emp.last_name,
       ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as emp
LEFT JOIN titles as ti 
ON emp.emp_no = ti.emp_no
Where (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO Unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(unique_titles) AS number_of_titles, title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY number_of_titles DESC;
SELECT * FROM retiring_titles;
DROP TABLE retiring_titles CASCADE;


-- Deliverable 2: The Employees Eligible for the Mentorship Program

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