-- Year wise loan amount Statistics
USE bank;
SELECT COUNT(*) FROM f1;
SELECT COUNT(*) FROM f2;

SELECT 
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount,
    MIN(loan_amnt) AS min_loan_amount,
    MAX(loan_amnt) AS max_loan_amount,
    year(issue_d) as year
FROM f1
group by year(issue_d);
    
ALTER TABLE bank.f1
CHANGE COLUMN `ï»¿id` id INT; 
ALTER TABLE bank.f2
CHANGE COLUMN `ï»¿id` id INT; 


-- Grade and sub grad wise revol_bal
SELECT f1.grade,f1.sub_grade,SUM(f2.revol_bal) AS total_revol_bal
FROM f1
JOIN f2 ON f1.id = f2.id
GROUP BY f1.grade, f1.sub_grade;
    
-- Total Payment for Verified Status Vs Total Payment for Non Verified Status
SELECT f1.verification_status,ROUND(SUM(f2.total_pymnt), 2) AS Total_Payment
FROM f1
JOIN f2 ON f1.id = f2.id
WHERE f1.verification_status IN ('Verified', 'Not Verified')
GROUP BY f1.verification_status;

-- State wise and month wise loan status
SELECT city_name,date_format(issue_d,'%b') as month
,loan_status
FROM f1
GROUP BY city_name, issue_d, loan_status
ORDER BY city_name, issue_d, loan_status;

ALTER TABLE bank.f1
CHANGE COLUMN `City Name` city_name VARCHAR(255);


-- Home ownership Vs last payment date stats
select f1.home_ownership, f2.last_pymnt_d
from f1
join f2 on f1.id=f2.id
group by f1.home_ownership, f2.last_pymnt_d;







