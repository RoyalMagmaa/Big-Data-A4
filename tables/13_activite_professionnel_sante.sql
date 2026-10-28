-- Table : Activite_Professionnel_sante
-- TABLE D'ASSOCIATION (N-N) entre Professionnel_de_sante et Organisation,
-- avec un attribut porteur : Mode_exercice.
CREATE TABLE Activite_Professionnel_sante (
    Id_pro_sante     VARCHAR(100) NOT NULL,
    Id_organisation  VARCHAR(25)  NOT NULL,
    Mode_exercice    VARCHAR(100),
    CONSTRAINT pk_activite_pro
        PRIMARY KEY (Id_pro_sante, Id_organisation),
    CONSTRAINT fk_activite_prof
        FOREIGN KEY (Id_pro_sante)    REFERENCES Professionnel_de_sante (Identifiant),
    CONSTRAINT fk_activite_organisation
        FOREIGN KEY (Id_organisation) REFERENCES Organisation (Id_organisation)
);
