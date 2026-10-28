-- Specialites : longueurs des textes.
ALTER TABLE "Specialites"
    ALTER COLUMN "Code_specialite" TYPE VARCHAR(50),
    ALTER COLUMN "Fonction"        TYPE VARCHAR(200),
    ALTER COLUMN "Specialite"      TYPE VARCHAR(100);
