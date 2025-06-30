-- What is the average Duration of calls and the total PurchaseAmount for each FinancialYear?
SELECT
    FinancialYear,
    AVG(Duration) AS AverageCallDuration,
    SUM(PurchaseAmount) AS TotalPurchaseAmount
FROM
    Call_details
GROUP BY
    FinancialYear
ORDER BY
    FinancialYear;
    
    
-- Calculate the average PurchaseAmount for calls on each DayOfWeek.
SELECT
    DayOfWeek,
    AVG(PurchaseAmount) AS AveragePurchaseAmount
FROM
    Call_details
GROUP BY
    DayOfWeek
ORDER BY
    -- Order days of week logically for better interpretation
    CASE DayOfWeek
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;
    

-- Using a CTE, identify the top 5 Representatives based on their average SatisfactionRating,
-- and also show the total number of calls each of these representatives handled.
WITH RepresentativePerformance AS (
    SELECT
        Representative,
        AVG(SatisfactionRating) AS AverageSatisfactionRating,
        COUNT(CallNumber) AS TotalCallsHandled
    FROM
        Call_details
    GROUP BY
        Representative
)
SELECT
    Representative,
    AverageSatisfactionRating,
    TotalCallsHandled
FROM
    RepresentativePerformance
ORDER BY
    AverageSatisfactionRating DESC, TotalCallsHandled DESC
LIMIT 5;


-- For each City, determine the average SatisfactionRating and the total PurchaseAmount,
-- considering only calls made by customers who are older than 30 years.
SELECT
    cd.City,
    AVG(cdet.SatisfactionRating) AS AverageSatisfactionRating,
    SUM(cdet.PurchaseAmount) AS TotalPurchaseAmount
FROM
    customer_details cd
JOIN
    Call_details cdet ON cd.CustomerID = cdet.CustomerID
WHERE
    cd.Age > 30
GROUP BY
    cd.City
ORDER BY
    TotalPurchaseAmount DESC;
    
    
-- Identify customers who have made more calls than the overall average number of calls per customer.
-- For these specific customers, calculate their average SatisfactionRating and their total PurchaseAmount.
SELECT
    cdet.CustomerID,
    AVG(cdet.SatisfactionRating) AS AverageSatisfactionRating,
    SUM(cdet.PurchaseAmount) AS TotalPurchaseAmount,
    COUNT(cdet.CallNumber) AS NumberOfCalls
FROM
    Call_details cdet
WHERE
    cdet.CustomerID IN (
        SELECT
            CustomerID
        FROM
            Call_details
        GROUP BY
            CustomerID
        HAVING
            COUNT(CallNumber) > (SELECT AVG(CallsPerCustomer) FROM (SELECT COUNT(CallNumber) AS CallsPerCustomer FROM Call_details GROUP BY CustomerID) AS SubQueryAvg)
    )
GROUP BY
    cdet.CustomerID
ORDER BY
    NumberOfCalls DESC, TotalPurchaseAmount DESC;
    
    
-- Using a Window Function, calculate the running total of PurchaseAmount for each Representative,
-- ordered chronologically by DateOfCall.
SELECT
    Representative,
    DateOfCall,
    PurchaseAmount,
    SUM(PurchaseAmount) OVER (PARTITION BY Representative ORDER BY DateOfCall) AS RunningTotalPurchaseAmount
FROM
    Call_details
ORDER BY
    Representative, DateOfCall;
    
    
-- For consecutive calls made by the same CustomerID, calculate the time difference (in days)
-- between each subsequent call and the immediately preceding call. Use a CTE to structure your approach.
WITH CustomerCallSequence AS (
    SELECT
        CustomerID,
        DateOfCall,
        LAG(DateOfCall) OVER (PARTITION BY CustomerID ORDER BY DateOfCall) AS PreviousCallDate
    FROM
        Call_details
)
SELECT
    CustomerID,
    DateOfCall,
    PreviousCallDate,
    DATEDIFF(DateOfCall, PreviousCallDate) AS DaysSincePreviousCall
FROM
    CustomerCallSequence
WHERE
    PreviousCallDate IS NOT NULL -- Exclude the first call for each customer as it has no previous call
ORDER BY
    CustomerID, DateOfCall;
    
    
-- Determine the percentage of calls falling into each DurationBucket for calls that received
-- a SatisfactionRating of 4.0 or higher.
WITH HighSatisfactionCalls AS (
    SELECT
        DurationBucket,
        COUNT(CallNumber) AS CallsInBucket
    FROM
        Call_details
    WHERE
        SatisfactionRating >= 4.0
    GROUP BY
        DurationBucket
),
TotalHighSatisfactionCalls AS (
    SELECT
        COUNT(CallNumber) AS TotalCalls
    FROM
        Call_details
    WHERE
        SatisfactionRating >= 4.0
)
SELECT
    hsc.DurationBucket,
    hsc.CallsInBucket,
    (hsc.CallsInBucket / (SELECT TotalCalls FROM TotalHighSatisfactionCalls)) * 100 AS PercentageOfHighSatisfactionCalls
FROM
    HighSatisfactionCalls hsc
ORDER BY
    PercentageOfHighSatisfactionCalls DESC;

