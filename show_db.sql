create database Call_Center_db;

CREATE TABLE Call_details (
    CallNumber VARCHAR(20) PRIMARY KEY,      -- Unique identifier for each call
    CustomerID VARCHAR(20) NOT NULL,         -- Identifier for the customer
    Duration INT NOT NULL,                   -- Duration of the call in minutes/seconds (e.g., 116)
    Representative VARCHAR(10) NOT NULL,     -- Identifier for the customer service representative (e.g., R05)
    DateOfCall DATE NOT NULL,                -- Date when the call was made (e.g., 1-Jan-23)
    PurchaseAmount DECIMAL(10, 2) NOT NULL,  -- Amount of purchase during the call (e.g., 128)
    SatisfactionRating DECIMAL(3, 1) NOT NULL, -- Customer's satisfaction rating (e.g., 4.9)
    FinancialYear INT NOT NULL,              -- Financial year of the call (e.g., 2023)
    DayOfWeek VARCHAR(15) NOT NULL,          -- Day of the week the call occurred (e.g., Sunday)
    DurationBucket VARCHAR(50) NOT NULL,     -- Categorized duration of the call (e.g., 1 to 2 hours)
    RatingRounded INT NOT NULL               -- Rounded satisfaction rating (e.g., 5)
);

select * from call_details;



CREATE TABLE customer_details (
    CustomerID VARCHAR(20) PRIMARY KEY, -- Unique identifier for the customer (e.g., C0001)
    Gender VARCHAR(10) NOT NULL,        -- Gender of the customer (e.g., Male, Female)
    Age INT NOT NULL,                  -- Age of the customer
    City VARCHAR(50) NOT NULL          -- City where the customer resides (e.g., Columbus)
);

select * from customer_details;