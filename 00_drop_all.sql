-- Supprime toutes les tables, dans l'ordre inverse de création.
-- ATTENTION : détruit toutes les données. Réservé à une base neuve ou de test.

DROP TABLE IF EXISTS "Hospitalisation"              CASCADE;
DROP TABLE IF EXISTS "Activite_Professionnel_sante" CASCADE;
DROP TABLE IF EXISTS "Adher"                        CASCADE;
DROP TABLE IF EXISTS "Prescription"                 CASCADE;
DROP TABLE IF EXISTS "Salle"                        CASCADE;
DROP TABLE IF EXISTS "Consultation"                 CASCADE;
DROP TABLE IF EXISTS "Professionnel_de_sante"       CASCADE;
DROP TABLE IF EXISTS "Medicaments"                  CASCADE;
DROP TABLE IF EXISTS "Organisation"                 CASCADE;
DROP TABLE IF EXISTS "Patient"                      CASCADE;
DROP TABLE IF EXISTS "Specialites"                  CASCADE;
DROP TABLE IF EXISTS "Laboratoire"                  CASCADE;
DROP TABLE IF EXISTS "Mutuelle"                     CASCADE;
DROP TABLE IF EXISTS "Diagnostic"                   CASCADE;
DROP TABLE IF EXISTS schema_migrations CASCADE;
