-- =====================================================================
-- MIGRATION D'UNE BASE EXISTANTE (sans perte de données)
--
-- Amène une base créée en 2023 (dump DATA2023) au schéma actuel avec des
-- ALTER TABLE, au lieu de tout supprimer et recréer.
--
-- Lancement :  psql -U <utilisateur> -d <base> -f migrate.sql
--
-- Sécurités :
--   - BEGIN / COMMIT : tout ou rien. Une erreur annule TOUTE la migration.
--   - schema_migrations : la migration ne s'applique qu'une fois. Relancer
--     le script ne fait rien si elle est déjà passée.
--   - les lignes retirées (doublons, orphelins) sont copiées dans le schéma
--     sauvegarde_migration avant suppression.
--
-- Conseil : fais quand même une sauvegarde avant (pg_dump -Fc ...).
-- =====================================================================

\set ON_ERROR_STOP on

BEGIN;

\ir schema_migrations.sql

-- \gset range le résultat de la requête dans une variable psql (:deja_faite).
SELECT EXISTS (SELECT 1 FROM schema_migrations WHERE version = '2023_alignement')
       AS deja_faite \gset

\if :deja_faite
    \echo '>> Migration 2023_alignement deja appliquee, rien a faire.'
\else
    \echo '>> Application de la migration 2023_alignement...'
    \ir migrations/2023_alignement/00_preparation.sql
    \ir migrations/2023_alignement/01_diagnostic.sql
    \ir migrations/2023_alignement/02_mutuelle.sql
    \ir migrations/2023_alignement/03_laboratoire.sql
    \ir migrations/2023_alignement/04_specialites.sql
    \ir migrations/2023_alignement/05_patient.sql
    \ir migrations/2023_alignement/06_organisation.sql
    \ir migrations/2023_alignement/07_medicaments.sql
    \ir migrations/2023_alignement/08_professionnel_de_sante.sql
    \ir migrations/2023_alignement/09_consultation.sql
    \ir migrations/2023_alignement/10_salle.sql
    \ir migrations/2023_alignement/11_prescription.sql
    \ir migrations/2023_alignement/12_adher.sql
    \ir migrations/2023_alignement/13_activite_professionnel_sante.sql
    \ir migrations/2023_alignement/14_hospitalisation.sql

    INSERT INTO schema_migrations (version) VALUES ('2023_alignement');
    \echo '>> Migration terminee.'
\endif

COMMIT;
