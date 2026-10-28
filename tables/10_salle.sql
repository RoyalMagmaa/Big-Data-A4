-- Table : Salle
-- Une salle est liée à 1 consultation (FK Num_consultation),
-- une consultation peut avoir 0..N salles.
CREATE TABLE Salle (
    Id_salle          VARCHAR(50)  PRIMARY KEY,
    Num_consultation  INTEGER      NOT NULL,
    Code_bloc         VARCHAR(50),
    Num_etage         VARCHAR(20),
    Num_salle         VARCHAR(20),
    CONSTRAINT fk_salle_consultation
        FOREIGN KEY (Num_consultation) REFERENCES Consultation (Num_consultation)
);
