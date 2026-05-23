SELECT Waste_Type,
       COUNT(*) AS total_entries,
       AVG(Fill_Level_Percent) AS avg_fill_percentage
FROM waste_data
GROUP BY Waste_Type
ORDER BY avg_fill_percentage DESC;

SELECT SUBSTR(Timestamp,1,10) AS waste_date,
       COUNT(*) AS total_entries
FROM waste_data
GROUP BY SUBSTR(Timestamp,1,10)
ORDER BY waste_date;

SELECT TO_DATE(Timestamp) AS report_date,
       COUNT(*) AS total_records
FROM waste_data
GROUP BY TO_DATE(Timestamp)
ORDER BY report_date;

SELECT Zone,
       Waste_Type,
       COUNT(*) AS overflow_count
FROM waste_data
WHERE Fill_Level_Percent > 90
GROUP BY Zone, Waste_Type
ORDER BY overflow_count DESC;
