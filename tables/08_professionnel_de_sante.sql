-- Table : Professionnel_de_sante
-- Un professionnel a une spécialité (1), une spécialité concerne 0..N professionnels.
CREATE TABLE Professionnel_de_sante (
    Identifiant                VARCHAR(100) PRIMARY KEY,
    Civilite                   VARCHAR(30),
    Categorie_professionnelle  VARCHAR(100),
    Nom                        VARCHAR(50),
    Prenom                     VARCHAR(50),
    Profession                 VARCHAR(100),
    Type_identifiant           VARCHAR(50),
    Code_specialite            VARCHAR(50)  NOT NULL,
    CONSTRAINT fk_prof_specialite
        FOREIGN KEY (Code_specialite) REFERENCES Specialites (Code_specialite)
);
