SELECT 'Клиенты' as таблица, COUNT(*) as количество FROM clients
UNION ALL
SELECT 'Типы абонементов', COUNT(*) FROM membership_types
UNION ALL
SELECT 'Абонементы', COUNT(*) FROM memberships
UNION ALL
SELECT 'Посещения', COUNT(*) FROM visits
UNION ALL
SELECT 'Статусы абонементов', COUNT(*) FROM membership_statuses;