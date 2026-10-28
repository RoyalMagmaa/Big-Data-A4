-- Table : Prescription
-- TABLE D'ASSOCIATION (relation N-N) entre Consultation et Medicaments.
-- La clé primaire est composée des deux clés étrangères ("PK,FK" sur le schéma) :
-- un même médicament ne peut être prescrit qu'une fois par consultation.
CREATE TABLE Prescription (
    Num_consultation  INTEGER     NOT NULL,
    Code_CIS          VARCHAR(50) NOT NULL,
    CONSTRAINT pk_prescription
        PRIMARY KEY (Num_consultation, Code_CIS),
    CONSTRAINT fk_prescription_consultation
        FOREIGN KEY (Num_consultation) REFERENCES Consultation (Num_consultation),
    CONSTRAINT fk_prescription_medicament
        FOREIGN KEY (Code_CIS)         REFERENCES Medicaments (Code_CIS)
);
