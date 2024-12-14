DROP SCHEMA IF EXISTS PALESTRA;

CREATE SCHEMA PALESTRA;

USE PALESTRA;

-- CREAZIONE TAB ALLIEVO
CREATE TABLE ALLIEVO(
ID_ALLIEVO INT PRIMARY KEY AUTO_INCREMENT
, NOME VARCHAR(25)
, COGNOME VARCHAR(15)
, DATA_NASCITA DATE
);

-- CREAZIONE TAB CORSO
CREATE TABLE CORSO(
ID_CORSO INT PRIMARY KEY AUTO_INCREMENT
, NOME VARCHAR(25)
, COSTO DECIMAL(6,2)
);

-- CREAZIONE TAB ISTRUTTORE
CREATE TABLE ISTRUTTORE(
ID_ISTRUTTORE INT PRIMARY KEY AUTO_INCREMENT
, NOME VARCHAR(25)
, COGNOME VARCHAR(15)
);

-- CREAZIONE TAB ATTIVITÀ
CREATE TABLE ATTIVITA(
ID_ATTIVITA INT PRIMARY KEY
, ID_ALLIEVO INT
, ID_CORSO INT
, CONSTRAINT FK_ALLIEVO_CORSO FOREIGN KEY (ID_ALLIEVO) REFERENCES ALLIEVO (ID_ALLIEVO)
, CONSTRAINT FK_ATTIVITA_CORSO FOREIGN KEY (ID_CORSO) REFERENCES CORSO (ID_CORSO)
);

-- CREAZIONE TAB ASSEGNAZIONE
CREATE TABLE ASSEGNAZIONE(
ID_ASSEGNAZIONE INT PRIMARY KEY
, ID_ISTRUTTORE INT
, ID_CORSO INT
, CONSTRAINT FK_ISTRUTTORE_CORSO FOREIGN KEY (ID_ISTRUTTORE) REFERENCES ISTRUTTORE (ID_ISTRUTTORE)
, CONSTRAINT FK_ASSEGNAZIONE_CORSO FOREIGN KEY (ID_CORSO) REFERENCES CORSO (ID_CORSO)
);



-- POPOLAMENTO GRAZIE A CHATGPT

-- Inserimento dei dati nella tabella ALLIEVO
INSERT INTO ALLIEVO (NOME, COGNOME, DATA_NASCITA) VALUES
('Luca', 'Rossi', '1990-05-15'),
('Marta', 'Verdi', '1985-11-23'),
('Giulia', 'Bianchi', '2000-01-30'),
('Alessandro', 'Ferrari', '1995-07-12'),
('Sofia', 'Romano', '1998-03-08'),
('Federico', 'Conti', '1992-09-19'),
('Chiara', 'Ricci', '1987-12-04'),
('Francesco', 'Marini', '1991-06-20'),
('Laura', 'Galli', '1993-10-05'),
('Marco', 'Esposito', '1989-04-25'),
('Giorgia', 'Bellini', '1995-02-14'),
('Lorenzo', 'Guerra', '1988-09-23'),
('Anna', 'Biancardi', '1997-06-12'),
('Davide', 'Pace', '1993-03-28'),
('Irene', 'Sanna', '1996-07-15'),
('Paolo', 'Monti', '1991-11-05'),
('Beatrice', 'Caruso', '1994-04-09'),
('Luigi', 'Ruggieri', '1990-01-20'),
('Elena', 'Fabbri', '1992-12-08'),
('Alberto', 'De Santis', '1987-05-30'),
('Claudia', 'Ferretti', '1998-09-17'),
('Giovanni', 'Serra', '1994-10-02'),
('Martina', 'Cattaneo', '1992-03-11'),
('Fabio', 'Giordani', '1989-08-24'),
('Veronica', 'Rizzo', '1995-06-06'),
('Silvia', 'Grimaldi', '1993-02-21'),
('Vincenzo', 'Testa', '1997-11-29'),
('Camilla', 'Lombardi', '1990-04-19'),
('Leonardo', 'Piazza', '1988-07-08'),
('Giada', 'Greco', '1991-01-13'),
('Matilde', 'Barbieri', '1996-10-30'),
('Dario', 'Contini', '1989-09-09'),
('Alice', 'Vitale', '1992-02-25'),
('Stefano', 'De Luca', '1994-05-15'),
('Lucia', 'Santini', '1995-08-12'),
('Tommaso', 'Cavalli', '1991-06-27'),
('Caterina', 'Marino', '1993-12-03'),
('Nicola', 'Galeazzi', '1990-09-19'),
('Federica', 'Pellegrino', '1997-07-05'),
('Andrea', 'Pagano', '1996-04-16'),
('Chiara', 'Mancini', '1988-11-07'),
('Ludovica', 'Russo', '1995-03-18'),
('Emanuele', 'Villa', '1991-12-22'),
('Alessandro', 'Morelli', '1992-08-25'),
('Monica', 'Carli', '1989-10-15'),
('Raffaele', 'Palmieri', '1994-02-09'),
('Margherita', 'Longo', '1990-11-11'),
('Vittoria', 'Parisi', '1993-01-04'),
('Pietro', 'Gallo', '1988-05-22'),
('Filippo', 'Amato', '1997-03-03'),
('Serena', 'Benvenuti', '1995-06-18'),
('Nicola', 'Moretti', '1992-01-15'),
('Giulia', 'Rossi', '1994-05-20'),
('Alessandro', 'Russo', '1988-07-11'),
('Elisa', 'Fabbri', '1991-09-29'),
('Giacomo', 'Villa', '1995-04-02'),
('Simona', 'Mariani', '1993-03-14'),
('Edoardo', 'Bianchi', '1990-08-21'),
('Anna', 'Giordano', '1997-10-12'),
('Stefano', 'Costa', '1996-11-08'),
('Sara', 'Martelli', '1992-02-03'),
('Lorenzo', 'Riva', '1991-06-24'),
('Maria', 'Orlandi', '1993-12-17'),
('Giorgio', 'Fontana', '1998-09-05'),
('Martina', 'Serra', '1994-10-26'),
('Tommaso', 'Ferrari', '1989-03-19'),
('Valeria', 'De Rosa', '1995-05-11'),
('Luca', 'Ricci', '1990-07-30'),
('Beatrice', 'Santoro', '1996-12-01'),
('Federico', 'Baroni', '1993-04-27'),
('Chiara', 'Benedetti', '1997-06-18'),
('Marco', 'Cattaneo', '1992-08-09'),
('Elena', 'Sartori', '1991-01-31'),
('Francesco', 'Rinaldi', '1998-05-23'),
('Alessia', 'Pagani', '1996-10-16'),
('Claudio', 'Greco', '1990-03-22'),
('Giada', 'Monti', '1994-08-25'),
('Matteo', 'Villa', '1993-09-18'),
('Veronica', 'Testa', '1991-02-15'),
('Davide', 'Leone', '1995-12-03'),
('Serena', 'Colombo', '1989-07-08'),
('Gabriele', 'Negri', '1992-09-27'),
('Camilla', 'Pellegrini', '1997-11-29'),
('Leonardo', 'Palmieri', '1990-06-07'),
('Alessandra', 'Caruso', '1994-04-16'),
('Giovanni', 'Martini', '1993-01-20'),
('Lucia', 'De Angelis', '1995-03-02'),
('Vincenzo', 'Fiorentino', '1996-11-13'),
('Ilaria', 'Galli', '1991-08-14'),
('Giacomo', 'Bianco', '1992-10-06'),
('Marta', 'Verdi', '1990-12-09'),
('Filippo', 'Romano', '1994-06-28'),
('Silvia', 'Lombardi', '1988-07-17'),
('Andrea', 'De Santis', '1997-02-22'),
('Alessio', 'Marchetti', '1990-01-29'),
('Margherita', 'Gentile', '1993-11-01'),
('Roberto', 'Ferraro', '1991-04-04'),
('Paola', 'Toscano', '1998-09-13'),
('Daniele', 'Basili', '1996-03-07'),
('Sara', 'Montanari', '1992-12-20'),
('Carlo', 'Santi', '1995-01-16');


-- Inserimento dei dati nella tabella CORSO
INSERT INTO CORSO (NOME, COSTO) VALUES
('Yoga per principianti', 20.00),
('Pilates avanzato', 60.00),
('CrossFit', 60.00),
('Spinning', 30.00),
('Zumba Fitness', 25.00),
('Functional Training', 60.00),
('Boxe amatoriale', 30.00),
('Total Body Workout', 25.00),
('Stretching e Mobilità', 25.00),
('HIIT (High Intensity)', 65.00);

-- Inserimento dei dati nella tabella ISTRUTTORE
INSERT INTO ISTRUTTORE (NOME, COGNOME) VALUES
('Elisa', 'Moretti'),
('Matteo', 'Bruni'),
('Valentina', 'De Angelis'),
('Simone', 'Coppola'),
('Alessia', 'Fiore'),
('Riccardo', 'Pellegrini'),
('Francesca', 'Orlandi'),
('Daniele', 'Riva'),
('Sara', 'Santoro'),
('Andrea', 'Vitali'),
('Giorgio', 'Bianchi'),
('Luca', 'Verdi'),
('Maria', 'Neri'),
('Elena', 'Rossi'),
('Giovanni', 'Gialli');


-- Inserimento dei dati nella tabella ATTIVITA
INSERT INTO ATTIVITA (ID_ATTIVITA, ID_ALLIEVO, ID_CORSO) VALUES
(1, 1, 5), (2, 2, 5), (3, 3, 5), (4, 4, 5), (5, 5, 5), (6, 6, 5), (7, 7, 5), (8, 8, 5), (9, 9, 5), (10, 10, 5),
(11, 11, 5), (12, 12, 5), (13, 13, 5), (14, 14, 5), (15, 15, 5), (16, 16, 5), (17, 17, 5), (18, 18, 5), (19, 19, 5), (20, 20, 5),
(21, 21, 5), (22, 22, 5), (23, 23, 5), (24, 24, 5), (25, 25, 7), (26, 26, 7), (27, 27, 7), (28, 28, 7), (29, 29, 7), (30, 30, 7),
(31, 31, 7), (32, 32, 7), (33, 33, 7), (34, 34, 7), (35, 35, 7), (36, 36, 7), (37, 37, 7), (38, 38, 7), (39, 39, 7), (40, 40, 7),
(41, 41, 7), (42, 42, 7), (43, 43, 1), (44, 44, 1), (45, 45, 1), (46, 46, 1), (47, 47, 2), (48, 48, 2), (49, 49, 2), (50, 50, 2),
(51, 51, 3), (52, 52, 3), (53, 53, 3), (54, 54, 3), (55, 55, 4), (56, 56, 4), (57, 57, 4), (58, 58, 4), (59, 59, 6), (60, 60, 6),
(61, 61, 6), (62, 62, 6), (63, 63, 8), (64, 64, 8), (65, 65, 8), (66, 66, 8), (67, 67, 10), (68, 68, 10), (69, 69, 10), (70, 70, 10),
(71, 71, 10), (72, 72, 6), (73, 73, 8), (74, 74, 1), (75, 75, 3), (76, 76, 7), (77, 77, 9), (78, 78, 5), (79, 79, 7), (80, 80, 9),
(81, 81, 9), (82, 82, 1), (83, 83, 5), (84, 84, 8), (85, 85, 10), (86, 86, 6), (87, 87, 7), (88, 88, 1), (89, 89, 3), (90, 90, 2),
(91, 91, 5), (92, 92, 7), (93, 93, 10), (94, 94, 5), (95, 95, 7), (96, 96, 10), (97, 97, 4), (98, 98, 6), (99, 99, 5), (100, 100, 7),
(101, 101, 7);


-- Inserimento dei dati nella tabella ASSEGNAZIONE
INSERT INTO ASSEGNAZIONE (ID_ASSEGNAZIONE, ID_ISTRUTTORE, ID_CORSO) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 2),
(4, 4, 7),
(5, 5, 4),
(6, 6, 5),
(7, 7, 6),
(8, 8, 7), 
(9, 9, 8), 
(10, 10, 10),
(11, 11, 10),
(12, 12, 5),
(13, 13, 1),
(14, 14, 3),
(15, 15, 1),
(16, 1, 6),
(17, 2, 7),
(18, 3, 8),
(19, 4, 9),
(20, 5, 4);



