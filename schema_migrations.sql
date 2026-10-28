-- Table qui garde la trace des migrations déjà appliquées sur la base.
-- C'est le principe utilisé par les outils comme Flyway ou Liquibase.
CREATE TABLE IF NOT EXISTS schema_migrations (
    version       VARCHAR(50) PRIMARY KEY,
    appliquee_le  TIMESTAMPTZ NOT NULL DEFAULT now()
);
