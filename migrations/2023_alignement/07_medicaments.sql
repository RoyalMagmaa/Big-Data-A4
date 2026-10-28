-- Medicaments : longueurs des textes + NOT NULL sur Titulaire.
-- Denomination (255) et Voies_d_administration (150) sont élargies :
-- des valeurs existantes dépassent les 100 caractères du schéma.
--
-- La FK "Titulaire" -> "Laboratoire" n'est PAS posée : 4 510 médicaments ont un
-- titulaire inconnu de la table Laboratoire. La poser exigerait de modifier ou
-- supprimer ces données.
ALTER TABLE "Medicaments"
    ALTER COLUMN "Denomination"                TYPE VARCHAR(255),
    ALTER COLUMN "Forme_pharmaceutique"        TYPE VARCHAR(100),
    ALTER COLUMN "Voies_d_administration"      TYPE VARCHAR(150),
    ALTER COLUMN "Statut_administratif"        TYPE VARCHAR(50),
    ALTER COLUMN "Type_de_procedure"           TYPE VARCHAR(100),
    ALTER COLUMN "Etat_de_commercialisation"   TYPE VARCHAR(50),
    ALTER COLUMN "Date_AMM"                    TYPE VARCHAR(100),
    ALTER COLUMN "StatutBdm"                   TYPE VARCHAR(100),
    ALTER COLUMN "Num_autorisation_europeenne" TYPE VARCHAR(100),
    ALTER COLUMN "Titulaire"                   TYPE VARCHAR(200),
    ALTER COLUMN "Titulaire"                   SET NOT NULL,
    ALTER COLUMN "Surveillance_renforcee"      TYPE VARCHAR(30),
    ALTER COLUMN "Code_CIS"                    TYPE VARCHAR(50);
