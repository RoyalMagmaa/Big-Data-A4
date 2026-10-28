-- Prescription : ajout de la clé primaire composée et des deux clés étrangères.
-- Deux problèmes à régler avant :

-- 1) Les doublons : la même ligne (consultation, médicament) présente 2 fois.
--    Une clé primaire interdit les doublons. On garde 1 exemplaire, les copies
--    en trop vont en sauvegarde.
--    "ctid" est l'adresse physique d'une ligne : seul moyen de distinguer deux
--    lignes identiques dans une table sans clé primaire.
--    row_number() numérote les copies d'un même couple : 1, 2, 3... On supprime > 1.
CREATE TABLE sauvegarde_migration.prescription_doublons (LIKE "Prescription");

WITH supprimees AS (
    DELETE FROM "Prescription"
    WHERE ctid IN (
        SELECT ctid FROM (
            SELECT ctid, row_number() OVER (PARTITION BY "Num_consultation", "Code_CIS") AS rang
            FROM "Prescription"
        ) numerotees
        WHERE rang > 1
    )
    RETURNING *
)
INSERT INTO sauvegarde_migration.prescription_doublons SELECT * FROM supprimees;

-- 2) Les orphelins : prescriptions vers une consultation ou un médicament inexistant.
CREATE TABLE sauvegarde_migration.prescription_orphelines (LIKE "Prescription");

WITH supprimees AS (
    DELETE FROM "Prescription" p
    WHERE NOT EXISTS (SELECT 1 FROM "Consultation" c WHERE c."Num_consultation" = p."Num_consultation")
       OR NOT EXISTS (SELECT 1 FROM "Medicaments"  m WHERE m."Code_CIS"         = p."Code_CIS")
    RETURNING p.*
)
INSERT INTO sauvegarde_migration.prescription_orphelines SELECT * FROM supprimees;

-- 3) Les contraintes. Une clé primaire implique automatiquement NOT NULL.
ALTER TABLE "Prescription"
    ALTER COLUMN "Code_CIS" TYPE VARCHAR(50),
    ADD CONSTRAINT "Prescription_pkey" PRIMARY KEY ("Num_consultation", "Code_CIS"),
    ADD CONSTRAINT "Prescription_Num_consultation_fkey"
        FOREIGN KEY ("Num_consultation") REFERENCES "Consultation" ("Num_consultation"),
    ADD CONSTRAINT "Prescription_Code_CIS_fkey"
        FOREIGN KEY ("Code_CIS")         REFERENCES "Medicaments" ("Code_CIS");
