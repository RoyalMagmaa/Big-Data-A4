-- Table : Consultation
-- Une consultation concerne exactement 1 patient, 1 professionnel,
-- 1 mutuelle et 1 diagnostic, d'où NOT NULL sur chaque clé étrangère.
CREATE TABLE "Consultation" (
    "Num_consultation"  INTEGER,
    "Id_mut"            INTEGER      NOT NULL,
    "Id_patient"        INTEGER      NOT NULL,
    "Id_prof_sante"     VARCHAR(100) NOT NULL,
    "Code_diag"         VARCHAR(50)  NOT NULL,
    "Motif"             VARCHAR(500),
    "Date"              DATE,
    "Heure_debut"       TIME WITH TIME ZONE,
    "Heure_fin"         TIME WITH TIME ZONE,
    CONSTRAINT "Consultation_pkey" PRIMARY KEY ("Num_consultation"),
    CONSTRAINT "Consultation_Id_mut_fkey"
        FOREIGN KEY ("Id_mut")        REFERENCES "Mutuelle" ("Id_Mut"),
    CONSTRAINT "Consultation_Id_patient_fkey"
        FOREIGN KEY ("Id_patient")    REFERENCES "Patient" ("Id_patient"),
    CONSTRAINT "Consultation_Id_prof_sante_fkey"
        FOREIGN KEY ("Id_prof_sante") REFERENCES "Professionnel_de_sante" ("Identifiant"),
    CONSTRAINT "Consultation_Code_diag_fkey"
        FOREIGN KEY ("Code_diag")     REFERENCES "Diagnostic" ("Code_diag")
);
