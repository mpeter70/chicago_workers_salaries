

--change the NULL in hourly_rate, typical_hours and annual_salary  to zero and  create new columns per_hour, usual_hours and yearly_salary in a new table.





SELECT *, 
       ISNULL(hourly_rate, 0) AS rate_per_hour, 
       ISNULL(typical_hours, 0) AS usual_hours,
	   ISNULL(annual_salary, 0) AS yearly_salary
INTO PortfolioProject..city_workers
FROM PortfolioProject..chicago_workers_list;




--I droped columns typical_hours, hourly_rate and annual_salary.






ALTER TABLE PortfolioProject..city_workers DROP COLUMN typical_hours, hourly_rate, annual_salary;









-- I then sorted the table by department, yearly_salary DESC and rate_per_hour DESC which will organize the table better.




  
  
  
  SELECT *
	 INTO chicago_workers
     FROM PortfolioProject..city_workers
     ORDER BY department, 
              yearly_salary DESC, 
              rate_per_hour DESC;









--I queried who made a salary over $200,000.00 annualy. Four persons.



	
	
	
	
	
	SELECT *
	FROM  PortfolioProject..city_workers
	WHERE yearly_salary  >= 200000;







-- I ran a count of the number of salary workers that make under $200,000.00.  31,055 Workers.





SELECT COUNT(name)
FROM PortfolioProject..city_workers
WHERE yearly_salary  <= 200000;







-- I ran a count of the number of salary workers that make between $100,000.00 and $200,000.00.  7,600 persons.









SELECT COUNT(name)
FROM PortfolioProject..city_workers
WHERE yearly_salary BETWEEN 100000 AND 200000;







-- I ran a count of the number of salary workers that make between $50,000.00 and $100,000.00. 16,177 persons.







SELECT COUNT(name)
FROM PortfolioProject..city_workers
WHERE yearly_salary BETWEEN 50000 AND 100000;







--removed the apostrophe in value 'Mayor's Office' and created a new table.








SELECT *, REPLACE (department, '''', ' ') AS department_type
INTO	PortfolioProject..workers_city_employ
FROM PortfolioProject..city_workers









--droped department column.







ALTER TABLE PortfolioProject..workers_city_employ
DROP COLUMN department;







--ran a query that showed the next highest payed person in the Mayors Office.



SELECT *
FROM PortfolioProject..workers_city_employ
WHERE department_type = 'MAYOR S OFFICE' 
ORDER BY yearly_salary DESC offset 1 rows fetch next 1 rows only;






--average salary for a firefighter.






SELECT AVG( yearly_salary)
FROM PortfolioProject..workers_city_employ
WHERE job_titles = 'FIREFIGHTER' 
