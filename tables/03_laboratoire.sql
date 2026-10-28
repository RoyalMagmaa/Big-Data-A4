-- Table : Laboratoire
CREATE TABLE Laboratoire (
    Id_labo      INTEGER      PRIMARY KEY,
    Laboratoire  VARCHAR(200) NOT NULL UNIQUE,  -- "U" sur le schéma
    Pays         VARCHAR(100)
);
