create database bottle;
use bottle;
show tables;
select * from practice1; 

-- What is the total number of employees?
select count(DailyRate) from practice1;

alter table practice1 rename column  ï»¿Age to age;

-- What is the average age of employees?
select avg(age) from practice1;

-- How many employees are in each department?
select department,count(*) from practice1
group by department;

-- What is the gender distribution across all employees?
select gender,count(*) from practice1
 group by gender;
 
 
 -- Attrition and Retention
 
--  What is the total number of employees who left the company (Attrition = 'Yes')?
 select attrition,count(attrition="yes") from practice1
 where attrition="yes";

-- What is the attrition rate in each department?
SELECT Department,COUNT(*) AS Total_Employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
  ROUND(
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
    2
  ) AS Attrition_Rate_Percent
FROM practice1
GROUP BY Department;
  
-- What is the attrition rate by job role?
select jobrole,count(*) as total_employees,
sum(case when attrition="yes" then 1 else 0 end) as attritions,
round(
sum(case when attrition="yes" then 1 else 0 end)*100.0/count(*),2) as attrition_rate_percent
from practice1
group by jobrole;

-- What is the average age of employees who left the company?
 select attrition,avg(age) from practice1
 where attrition="yes";
 
 -- What is the percentage of attrition among employees who do overtime?
 SELECT JobRole,COUNT(*) AS Total_Employees,
  SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) AS Overtime_Count,
  ROUND(
    SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
  ) AS Percentage_Overtime FROM practice1
GROUP BY JobRole;

-- Income and Salary Analysis

-- What is the average monthly income for each job role?
select jobrole,avg(monthlyincome) from practice1
group by jobrole;

-- Which salary slab has the highest number of employees?
 SELECT monthlyincome, MAX(employeenumber)
FROM practice1
GROUP BY monthlyincome;

-- What is the average monthly income by department
select department,avg(monthlyincome) from practice1
group by department;

-- What is the average salary hike for each performance rating?
select performancerating,avg(monthlyincome) from practice1
group by performancerating;

-- Find the top 5 job roles with the highest average monthly income.
select jobrole,max(monthlyincome) from practice1
group by jobrole limit 5;


-- jobrole and satisfaction

-- What is the average job satisfaction for each job role?
select jobrole,avg(jobsatisfaction) from practice1
group by jobrole;


-- Which job role has the most employees?
select jobrole,max(employeecount) from practice1
group by jobrole;

-- What is the relationship between job level and monthly income?
select joblevel,avg(monthlyincome),max(monthlyincome),min(monthlyincome),count(*) as numemployees from practice1
group by joblevel;

-- What is the average job involvement by department?
select department,avg(jobinvolvement) from practice1
group by department;

-- What is the average environment satisfaction based on age groups?
select age ,avg(environmentsatisfaction) from practice1
group by age;

-- Work-Life Balance & Tenure

-- What is the average work-life balance rating across the company?
select avg(worklifebalance)from practice1;

-- What is the average number of years employees have worked at the company?
select avg(yearsatcompany) from practice1;

-- Which department has the longest average years with current manager?
select department,avg(yearswithcurrmanager),max(yearswithcurrmanager) from practice1
group by department;

-- What is the average time since last promotion by job level?
select joblevel ,avg(yearssincelastpromotion) from practice1
group by joblevel;

-- What is the average number of training sessions attended per year?
select avg(trainingtimeslastyear)  from practice1 ;

-- performance  and permotion
-- What is the distribution of performance ratings across employees?
select count(performancerating),max(performancerating) from practice1;

-- What is the average percent salary hike for employees who got promoted recently?
select YearsSinceLastPromotion as promoted_recently,avg(percentsalaryhike) from practice1
group by YearsSinceLastPromotion;

-- How many employees have never been promoted?
select count(YearsSinceLastPromotion) from practice1
where yearssincelastpromotion=0;

-- What is the average performance rating based on years at company?
select  yearsatcompany,avg(performancerating) from practice1
group by yearsatcompany;

-- What is the average relationship satisfaction by marital status?
select maritalstatus,avg(relationshipsatisfaction) from practice1
group by maritalstatus;

--  Overtime & Travel

-- How many employees work overtime in each department?
select department,count(overtime) from practice1
where overtime="yes"
group by department;

-- What is the average monthly income of employees who do not work overtime?
select overtime,avg(monthlyincome) from practice1
where overtime="no"
group by overtime;

-- Which business travel category has the highest number of employees?
SELECT BusinessTravel, COUNT(*) AS NumEmployees
FROM practice1
GROUP BY BusinessTravel
ORDER BY NumEmployees DESC
LIMIT 1;

-- What is the attrition rate among frequent travelers?
select businesstravel,count(attrition="yes")
from practice1
where businesstravel="travel_frequently";

-- Education & Field

-- What is the distribution of employees by education field?

select educationfield,count(*) as num_employees from practice1
group by educationfield
order by num_employees desc;

-- What is the average monthly income by education level?
select education as education_level,avg(monthlyincome) from practice1
group by education;

-- Which education field has the highest average performance rating?
select educationfield,avg(performancerating) as p_r
from practice1
group by educationfield
order by p_r desc limit 1;


--  Distance & Commute

-- What is the average distance from home by department?
select department,avg(distancefromhome) from practice1
group by department;


