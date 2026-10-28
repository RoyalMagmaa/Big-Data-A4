-- Table : Patient
CREATE TABLE "Patient" (
    "Id_patient"      INTEGER,
    "Nom"             VARCHAR(20),
    "Prenom"          VARCHAR(23),
    "Sexe"            VARCHAR(6),
    "Adresse"         VARCHAR(100),
    "Ville"           VARCHAR(100),
    "Code_postal"     VARCHAR(5),     -- INT sur le schéma : perdrait le 0 initial (01000 -> 1000)
    "Pays"            VARCHAR(2),
    "EMail"           VARCHAR(100),
    "Tel"             VARCHAR(25),
    "Date"            DATE,           -- date de naissance
    "Age"             INTEGER,
    "Num_Secu"        VARCHAR(16),
    "Groupe_sanguin"  VARCHAR(3),
    "Poid"            NUMERIC(4,1),   -- INT sur le schéma : perdrait les décimales (87.6 -> 88)
    "Taille"          INTEGER,
    CONSTRAINT "Patient_pkey" PRIMARY KEY ("Id_patient")
);
