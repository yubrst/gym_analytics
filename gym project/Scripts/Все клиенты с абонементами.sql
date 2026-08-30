SELECT 
    c.last_name || ' ' || c.first_name || ' ' || c.middle_name AS ФИО,
    c.phone AS Телефон,
    c.email AS Email,
    mt.name AS Тип_абонемента,
    m.issue_date AS Дата_оформления
FROM clients c
JOIN memberships m ON c.client_id = m.client_id
JOIN membership_types mt ON m.membership_type_id = mt.membership_type_id
ORDER BY m.issue_date DESC;