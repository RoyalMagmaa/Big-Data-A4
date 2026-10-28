-- Table : Hospitalisation
-- Une hospitalisation concerne 1 patient, 1 organisation et 1 diagnostic.
CREATE TABLE "Hospitalisation" (
    "Num_hospitalisation"            VARCHAR(100),
    "Id_patient"                     INTEGER      NOT NULL,
    "Id_organisation"                VARCHAR(25)  NOT NULL,
    "Code_diagnostic"                VARCHAR(50)  NOT NULL,
    "Suite_diagnostic_consultation"  VARCHAR(500),
    "Date_Entree"                    DATE,
    "Jour_Hospitalisation"           INTEGER,
    CONSTRAINT "Hospitalisation_pkey" PRIMARY KEY ("Num_hospitalisation"),
    CONSTRAINT "Hospitalisation_Id_patient_fkey"
        FOREIGN KEY ("Id_patient")      REFERENCES "Patient" ("Id_patient"),
    CONSTRAINT "Hospitalisation_Id_organisation_fkey"
        FOREIGN KEY ("Id_organisation") REFERENCES "Organisation" ("Id_organisation"),
    CONSTRAINT "Hospitalisation_Code_diagnostic_fkey"
        FOREIGN KEY ("Code_diagnostic") REFERENCES "Diagnostic" ("Code_diag")
);
