-- Table : Medicaments
-- Le schéma prévoit une FK "Titulaire" -> "Laboratoire"."Laboratoire".
-- Elle n'est PAS posée : 4 510 médicaments existants ont un titulaire absent de
-- la table Laboratoire (ex : "ZENTIVA FRANCE"), et les noms de labo ne sont pas uniques.
CREATE TABLE "Medicaments" (
    "Code_CIS"                     VARCHAR(50),
    "Denomination"                 VARCHAR(255),  -- 100 sur le schéma, valeurs réelles jusqu'à 255
    "Forme_pharmaceutique"         VARCHAR(100),
    "Voies_d_administration"       VARCHAR(150),  -- 100 sur le schéma, valeurs réelles jusqu'à 135
    "Statut_administratif"         VARCHAR(50),
    "Type_de_procedure"            VARCHAR(100),
    "Etat_de_commercialisation"    VARCHAR(50),
    "Date_AMM"                     VARCHAR(100),
    "StatutBdm"                    VARCHAR(100),
    "Num_autorisation_europeenne"  VARCHAR(100),
    "Titulaire"                    VARCHAR(200) NOT NULL,
    "Surveillance_renforcee"       VARCHAR(30),
    CONSTRAINT "Medicaments_pkey" PRIMARY KEY ("Code_CIS")
);
