-- Patient : conversion des colonnes stockées en texte.
--
-- USING indique COMMENT transformer chaque ancienne valeur en nouvelle valeur.
-- Sans USING, PostgreSQL refuse de convertir du texte en date.
--
--   "Date"   : texte au format américain mois/jour/année ("4/30/1934")
--              -> to_date(..., 'MM/DD/YYYY') le lit correctement.
--   "Poid"   : texte décimal ("87.6") -> NUMERIC(4,1) pour garder la décimale.
--   "Taille" : texte entier ("175") -> INTEGER.
--   "Code_postal" reste du texte (VARCHAR(5)) pour garder le 0 initial.
--
-- Tout est dans UN SEUL ALTER TABLE : PostgreSQL ne réécrit la table qu'une fois.
ALTER TABLE "Patient"
    ALTER COLUMN "Date"        TYPE DATE         USING to_date("Date", 'MM/DD/YYYY'),
    ALTER COLUMN "Poid"        TYPE NUMERIC(4,1) USING "Poid"::NUMERIC(4,1),
    ALTER COLUMN "Taille"      TYPE INTEGER      USING "Taille"::INTEGER,
    ALTER COLUMN "Code_postal" TYPE VARCHAR(5);

-- La clé primaire s'appelait "fakenames_pkey" (reste d'un ancien import).
ALTER TABLE "Patient" RENAME CONSTRAINT fakenames_pkey TO "Patient_pkey";
