-- =====================================================================
-- POINT D'ENTRÉE UNIQUE
--
--   psql -U <utilisateur> -d <base> -f install.sql
--
-- Le script regarde l'état de la base et choisit tout seul quoi faire :
--
--   1. Base vide              -> crée toutes les tables
--   2. Ancienne base (2023)   -> la met à jour avec des ALTER, sans perte
--   3. Base déjà installée    -> applique seulement les migrations manquantes
--   4. Base inconnue          -> s'arrête SANS RIEN MODIFIER
--
-- On peut le relancer autant de fois qu'on veut : ce qui est déjà fait
-- n'est jamais refait. Aucune table n'est jamais supprimée.
--
-- Tout se passe dans une transaction (BEGIN ... COMMIT) : à la moindre
-- erreur, la base revient exactement à son état de départ.
-- =====================================================================

\set ON_ERROR_STOP on

BEGIN;

-- ---------------------------------------------------------------------
-- Étape 1 : diagnostic de la base
-- to_regclass('nom') renvoie NULL si la table n'existe pas.
-- \gset range chaque colonne du résultat dans une variable psql du même nom.
-- ---------------------------------------------------------------------
SELECT
    to_regclass('public.schema_migrations') IS NOT NULL       AS deja_installee,
    to_regclass('public."Consultation"')    IS NOT NULL       AS a_les_tables,
    NOT EXISTS (SELECT 1 FROM pg_tables
                WHERE schemaname = 'public')                  AS base_vide,
    EXISTS (SELECT 1 FROM information_schema.columns
            WHERE table_schema = 'public' AND table_name = 'Patient'
              AND column_name = 'Date' AND data_type = 'character varying')
                                                              AS format_2023
\gset

-- ---------------------------------------------------------------------
-- Étape 2 : on agit selon le cas détecté
-- ---------------------------------------------------------------------
\if :deja_installee
    \echo '>> Base deja installee : verification des migrations manquantes.'
    \set base_neuve false

\elif :base_vide
    \echo '>> Base vide : creation de toutes les tables.'
    \set base_neuve true
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

\elif :format_2023
    \echo '>> Ancienne base 2023 detectee : mise a jour en conservant les donnees.'
    \set base_neuve false

\else
    -- Ni vide, ni connue : on refuse de deviner. RAISE EXCEPTION provoque
    -- une erreur, ON_ERROR_STOP arrête le script, la transaction est annulée.
    DO $$ BEGIN
        RAISE EXCEPTION 'Base non reconnue : elle contient des tables mais ne correspond ni a une base vide, ni a la base 2023, ni a une base deja installee. Rien n a ete modifie.';
    END $$;
\endif

-- ---------------------------------------------------------------------
-- Étape 3 : suivi et application des migrations
-- ---------------------------------------------------------------------
\ir schema_migrations.sql
\ir migrations/appliquer.sql

COMMIT;

\echo '>> Termine. Migrations enregistrees dans la base :'
SELECT version, appliquee_le FROM schema_migrations ORDER BY version;
