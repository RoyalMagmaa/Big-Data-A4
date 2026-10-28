# Base de données santé

## Installer ou mettre à jour

Une seule commande, quelle que soit la base :

```
psql -U <utilisateur> -d <base> -f install.sql
```

| État de la base            | Ce que fait install.sql                         |
|----------------------------|-------------------------------------------------|
| Vide                       | Crée les 14 tables                              |
| Ancienne base 2023         | Met à jour avec des ALTER, garde les données    |
| Déjà installée             | Applique seulement les migrations manquantes    |
| Inconnue                   | S'arrête sans rien modifier                     |

Le script peut être relancé sans risque. Il ne supprime jamais de table.
Conseil : sauvegarde quand même la base avant (`pg_dump -Fc -f sauvegarde.dump <base>`).

## Organisation

```
install.sql              point d'entrée unique
schema_migrations.sql    table de suivi des migrations
tables/                  schéma final, un fichier par table (bases neuves)
migrations/appliquer.sql liste des migrations, dans l'ordre
migrations/2023_alignement/  ALTER pour passer de la base 2023 au schéma final
```

## Lignes mises de côté par la migration 2023

Les doublons et lignes orphelines retirés sont copiés dans le schéma
`sauvegarde_migration` avant suppression :

```sql
SELECT * FROM sauvegarde_migration.prescription_doublons;
SELECT * FROM sauvegarde_migration.prescription_orphelines;
SELECT * FROM sauvegarde_migration.adher_doublons;
SELECT * FROM sauvegarde_migration.salle_orphelines;
SELECT * FROM sauvegarde_migration.professionnel_specialite_corrigee;
```

## Faire évoluer le schéma plus tard

1. Créer `migrations/AAAA_description/` avec les `ALTER TABLE`.
2. Mettre à jour les fichiers `tables/` pour que les bases neuves aient le même résultat.
3. Ajouter un bloc dans `migrations/appliquer.sql` (copier le bloc existant).

## Limite

`install.sql` utilise des commandes propres à **psql** (`\ir`, `\if`, `\gset`).
Il ne fonctionne pas dans l'éditeur de requêtes de pgAdmin ou DBeaver.
