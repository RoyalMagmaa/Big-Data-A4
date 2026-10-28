-- Table : Organisation
CREATE TABLE Organisation (
    Id_organisation                 VARCHAR(25)  PRIMARY KEY,
    Adresse                         VARCHAR(100),
    cedex                           VARCHAR(30),
    Code_commune                    INTEGER,
    code_postal                     INTEGER,
    Commune                         VARCHAR(50),
    Complement_destinaire           VARCHAR(300),
    Complement_point_geographique   VARCHAR(300),
    Email                           VARCHAR(250),
    Enseigne_commerciale_site       VARCHAR(300),
    Finess_etablissement_juridique  INTEGER,
    Finess_site                     VARCHAR(250),
    Indice_repetition_voie          VARCHAR(10),
    Mention_distribution            VARCHAR(200),
    Numero_voie                     INTEGER,
    Pays                            VARCHAR(100),
    Raison_sociale_site             VARCHAR(300),
    Siren_site                      INTEGER,
    Siret_site                      BIGINT,  -- INT sur le schéma, mais un SIRET (14 chiffres) dépasse la limite d'un INTEGER
    Telecopie                       INTEGER,
    Telephone                       INTEGER,
    Telephone_2                     INTEGER,
    Type_voie                       VARCHAR(25),
    Voie                            VARCHAR(300)
);
