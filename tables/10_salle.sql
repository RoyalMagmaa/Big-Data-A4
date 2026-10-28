-- Table : Salle
-- Une salle est liée à 1 consultation, une consultation a 0..N salles.
CREATE TABLE "Salle" (
    "Id_salle"          VARCHAR(50),
    "Num_consultation"  INTEGER     NOT NULL,
    "Code_bloc"         VARCHAR(50),
    "Num_etage"         VARCHAR(20),
    "Num_salle"         VARCHAR(20),
    CONSTRAINT "Salle_pkey" PRIMARY KEY ("Id_salle"),
    CONSTRAINT "Salle_Num_consultation_fkey"
        FOREIGN KEY ("Num_consultation") REFERENCES "Consultation" ("Num_consultation")
);
