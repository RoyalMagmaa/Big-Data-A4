-- Table : Adher
-- TABLE D'ASSOCIATION (N-N) entre Patient et Mutuelle :
-- un patient peut adhérer à plusieurs mutuelles et inversement.
CREATE TABLE Adher (
    Id_patient  INTEGER NOT NULL,
    Id_mut      INTEGER NOT NULL,
    CONSTRAINT pk_adher
        PRIMARY KEY (Id_patient, Id_mut),
    CONSTRAINT fk_adher_patient
        FOREIGN KEY (Id_patient) REFERENCES Patient (Id_patient),
    CONSTRAINT fk_adher_mutuelle
        FOREIGN KEY (Id_mut)     REFERENCES Mutuelle (Id_Mut)
);
