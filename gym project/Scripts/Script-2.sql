PRAGMA foreign_keys = OFF;

DELETE FROM visits;
DELETE FROM membership_statuses;
DELETE FROM memberships;
DELETE FROM membership_prices;
DELETE FROM clients;
DELETE FROM membership_types;
DELETE FROM movement_types;
DELETE FROM status_types;



INSERT INTO status_types (status_type_id, name) VALUES 
(1, 'Активен'),
(2, 'Заморожен'),
(3, 'Просрочен'),
(4, 'Исчерпан');

INSERT INTO movement_types (movement_type_id, name) VALUES 
(1, 'Вход'),
(2, 'Выход');

INSERT INTO membership_types (membership_type_id, name, visit_limit, duration) VALUES 
(1, 'Разовый', 1, 1),
(2, 'Месячный', 30, 30),
(3, 'Годовой', 365, 365),
(4, 'Безлимитный месяц', NULL, 30);


INSERT INTO clients (client_id, last_name, first_name, middle_name, phone, email, qr_code) VALUES 
(1, 'Иванова', 'Анна', 'Сергеевна', '+7-900-123-45-67', 'anna.ivanova@mail.ru', 'QR001'),
(2, 'Петров', 'Дмитрий', 'Александрович', '+7-900-234-56-78', 'dmitry.petrov@mail.ru', 'QR002'),
(3, 'Сидорова', 'Елена', 'Михайловна', '+7-900-345-67-89', 'elena.sidorova@mail.ru', 'QR003'),
(4, 'Козлов', 'Алексей', 'Владимирович', '+7-900-456-78-90', 'alexey.kozlov@mail.ru', 'QR004'),
(5, 'Новикова', 'Мария', 'Андреевна', '+7-900-567-89-01', 'maria.novikova@mail.ru', 'QR005');

INSERT INTO membership_prices (price_id, price_change_date, membership_type_id, price) VALUES 
(1, '2026-01-01', 1, 500.00),
(2, '2026-01-01', 2, 3000.00),
(3, '2026-01-01', 3, 25000.00),
(4, '2026-01-01', 4, 5000.00);

INSERT INTO memberships (membership_id, issue_date, client_id, membership_type_id) VALUES 
(101, '2026-08-01', 1, 2),
(102, '2026-08-05', 2, 3),
(103, '2026-08-10', 3, 1),
(104, '2026-08-12', 4, 4),
(105, '2026-08-15', 5, 2);


INSERT INTO membership_statuses (status_id, membership_id, issue_date, membership_type_id, status_change_date, status_type_id) VALUES 
(1, 101, '2026-08-01', 2, '2026-08-01 10:00:00', 1),
(2, 102, '2026-08-05', 3, '2026-08-05 11:30:00', 1),
(3, 103, '2026-08-10', 1, '2026-08-10 09:15:00', 1),
(4, 104, '2026-08-12', 4, '2026-08-12 14:00:00', 1),
(5, 105, '2026-08-15', 2, '2026-08-15 16:45:00', 1);


INSERT INTO visits (visit_id, visit_date, movement_type_id, membership_id, issue_date, membership_type_id) VALUES 
(1001, '2026-08-01', 1, 101, '2026-08-01', 2),
(1002, '2026-08-01', 2, 101, '2026-08-01', 2),
(1003, '2026-08-02', 1, 101, '2026-08-01', 2),
(1004, '2026-08-05', 1, 102, '2026-08-05', 3),
(1005, '2026-08-05', 2, 102, '2026-08-05', 3),
(1006, '2026-08-06', 1, 102, '2026-08-05', 3),
(1007, '2026-08-10', 1, 103, '2026-08-10', 1),
(1008, '2026-08-10', 2, 103, '2026-08-10', 1),
(1009, '2026-08-12', 1, 104, '2026-08-12', 4),
(1010, '2026-08-12', 2, 104, '2026-08-12', 4),
(1011, '2026-08-13', 1, 104, '2026-08-12', 4),
(1012, '2026-08-15', 1, 105, '2026-08-15', 2),
(1013, '2026-08-16', 1, 101, '2026-08-01', 2),
(1014, '2026-08-16', 2, 101, '2026-08-01', 2),
(1015, '2026-08-17', 1, 102, '2026-08-05', 3);


PRAGMA foreign_keys = ON;