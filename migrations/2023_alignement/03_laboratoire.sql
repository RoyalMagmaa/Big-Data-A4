-- Laboratoire : longueurs + NOT NULL sur le nom.
-- La contrainte UNIQUE du schéma n'est PAS posée : 9 noms existent en double
-- (même labo dans deux pays différents), ce sont des données légitimes.
ALTER TABLE "Laboratoire"
    ALTER COLUMN "Laboratoire" TYPE VARCHAR(200),
    ALTER COLUMN "Laboratoire" SET NOT NULL,
    ALTER COLUMN "Pays"        TYPE VARCHAR(100);
