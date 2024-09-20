-- Create database and use it
CREATE DATABASE Zomato;
use Zomato;

-- 1. How many unique restaurants are listed in the dataset?
SELECT 
    COUNT(DISTINCT RESTAURANT_NAME) AS unique_restaurants
FROM
    Zomato_orders;

-- 2. Best city with the highest number of restaurants?
SELECT 
    city, COUNT(*) AS Total_orders
FROM
    Zomato_orders
GROUP BY city
ORDER BY Total_orders DESC
LIMIT 1;

-- 3. Top 5 Distribution of restaurants by cuisine type?
SELECT 
    CUSINE, COUNT(RESTAURANT_NAME) AS restaurant_count
FROM
    zomato_orders
GROUP BY CUSINE
ORDER BY restaurant_count DESC
LIMIT 5;

-- 4. Top 5 highest-rated restaurants?
SELECT 
    RESTAURANT_NAME, CITY, RATING
FROM
    zomato_orders
ORDER BY RATING DESC
LIMIT 5;

-- 5. Average rating of restaurants by city?
SELECT 
    CITY, ROUND(AVG(RATING), 2) AS average_rating
FROM
    zomato_orders
GROUP BY CITY
ORDER BY average_rating DESC;

-- 6. Is there a correlation between the number of ratings and average ratings?
SELECT 
    RATING, ROUND(AVG(RATING_COUNT), 2) AS avg_rating_count
FROM
    zomato_orders
GROUP BY RATING
ORDER BY RATING DESC
LIMIT 10;

-- 7. Percentage of restaurants offering online ordering?
SELECT 
    (COUNT(CASE
        WHEN ONLINE_ORDER = 'Yes' THEN 1
    END) * 100.0 / COUNT(*)) AS online_order_percentage
FROM
    zomato_orders;

-- 8. Cities with the most restaurants offering table reservations?
SELECT 
    CITY, COUNT(RESTAURANT_NAME) AS reservation_restaurants
FROM
    zomato_orders
WHERE
    TABLE_RESERVATION = 'Yes'
GROUP BY CITY
ORDER BY reservation_restaurants DESC
LIMIT 5;

-- 9. Top 5 cuisines based on the number of ratings received?
SELECT 
    CUSINE, SUM(RATING_COUNT) AS total_ratings
FROM
    zomato_orders
GROUP BY CUSINE
ORDER BY total_ratings DESC
LIMIT 5;

-- 10. Top 5 restaurants with the highest rating counts?
SELECT 
    RESTAURANT_NAME, CITY, RATING_COUNT
FROM
    zomato_orders
ORDER BY RATING_COUNT DESC
LIMIT 5;

-- 11. Restaurants offering both online ordering and table reservations?
SELECT 
    RESTAURANT_NAME, CITY
FROM
    zomato_orders
WHERE
    ONLINE_ORDER = 'Yes'
        AND TABLE_RESERVATION = 'Yes';

-- 12. Famous food items in the top-rated restaurants?
SELECT 
    RESTAURANT_NAME, FAMOUS_FOOD, RATING
FROM
    zomato_orders
ORDER BY RATING DESC
LIMIT 10;

-- 13. Most popular cuisines (based on restaurant count)?
SELECT 
    CUSINE, COUNT(RESTAURANT_NAME) AS cuisine_count
FROM
    zomato_orders
GROUP BY CUSINE
ORDER BY cuisine_count DESC
LIMIT 5;

-- 14. Top 5 restaurants in a specific city (e.g., 'Kolkata') based on ratings?
SELECT 
    RESTAURANT_NAME, AREA, RATING
FROM
    zomato_orders
WHERE
    CITY = 'Kolkata'
ORDER BY RATING DESC
LIMIT 5;
