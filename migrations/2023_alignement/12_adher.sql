-- Adher : ajout de la clé primaire composée.
-- Même méthode que Prescription pour les 18 doublons.
-- Les deux clés étrangères existent déjà dans la base.
CREATE TABLE sauvegarde_migration.adher_doublons (LIKE "Adher");

WITH supprimees AS (
    DELETE FROM "Adher"
    WHERE ctid IN (
        SELECT ctid FROM (
            SELECT ctid, row_number() OVER (PARTITION BY "Id_patient", "Id_mut") AS rang
            FROM "Adher"
        ) numerotees
        WHERE rang > 1
    )
    RETURNING *
)
INSERT INTO sauvegarde_migration.adher_doublons SELECT * FROM supprimees;

ALTER TABLE "Adher"
    ADD CONSTRAINT "Adher_pkey" PRIMARY KEY ("Id_patient", "Id_mut");

-- Cette FK s'appelait "Rembourse_Id_patient_fkey" (ancien nom de la table).
ALTER TABLE "Adher" RENAME CONSTRAINT "Rembourse_Id_patient_fkey" TO "Adher_Id_patient_fkey";

-- Les 2 FK existantes étaient "NOT VALID" : on les valide.
ALTER TABLE "Adher" VALIDATE CONSTRAINT "Adher_Id_patient_fkey";
ALTER TABLE "Adher" VALIDATE CONSTRAINT "Adher_Id_mut_fkey";
