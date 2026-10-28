-- =====================================================================
-- CRÉATION D'UNE BASE NEUVE (vide)
--
--   /!\ NE PAS LANCER sur une base qui contient déjà des données :
--       00_drop_all.sql supprime tout. Pour une base existante,
--       utiliser migrate.sql à la place.
--
-- Lancement :  psql -U <utilisateur> -d <base> -f main.sql
-- =====================================================================

\set ON_ERROR_STOP on

BEGIN;

\ir 00_drop_all.sql

\ir tables/01_diagnostic.sql
\ir tables/02_mutuelle.sql
\ir tables/03_laboratoire.sql
\ir tables/04_specialites.sql
\ir tables/05_patient.sql
\ir tables/06_organisation.sql
\ir tables/07_medicaments.sql
\ir tables/08_professionnel_de_sante.sql
\ir tables/09_consultation.sql
\ir tables/10_salle.sql
\ir tables/11_prescription.sql
\ir tables/12_adher.sql
\ir tables/13_activite_professionnel_sante.sql
\ir tables/14_hospitalisation.sql

-- Table de suivi des migrations (voir migrate.sql).
-- Une base neuve a déjà le schéma final : on note donc la migration
-- comme déjà appliquée, pour que migrate.sql ne la rejoue pas.
\ir schema_migrations.sql
INSERT INTO schema_migrations (version) VALUES ('2023_alignement');

COMMIT;
