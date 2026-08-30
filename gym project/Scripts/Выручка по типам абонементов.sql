SELECT 
    mt.name AS Тип_абонемента,
    mp.price AS Цена,
    COUNT(m.membership_id) AS Продано_абонементов,
    mp.price * COUNT(m.membership_id) AS Общая_выручка
FROM membership_types mt
JOIN membership_prices mp ON mt.membership_type_id = mp.membership_type_id
JOIN memberships m ON mt.membership_type_id = m.membership_type_id
GROUP BY mt.membership_type_id, mt.name, mp.price
ORDER BY Общая_выручка DESC;