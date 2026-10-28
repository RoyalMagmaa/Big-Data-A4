-- Professionnel_de_sante : longueurs + NOT NULL sur la spécialité.
-- La clé étrangère vers Specialites existe déjà dans la base.
ALTER TABLE "Professionnel_de_sante"
    ALTER COLUMN "Identifiant"               TYPE VARCHAR(100),
    ALTER COLUMN "Civilite"                  TYPE VARCHAR(30),
    ALTER COLUMN "Categorie_professionnelle" TYPE VARCHAR(100),
    ALTER COLUMN "Nom"                       TYPE VARCHAR(50),
    ALTER COLUMN "Prenom"                    TYPE VARCHAR(50),
    ALTER COLUMN "Profession"                TYPE VARCHAR(100),
    ALTER COLUMN "Type_identifiant"          TYPE VARCHAR(50),
    ALTER COLUMN "Code_specialite"           TYPE VARCHAR(50),
    ALTER COLUMN "Code_specialite"           SET NOT NULL;

-- La FK vers Specialites existait déjà, mais en "NOT VALID" : elle bloque les
-- nouvelles erreurs, sans avoir jamais vérifié les lignes déjà présentes.
-- Une ligne ancienne était fausse : Code_specialite = 'BM0801 option biologie generale'
-- au lieu de 'BM0801' (Biologie medicale). On sauvegarde la ligne, on corrige,
-- puis VALIDATE CONSTRAINT vérifie enfin toute la table.
CREATE TABLE sauvegarde_migration.professionnel_specialite_corrigee AS
SELECT * FROM "Professionnel_de_sante"
WHERE "Code_specialite" = 'BM0801 option biologie generale';

UPDATE "Professionnel_de_sante"
SET    "Code_specialite" = 'BM0801'
WHERE  "Code_specialite" = 'BM0801 option biologie generale';

ALTER TABLE "Professionnel_de_sante"
    VALIDATE CONSTRAINT "Professionnel_de_sante_Code_specialite_fkey";
