-- =====================================================================
-- LISTE DES MIGRATIONS, dans l'ordre chronologique.
-- Appelé par install.sql, ne pas lancer seul.
--
-- Pour chaque migration :
--   - déjà dans schema_migrations  -> on ne fait rien
--   - base neuve (:base_neuve)     -> les fichiers tables/ contiennent déjà
--                                     le résultat final, on note juste la
--                                     migration comme faite
--   - sinon                        -> on applique les ALTER puis on la note
--
-- AJOUTER UNE MIGRATION PLUS TARD (ex : 2024_ajout_email) :
--   1. créer le dossier migrations/2024_ajout_email/ avec les ALTER
--   2. mettre AUSSI à jour les fichiers tables/ (pour les bases neuves)
--   3. copier un bloc ci-dessous en bas de ce fichier et l'adapter
-- =====================================================================


-- ---------------------------------------------------------------------
-- 2023_alignement : aligne la base de 2023 sur le schéma relationnel
-- ---------------------------------------------------------------------
SELECT NOT EXISTS (SELECT 1 FROM schema_migrations
                   WHERE version = '2023_alignement') AS a_faire \gset
\if :a_faire
    \if :base_neuve
        \echo '   2023_alignement : deja inclus dans les tables neuves.'
    \else
        \echo '   2023_alignement : application...'
        \ir 2023_alignement/00_preparation.sql
        \ir 2023_alignement/01_diagnostic.sql
        \ir 2023_alignement/02_mutuelle.sql
        \ir 2023_alignement/03_laboratoire.sql
        \ir 2023_alignement/04_specialites.sql
        \ir 2023_alignement/05_patient.sql
        \ir 2023_alignement/06_organisation.sql
        \ir 2023_alignement/07_medicaments.sql
        \ir 2023_alignement/08_professionnel_de_sante.sql
        \ir 2023_alignement/09_consultation.sql
        \ir 2023_alignement/10_salle.sql
        \ir 2023_alignement/11_prescription.sql
        \ir 2023_alignement/12_adher.sql
        \ir 2023_alignement/13_activite_professionnel_sante.sql
        \ir 2023_alignement/14_hospitalisation.sql
    \endif
    INSERT INTO schema_migrations (version) VALUES ('2023_alignement');
\else
    \echo '   2023_alignement : deja appliquee.'
\endif
