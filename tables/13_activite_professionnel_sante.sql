-- Table : Activite_Professionnel_sante
-- Table d'association N-N entre Professionnel_de_sante et Organisation,
-- avec un attribut porteur : Mode_exercice.
CREATE TABLE "Activite_Professionnel_sante" (
    "Id_pro_sante"     VARCHAR(100),
    "Id_organisation"  VARCHAR(25),
    "Mode_exercice"    VARCHAR(100),
    CONSTRAINT "Activite_Professionnel_sante_pkey" PRIMARY KEY ("Id_pro_sante", "Id_organisation"),
    CONSTRAINT "Activite_Professionnel_sante_Id_pro_sante_fkey"
        FOREIGN KEY ("Id_pro_sante")    REFERENCES "Professionnel_de_sante" ("Identifiant"),
    CONSTRAINT "Activite_Professionnel_sante_Id_organisation_fkey"
        FOREIGN KEY ("Id_organisation") REFERENCES "Organisation" ("Id_organisation")
);
