Modélisation, peuplement, mise en place et gestion d'une base de donnés autour du commerce maritime au XVIIIe siècle

Structure du projet :

* Dossier CSV : contient tous les fichiers csv des données d'alimentation de nos tables
* Dossier REQ : contient tous les fichiers reqNum.sql contenant nos requêtes
* Fichier creation_tables.sql : qui crée toutes les tables de la bases de données et ajoute les contraintes
* Fichier remplissage_tables.sql : qui alimente les tables de notre base avec les données des fichiers .csv
* Fichier tequete.sql : qui contient toutes les requetes

Exécution :

\i creation_tables.sql
\i remplissage_tables.sql
\i requetes.sql
