-- Table : Prescription
-- Table d'association N-N entre Consultation et Medicaments.
-- Clé primaire composée des deux clés étrangères.
CREATE TABLE "Prescription" (
    "Num_consultation"  INTEGER,
    "Code_CIS"          VARCHAR(50),
    CONSTRAINT "Prescription_pkey" PRIMARY KEY ("Num_consultation", "Code_CIS"),
    CONSTRAINT "Prescription_Num_consultation_fkey"
        FOREIGN KEY ("Num_consultation") REFERENCES "Consultation" ("Num_consultation"),
    CONSTRAINT "Prescription_Code_CIS_fkey"
        FOREIGN KEY ("Code_CIS")         REFERENCES "Medicaments" ("Code_CIS")
);
