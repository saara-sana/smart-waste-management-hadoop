SELECT Waste_Type,
       COUNT(*) AS total_entries,
       AVG(Fill_Level_Percent) AS avg_fill_percentage
FROM waste_data
GROUP BY Waste_Type
ORDER BY avg_fill_percentage DESC;
