# :cocktail: TP 01 VIP Cocktail
## La correction
<img src="../../img/c.webp" width="100">  

Nou allons créer une liste d'invités pour des soirées VIP  
![brad](../../img/03/brad.webp)
![george](../../img/03/george.webp)
![jean](../../img/03/jean.webp)
  

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
  
| id | prenom | nom | age | inscription | statut | type | description | salaire |
|---|---|---|---|---|---|---|---|---|
| 1 | Brad | PITT | 60 | 01/01/1970 | 1 | non membre | lorem ipsum | 2 000 000 |
| 2 | George | Cloney | 62 | 01/01/1999 | 1 | membre  | juste beau | 4 000 000 |
| 3 | Jean | DUJARDIN | 51 | 01/01/1994 | 0 | membre | brice de nice | 1 000 000 |


:one: Créer une base de donnée : **invitation**  
:two: Créer une table : **personne**  
:three: Rajouter le prefixe <code>inv_</code> à votre table   


## La correction  :heart_eyes: :
```mysql

DROP DATABASE IF EXISTS invitation;
CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE invitation;
DROP TABLE IF EXISTS inv_personne;
CREATE TABLE inv_personne(
    pers_id int NOT NULL AUTO_INCREMENT, 
    pers_prenom VARCHAR(100) NOT NULL,
    pers_nom VARCHAR(100) NOT NULL,
    pers_age INT NOT NULL,
    pers_inscription DATE NOT NULL,
    pers_statut TINYINT NOT NULL DEFAULT 1, -- 1 ok 0 pas ok
    pers_type ENUM('membre','NON MEMBRE') NOT NULL DEFAULT 'NON MEMBRE',
    pers_description TEXT, -- peut etre null
    pers_salaire INT NOT NULL,
    CONSTRAINT pk_personne PRIMARY KEY(pers_id) # pk_personne le nom de la contrainte
) ENGINE=InnoDB; 
 
```
