# Pewlett_Hackard_Analysis
The Pewlett Hackard Co. trying to anticipate future retirement of employees so the company can develop a succession plan and manage HR resources effectively.  The information needed to perform the analyses is contained in 3 independent data tables and needed to be consolidated and refined.

## Overview Of Analysis
SQL 11.3/pg4Admin was used to perform the analysis.

The assignement was to develop a list of "Retiring Employees" from the employee.csv and title.csv.  The timeframe for eligible employees was 1-1-1952 to 12-31-1955. Columns used: employee number, first/last name, title, from_date, to_date and birth_date.  The "INNER JOIN" was used to combine employee.csv and title.csv datasets for the required columns. Employees that had several titles during their tenure, a "DISTINCT ON" statement and "ON ()" was used to remove duplicates.

![image](https://user-images.githubusercontent.com/89953246/137540909-da6e2400-a03e-4993-a215-524c49ccf431.png)

 A unique_titles table was created to reflect employees in current title.
 
 ![image](https://user-images.githubusercontent.com/89953246/137541033-0ac7a7c9-013a-4075-a6ce-7f45a6d6aefc.png)

In addition, a count of the number of employees in each title for the evaluation of future impact regarding key positions.

![image](https://user-images.githubusercontent.com/89953246/137541392-f5ce55e4-71b1-4946-b5f3-3626409177fd.png)


The company leadership requested information on employees that would benefit from a mentorship program.  This query focused on filtering the data on birth dates from 1-01-1965 to 12-31-1965 and who had a to_date of 9999-01-01

![image](https://user-images.githubusercontent.com/89953246/137544051-28b220ca-f437-4362-94f9-208cea04b416.png)

## Results
1. The first analysis of collecting of eligible employees for retirement and positions effected did not exclude employees that had already left the organization.
2. Total of over 90,000 positions was tabulated; when it was reduced to 72,458 employees. The two largest positions for both runs were Senior Engineer / Senior Staff.
3. Qualified employees from the mentorship_eligibility list will only cover 1,940 of the positions.  It is understandable why the exercise calls it a "tsunami".
4. ![image](https://user-images.githubusercontent.com/89953246/137547084-7b013d63-0e35-44a3-8f7c-9a1930b41864.png)

## Summary
There will need to be 72,458 roles to be filled when the data is filtered to current staff.  Roles that will be significantly impacted is Senior Engineers / Senior Staff.
For consideration is to expand the mentorship program eligibility dates, recommend an accelerated advancement and new-hire/replacement recruitment programs.
Future analyses should include yearly retirement rates per role and probability analysis to help predict future retirements.
