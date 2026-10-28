-- Table : Laboratoire
-- Le schéma indique UNIQUE sur "Laboratoire", mais les données réelles contiennent
-- des homonymes légitimes (ex : NOVARTIS EUROPHARM en Irlande ET au Royaume-Uni).
-- La contrainte UNIQUE n'est donc pas posée.
CREATE TABLE "Laboratoire" (
    "Id_labo"      INTEGER,
    "Laboratoire"  VARCHAR(200) NOT NULL,
    "Pays"         VARCHAR(100),
    CONSTRAINT "Laboratoire_pkey" PRIMARY KEY ("Id_labo")
);
