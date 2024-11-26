# :cocktail: TP 01 VIP Cocktail
Créer une base de donnée : **invitation**  
Créer une table : **personne**  
Rajouter le prefixe "inv" à votre table  
  
Nou allons créer une liste d'invités pour des soirées VIP  
![brad](../img/03/brad.webp)
![george](../img/03/george.webp)
![jean](../img/03/jean.webp)
  

## Partie 1 Création de la table
Chaque personne à :
  
- un prénom
- un nom  
- un age  
- la date de sont inscription
- un status : Valide ou NON Valide (un booléen)
- un type : membre ou non membre (une énumération)
- une description
- salaire annuel





| prenom | nom | age | inscription | statut | type | description | salaire |
|----|---|---|---|---|---|---|---|
| Brad | PITT | 60 | 01/01/1970 | 1 | non membre | lorem ipsum | 2 000 000 |
| George | Cloney | 62 | 01/01/1999 | 1 | membre  | juste beau | 4 000 000 |
| Jean | DUJARDIN | 51 | 01/01/1994 | 0 | membre | brice de nice | 1 000 000 |


## La correction partie 1 :heart_eyes: :
```mysql

DROP DATABASE invitation;
CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE invitation;
-- mettre un nom a la contrainte de clef primaire
-- CONSTRAINT pk_personne
-- ALT + SHIFT + fleche : dupliquer la ligne
DROP TABLE IF EXISTS inv_personne;
CREATE TABLE inv_personne(
    pers_id int NOT NULL AUTO_INCREMENT, 
    pers_prenom VARCHAR(100) NOT NULL DEFAULT 'toto',
    pers_nom VARCHAR(100) NOT NULL,
    pers_age INT NOT NULL,
    pers_inscription DATE NOT NULL,
    pers_statut TINYINT NOT NULL DEFAULT 1, -- 1 ok 0 pas ok
    pers_type ENUM('membre','NON MEMBRE') NOT NULL DEFAULT 'NON MEMBRE',
    pers_description TEXT, -- peut etre null
    pers_salaire INT,
    CONSTRAINT pk_personne PRIMARY KEY(pers_id) # pk_personne le nom de la contrainte
) ENGINE=InnoDB; 
 
```


## La correction partie 2 :heart_eyes: :
```mysql
-- vider la table de ses données
TRUNCATE inv_personne;
-- inserer DATA données
INSERT INTO inv_personne 
(pers_prenom,pers_nom,pers_age,pers_inscription,pers_statut,pers_type,pers_description,pers_salaire)  
VALUES
('Brad','PITT',	60,	'1970/01/01',1,	'non membre','lorem ipsum', 2000000),
('George','Cloney',62,'1999-01-01',1,'membre','juste beau',4000000),
('Jean','DUJARDIN',51,'1994-01-01',0,'membre','brice de nice',1000000)
;
```

## Partie 3 Afficher

- Afficher le plus gros chiffre d'affaire (avec MAX)
[doc max w3](https://www.w3schools.com/sql/func_mysql_max.asp)  
- Afficher le plus petit chiffre d'affaire (avec MIN)
[doc min w3](https://www.w3schools.com/sql/func_mysql_min.asp)    
- Afficher le nom de l'acteur (et son salaire) qui a le plus petit salaire
- Afficher le nom de l'acteur (et son salaire) qui a le plus gros salaire
- Afficher le salaire moyen
- Afficher le nombre de personnes
- Proposer une requete avec BETWEEN
- Proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()
- Proposer une requete avec LIKE '%..%'
- Trier par age les membres
- Trier par age les membres
- Afficher le nombre de membres
- Afficher le nombre des membres et  des non membres


```mysql
-- Afficher le plus gros chiffre d'affaire (avec MAX)
SELECT 
MAX(salaire) AS plus_gros_ca 
FROM inv_personne;
```

```mysql
-- Afficher le plus petit chiffre d'affaire (avec MIN)
SELECT 
MIN(salaire) AS plus_gros_ca 
FROM inv_personne;
```
```mysql
-- Afficher le nom de la personne du plus petit CA
SELECT 
salaire,prenom,nom
FROM inv_personne 
ORDER BY salaire ASC
LIMIT 1;
```

```mysql
-- Afficher le nom de la personne du plus gros CA
SELECT 
salaire,prenom,nom
FROM inv_personne 
ORDER BY salaire DESC
LIMIT 1;
```

```mysql
-- Afficher le salaire moyen
SELECT AVG(salaire) AS salaire_moyen from inv_personne
```

```mysql
-- Afficher le nombre de personnes

SELECT COUNT(id) FROM inv_personne;

-- GROUP BY utilisé souvent avec COUNT
```

```mysql
-- Proposer une requete avec BETWEEN

SELECT
prenom,nom
FROM inv_personne
WHERE salaire BETWEEN 1000000 AND 40000000; 

```

alternative :
```mysql  
SELECT
prenom,nom
FROM inv_personne
WHERE salaire > 1000000
AND salaire < 4000000;
```


```mysql
-- Proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()
Select UCASE(prenom) FROM personne
```


```mysql
-- Proposer une requete avec LIKE '%..%'
SELECT nom, prenom FROM personne
WHERE prenom LIKE 'b%'
```


```mysql
SELECT 
prenom,nom
FROM inv_personne
WHERE type='membre'
ORDER BY age,nom,prenom;
```