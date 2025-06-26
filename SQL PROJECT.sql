use project;
show tables;

-- list the all records from the organ donation dataset
select * from organ_donation_india;

-- show all organ donation data for the year 2023
select * from organ_donation_india where year=2023;

-- Which states had more than 500 total transplants
SELECT State, Total Transplants FROM organ_donation_india WHERE Total_Transplants > 500;

-- find the total number of transplants in each year
SELECT Year, SUM(Total_Transplants) AS Total_Yearly_Transplants FROM organ_donation_india GROUP BY Year;

-- List the top 5 states with the highest deceased donors
SELECT State, Deceased_Donors FROM organ_donation_india ORDER BY Deceased_Donors DESC LIMIT 5;

-- Calculate the average number of liver transplants per state
SELECT AVG(Liver_Transplants) AS Avg_Liver_Transplants FROM organ_donation_india;

-- Find the state with the highest organ donation rate
SELECT State, Organ_Donation_Rate FROM organ_donation_india ORDER BY Organ_Donation_Rate DESC LIMIT 1;

-- Get total kidney and liver transplants per year
SELECT Year, SUM(Kidney_Transplants) AS Total_Kidney, SUM(Liver_Transplants) AS Total_Liver
FROM organ_donation_india
GROUP BY Year;

-- which year had the highest number of online pledges
SELECT Year, SUM(Online_Pledges) AS Total_Pledges FROM organ_donation_india GROUP BY Year ORDER BY Total_Pledges DESC LIMIT 1;

-- show the percentage of women donors out of the total donors for each state
SELECT State, 
       Women_Donors,
       (Women_Donors * 100.0) / (Women_Donors + Men_Donors + Transgender_Donors) AS Women_Percentage
FROM organ_donation_india;

-- Find states where living donors are more than decased donors
SELECT State, Living_Donors, Deceased_Donors 
FROM organ_donation_india
WHERE Living_Donors > Deceased_Donors;

-- which state had the most heart transplatns in 2024
SELECT State, Heart_Transplants 
FROM organ_donation_india
WHERE Year = 2024
ORDER BY Heart_Transplants DESC
LIMIT 1;

-- calculate the total number of transplants by state over all years
SELECT State, SUM(Total_Transplants) AS Total_All_Years 
FROM organ_donation_india
GROUP BY State;

-- List all states with a donation rate greater than the national average
SELECT * 
FROM organ_donation_india 
WHERE Organ_Donation_Rate > (SELECT AVG(Organ_Donation_Rate) FROM organ_donation_india);


-- Find the year with the highest total number of people peldged 
SELECT Year, SUM(People_Pledged) AS Total_Pledged
FROM organ_donation_india
GROUP BY Year
ORDER BY Total_Pledged DESC
LIMIT 1;
