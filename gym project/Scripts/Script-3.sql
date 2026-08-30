SELECT 'Клиенты' as таблица, COUNT(*) as количество FROM clients
UNION ALL
SELECT 'Абонементы', COUNT(*) FROM memberships
UNION ALL
SELECT 'Посещения', COUNT(*) FROM visits;