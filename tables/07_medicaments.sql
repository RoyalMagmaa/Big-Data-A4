-- Table : Medicaments
-- Un médicament a un seul laboratoire titulaire (cardinalité 1),
-- un laboratoire peut avoir 0..N médicaments.
-- La FK pointe vers la colonne UNIQUE Laboratoire.Laboratoire (le nom),
-- d'où le même type VARCHAR(200).
CREATE TABLE Medicaments (
    Code_CIS                     VARCHAR(50)  PRIMARY KEY,
    Denomination                 VARCHAR(100),
    Forme_pharmaceutique         VARCHAR(100),
    Voies_d_administration       VARCHAR(100),
    Statut_administratif         VARCHAR(50),
    Type_de_procedure            VARCHAR(100),
    Etat_de_commercialisation    VARCHAR(50),
    Date_AMM                     VARCHAR(100),
    StatutBdm                    VARCHAR(100),
    Num_autorisation_europeenne  VARCHAR(100),
    Titulaire                    VARCHAR(200) NOT NULL,
    Surveillance_renforcee       VARCHAR(30),
    CONSTRAINT fk_medicaments_laboratoire
        FOREIGN KEY (Titulaire) REFERENCES Laboratoire (Laboratoire)
);
