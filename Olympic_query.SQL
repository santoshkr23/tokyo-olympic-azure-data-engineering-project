--Calculate the number of athletes from each country and count of athletes should be in decreasing order.
SELECT Country,COUNT(*) AS no_of_athletes FROM athletes GROUP BY Country ORDER BY COUNT(*) DESC;


--Calculate the total number of medals won by each country
SELECT 
Team_Country,
SUM(Gold) AS Total_Gold_Medal,
SUM(Silver) AS Total_Silver_Medal,
SUM(Bronze) AS Total_Bronze_Medal
FROM medals
GROUP BY Team_Country
ORDER BY Team_Country ASC;


--Count the total and average number of entries by gender for each discipline
WITH 
summ AS
(SELECT SUM(Male) AS Total_Male,SUM(Female) AS Total_Female, Discipline
FROM gender GROUP BY Discipline),
avgg AS 
( SELECT AVG(Male) AS Average_Male, AVG(Female) AS Average_Female, Discipline
FROM gender GROUP BY Discipline)
SELECT a.*,b.* FROM summ a INNER JOIN avgg b 
ON a.Discipline=b.Discipline;
