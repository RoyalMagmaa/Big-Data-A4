-- Table : Adher
-- Table d'association N-N entre Patient et Mutuelle.
CREATE TABLE "Adher" (
    "Id_patient"  INTEGER,
    "Id_mut"      INTEGER,
    CONSTRAINT "Adher_pkey" PRIMARY KEY ("Id_patient", "Id_mut"),
    CONSTRAINT "Adher_Id_patient_fkey"
        FOREIGN KEY ("Id_patient") REFERENCES "Patient" ("Id_patient"),
    CONSTRAINT "Adher_Id_mut_fkey"
        FOREIGN KEY ("Id_mut")     REFERENCES "Mutuelle" ("Id_Mut")
);
