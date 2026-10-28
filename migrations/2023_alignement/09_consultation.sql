-- Consultation : NOT NULL sur les clés étrangères, longueurs, et heures
-- converties en TIME WITH TIME ZONE (TWTZ sur le schéma).
--
-- Piège des fuseaux horaires : l'heure 08:00 en mars vaut 08:00+01 (heure d'hiver)
-- mais en juillet 08:00+02 (heure d'été). On combine donc la date et l'heure
-- ("Date" + "Heure_debut" donne un TIMESTAMP), on l'interprète en heure de Paris,
-- puis on garde la partie heure avec le bon décalage pour CE jour-là.
SET LOCAL TimeZone = 'Europe/Paris';

ALTER TABLE "Consultation"
    ALTER COLUMN "Id_mut"        SET NOT NULL,
    ALTER COLUMN "Id_patient"    SET NOT NULL,
    ALTER COLUMN "Id_prof_sante" TYPE VARCHAR(100),
    ALTER COLUMN "Id_prof_sante" SET NOT NULL,
    ALTER COLUMN "Code_diag"     TYPE VARCHAR(50),
    ALTER COLUMN "Code_diag"     SET NOT NULL,
    ALTER COLUMN "Motif"         TYPE VARCHAR(500),
    ALTER COLUMN "Heure_debut"   TYPE TIME WITH TIME ZONE
        USING (("Date" + "Heure_debut") AT TIME ZONE 'Europe/Paris')::TIME WITH TIME ZONE,
    ALTER COLUMN "Heure_fin"     TYPE TIME WITH TIME ZONE
        USING (("Date" + "Heure_fin")   AT TIME ZONE 'Europe/Paris')::TIME WITH TIME ZONE;

-- Les 4 FK existantes étaient "NOT VALID" (jamais vérifiées sur les anciennes
-- lignes). Les données sont saines, on les valide.
ALTER TABLE "Consultation" VALIDATE CONSTRAINT "Consultation_Id_mut_fkey";
ALTER TABLE "Consultation" VALIDATE CONSTRAINT "Consultation_Id_patient_fkey";
ALTER TABLE "Consultation" VALIDATE CONSTRAINT "Consultation_Id_prof_sante_fkey";
ALTER TABLE "Consultation" VALIDATE CONSTRAINT "Consultation_Code_diag_fkey";
