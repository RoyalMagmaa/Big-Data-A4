-- Préparation de la migration.
-- Schéma de sauvegarde : toute ligne retirée d'une table y est copiée AVANT
-- d'être supprimée. Rien n'est donc perdu, on peut toujours la consulter
-- ou la réinsérer après correction.
CREATE SCHEMA IF NOT EXISTS sauvegarde_migration;
