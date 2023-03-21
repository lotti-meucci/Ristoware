-- MariaDB

DROP DATABASE IF EXISTS ristoware;
CREATE DATABASE ristoware;
USE ristoware;

CREATE TABLE utente
(
  id VARCHAR(16) PRIMARY KEY,
  hash VARCHAR(255)
);

INSERT INTO utente VALUES
  ("admin", NULL),
  ("cuoco", NULL),
  ("cameriere", NULL),
  ("cassiere", NULL);

CREATE TABLE supplemento
(
  id VARCHAR(16) PRIMARY KEY,
  costo DECIMAL(8, 2)
);

INSERT INTO supplemento VALUES
  ("coperto", 0),
  ("asporto", 0);

-- Se il costo aggiuntivo è nullo allora l'ingrediente non può fare da aggiunta.
CREATE TABLE ingrediente
(
  id BINARY(16) PRIMARY KEY,  -- UUID
  nome VARCHAR(255) NOT NULL UNIQUE,
  presente BOOL NOT NULL,
  note VARCHAR(1023),
  costo_aggiuntivo DECIMAL(8, 2)
);

CREATE TABLE piatto
(
  id BINARY(16) PRIMARY KEY,  -- UUID
  nome VARCHAR(255) NOT NULL UNIQUE,
  costo DECIMAL(8, 2) NOT NULL,
  note VARCHAR(1023),
  path_foto VARCHAR(1023)
);

CREATE TABLE composizione
(
  id_piatto BINARY(16) NOT NULL,  -- UUID
  id_ingrediente BINARY(16) NOT NULL,  -- UUID
  FOREIGN KEY (id_piatto) REFERENCES piatto(id),
  FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id),
  PRIMARY KEY (id_piatto, id_ingrediente)
);

CREATE TABLE ordine
(
  id BINARY(16) PRIMARY KEY,  -- UUID
  confermato BOOL NOT NULL,
  tavolo VARCHAR(16),
  note VARCHAR(1023),
  orario_asporto DATETIME,
  
  -- Se il tavolo non è nullo, l'ordine è locale,
  -- altrimenti se l'orario d'asporto non è nullo, l'ordine è online.
  CHECK (tavolo IS NULL XOR orario_asporto IS NULL)
);

CREATE TABLE richiesta
(
  id BINARY(16) PRIMARY KEY,  -- UUID
  id_ordine BINARY(16) NOT NULL,  -- UUID
  id_piatto BINARY(16) NOT NULL,  -- UUID
  note VARCHAR(1023)
);

CREATE TABLE aggiunta
(
  id BINARY(16) PRIMARY KEY,  -- UUID
  id_richiesta BINARY(16) NOT NULL,
  id_ingrediente BINARY(16) NOT NULL,
  FOREIGN KEY (id_richiesta) REFERENCES richiesta(id),
  FOREIGN KEY (id_ingrediente) REFERENCES ingrediente(id)
)
