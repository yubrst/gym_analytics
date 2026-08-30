SELECT 
    c.last_name || ' ' || c.first_name AS Клиент,
    mt.name AS Тип_абонемента,
    COUNT(v.visit_id) AS Количество_посещений,
    SUM(CASE WHEN v.movement_type_id = 1 THEN 1 ELSE 0 END) AS Входов,
    SUM(CASE WHEN v.movement_type_id = 2 THEN 1 ELSE 0 END) AS Выходов
FROM clients c
JOIN memberships m ON c.client_id = m.client_id
JOIN membership_types mt ON m.membership_type_id = mt.membership_type_id
LEFT JOIN visits v ON m.membership_id = v.membership_id
GROUP BY c.client_id, c.last_name, c.first_name, mt.name
ORDER BY Количество_посещений DESC;