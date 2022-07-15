-- Create the main table
CREATE TABLE employees (
	age INT Not NULL,
	attrition VARCHAR NOT NULL,
	businesstravel VARCHAR NOT NULL,
	dailyrate INT Not NULL,
	department VARCHAR NOT NULL,
	distancefromhome INT Not NULL,
	education INT Not NULL,
	educationfield VARCHAR NOT NULL,
	employeecount INT Not NULL,
	employeenumber INT Not NULL,
	environmentsatisfaction INT Not NULL,
	gender VARCHAR NOT NULL,
	hourlyrate INT Not NULL,
	jobinvolvement INT Not NULL,
	joblevel INT Not NULL,
	jobrole VARCHAR NOT NULL,
	jobsatisfaction INT Not NULL,
	maritalstatus VARCHAR NOT NULL,
	monthlyincome INT Not NULL,
	monthlyrate INT Not NULL,
	numcompaniesworked INT Not NULL,
	over18 VARCHAR NOT NULL,
	overtime VARCHAR NOT NULL,
	percentsalaryhike INT Not NULL,
	performancerating INT Not NULL,
	relationshipsatisfaction INT Not NULL,
	standardhours INT Not NULL,
	stockoptionlevel INT Not NULL,
	totalworkingyears INT Not NULL,
	trainingtimeslastyear INT Not NULL,
	worklifebalance INT Not NULL,
	yearsatcompany INT Not NULL,
	yearsincurrentrole INT Not NULL,
	yearssincelastpromotion INT Not NULL,
	yearswithcurrmanager INT Not NULL,
	
    PRIMARY KEY (EmployeeNumber) );
--- Create features table
Select
	Age,
	Department,
	EmployeeNumber,
	Gender,
	HourlyRate,
	JobLevel,
	MaritalStatus,
	NumCompaniesWorked,
	PercentSalaryHike,
	PerformanceRating,
	StockOptionLevel,
	TotalWorkingYears,
	TrainingTimesLastYear,
	WorkLifeBalance,
	YearsAtCompany,
	YearsInCurrentRole,
	YearsSinceLastPromotion,
INTO features
from employees;
--- Create Target table
Select
	attrition,
	employeenumber
INTO target
from employees;

--- Joining Target + Features tables
Select
	t.Attrition,
	f.Age,
	f.Department,
	f.EmployeeNumber,
	f.Gender,
	f.HourlyRate,
	f.JobLevel,
	f.MaritalStatus,
	f.NumCompaniesWorked,
	f.PercentSalaryHike,
	f.PerformanceRating,
	f.StockOptionLevel,
	f.TotalWorkingYears,
	f.TrainingTimesLastYear,
	f.WorkLifeBalance,
	f.YearsAtCompany,
	f.YearsInCurrentRole,
	f.YearsSinceLastPromotion
INTO joint_table
from features as f
inner join target as t
ON (f.EmployeeNumber = t.EmployeeNumber);
    