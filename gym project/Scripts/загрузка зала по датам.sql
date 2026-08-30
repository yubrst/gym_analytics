SELECT 
    v.visit_date AS Дата,
    COUNT(CASE WHEN v.movement_type_id = 1 THEN 1 END) AS Входы,
    COUNT(CASE WHEN v.movement_type_id = 2 THEN 1 END) AS Выходы,
    COUNT(CASE WHEN v.movement_type_id = 1 THEN 1 END) - 
    COUNT(CASE WHEN v.movement_type_id = 2 THEN 1 END) AS Текущая_загрузка
FROM visits v
GROUP BY v.visit_date
ORDER BY v.visit_date;