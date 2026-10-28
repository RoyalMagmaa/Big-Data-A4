-- Table : Diagnostic
CREATE TABLE "Diagnostic" (
    "Code_diag"   VARCHAR(50),
    "Diagnostic"  VARCHAR(255),  -- 100 sur le schéma, mais des libellés réels font jusqu'à 250 caractères
    CONSTRAINT "Diagnostic_pkey" PRIMARY KEY ("Code_diag")
);
