-- =====================================================================
-- Script principal : crée toute la base en appelant chaque fichier.
--
-- Lancement (depuis un terminal) :
--   psql -U <utilisateur> -d <base> -f main.sql
--
-- \ir = "include relative" : chemin relatif à l'emplacement de main.sql,
-- donc le script marche quel que soit le dossier d'où tu lances psql.
-- ON_ERROR_STOP : arrête tout à la première erreur au lieu de continuer.
-- BEGIN / COMMIT : tout ou rien. Si un fichier échoue, rien n'est créé.
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

COMMIT;
