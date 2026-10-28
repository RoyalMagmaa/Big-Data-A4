-- Salle : ajout de la clé étrangère vers Consultation.
--
-- Une salle pointe vers une consultation qui n'existe pas : la FK serait refusée.
-- On la copie dans le schéma de sauvegarde, puis on la retire.
--
-- Technique : DELETE ... RETURNING renvoie les lignes supprimées, et INSERT les
-- range immédiatement dans la table de sauvegarde. C'est une seule opération,
-- donc impossible de supprimer sans avoir sauvegardé.
CREATE TABLE sauvegarde_migration.salle_orphelines (LIKE "Salle");

WITH supprimees AS (
    DELETE FROM "Salle" s
    WHERE NOT EXISTS (SELECT 1 FROM "Consultation" c
                      WHERE c."Num_consultation" = s."Num_consultation")
    RETURNING s.*
)
INSERT INTO sauvegarde_migration.salle_orphelines SELECT * FROM supprimees;

ALTER TABLE "Salle"
    ALTER COLUMN "Id_salle"         TYPE VARCHAR(50),
    ALTER COLUMN "Num_consultation" SET NOT NULL,
    ALTER COLUMN "Code_bloc"        TYPE VARCHAR(50),
    ALTER COLUMN "Num_etage"        TYPE VARCHAR(20),
    ALTER COLUMN "Num_salle"        TYPE VARCHAR(20),
    ADD CONSTRAINT "Salle_Num_consultation_fkey"
        FOREIGN KEY ("Num_consultation") REFERENCES "Consultation" ("Num_consultation");
