--  Identify all records where the Duration of the call is 0 or negative, 
-- or where the PurchaseAmount is negative.

SELECT
    CallNumber,
    CustomerID,
    Duration,
    PurchaseAmount
FROM
    Call_details
WHERE
    Duration <= 0 OR PurchaseAmount < 0;
    
    
--  Find any calls where the SatisfactionRating is outside the expected range of 0.0 to 5.0 
SELECT
    CallNumber,
    CustomerID,
    SatisfactionRating
FROM
    Call_details
WHERE
    SatisfactionRating < 0.0 OR SatisfactionRating > 5.0;

