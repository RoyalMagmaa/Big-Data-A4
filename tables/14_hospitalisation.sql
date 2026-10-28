-- Table : Hospitalisation
-- Une hospitalisation concerne 1 patient, 1 organisation et 1 diagnostic.
CREATE TABLE Hospitalisation (
    Num_hospitalisation            VARCHAR(100) PRIMARY KEY,
    Id_patient                     INTEGER      NOT NULL,
    Id_organisation                VARCHAR(25)  NOT NULL,
    Code_diagnostic                VARCHAR(50)  NOT NULL,
    Suite_diagnostic_consultation  VARCHAR(500),
    Date_Entree                    DATE,
    Jour_Hospitalisation           INTEGER,
    CONSTRAINT fk_hospitalisation_patient
        FOREIGN KEY (Id_patient)      REFERENCES Patient (Id_patient),
    CONSTRAINT fk_hospitalisation_organisation
        FOREIGN KEY (Id_organisation) REFERENCES Organisation (Id_organisation),
    CONSTRAINT fk_hospitalisation_diagnostic
        FOREIGN KEY (Code_diagnostic) REFERENCES Diagnostic (Code_diag)
);
