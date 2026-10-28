-- Diagnostic : on fixe les longueurs maximales des textes.
-- VARCHAR(255) au lieu de 100 : des libellés existants font 250 caractères.
ALTER TABLE "Diagnostic"
    ALTER COLUMN "Code_diag"  TYPE VARCHAR(50),
    ALTER COLUMN "Diagnostic" TYPE VARCHAR(255);
