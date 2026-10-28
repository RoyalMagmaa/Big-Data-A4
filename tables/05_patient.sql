-- Table : Patient
CREATE TABLE Patient (
    Id_patient      INTEGER      PRIMARY KEY,
    Nom             VARCHAR(20),
    Prenom          VARCHAR(23),
    Sexe            VARCHAR(6),
    Adresse         VARCHAR(100),
    Ville           VARCHAR(100),
    Code_postal     INTEGER,
    Pays            VARCHAR(2),
    EMail           VARCHAR(100),
    Tel             VARCHAR(25),
    Date            DATE,           -- probablement la date de naissance
    Age             INTEGER,
    Num_Secu        VARCHAR(16),
    Groupe_sanguin  VARCHAR(3),
    Poid            INTEGER,
    Taille          INTEGER
);
