-- Table : Consultation
-- Une consultation concerne exactement 1 patient, 1 professionnel,
-- 1 mutuelle et 1 diagnostic (cardinalité "1" côté de ces tables),
-- d'où NOT NULL sur chaque clé étrangère.
CREATE TABLE Consultation (
    Num_consultation  INTEGER      PRIMARY KEY,
    Id_mut            INTEGER      NOT NULL,
    Id_patient        INTEGER      NOT NULL,
    Id_prof_sante     VARCHAR(100) NOT NULL,
    Code_diag         VARCHAR(50)  NOT NULL,
    Motif             VARCHAR(500),
    Date              DATE,
    Heure_debut       TIME WITH TIME ZONE,
    Heure_fin         TIME WITH TIME ZONE,
    CONSTRAINT fk_consultation_mutuelle
        FOREIGN KEY (Id_mut)        REFERENCES Mutuelle (Id_Mut),
    CONSTRAINT fk_consultation_patient
        FOREIGN KEY (Id_patient)    REFERENCES Patient (Id_patient),
    CONSTRAINT fk_consultation_prof
        FOREIGN KEY (Id_prof_sante) REFERENCES Professionnel_de_sante (Identifiant),
    CONSTRAINT fk_consultation_diagnostic
        FOREIGN KEY (Code_diag)     REFERENCES Diagnostic (Code_diag)
);
