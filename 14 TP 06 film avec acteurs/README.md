# TP 06 Film avec acteurs
![db](../img/13/titanic.webp)
## Le modèle relationnel
![db](../img/13/db.webp)

## Les données
![db2](../img/13/data.png)

## La Base de données
```mysql
CREATE TABLE film (
  id INT  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_film PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE acteur (
  id INT NOT NULL AUTO_INCREMENT,
  prenom VARCHAR(100) NOT NULL,
  nom VARCHAR(100) NOT NULL,
   CONSTRAINT pk_acteur PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE film_has_acteur (
  film_id INT NOT NULL,
  acteur_id INT NOT NULL,
  CONSTRAINT pk_film_has_acteur PRIMARY KEY (film_id, acteur_id)
)ENGINE=INNODB;

ALTER TABLE film_has_acteur ADD CONSTRAINT fk_acteur FOREIGN KEY (acteur_id) REFERENCES acteur (id);
ALTER TABLE film_has_acteur ADD CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES film (id);
```
## les données
```mysql
INSERT INTO acteur (id, prenom, nom) VALUES
(1, 'Brad', 'PITT'),
(2, 'Léonardo', 'Dicaprio');

INSERT INTO film (id, nom) VALUES
(1, 'Fight Club'),
(2, 'Once Upon a time in Hollywood');

INSERT INTO film_has_acteur 
(film_id, acteur_id) 
VALUES 
('1', '1'), 
('2', '1'), 
('2', '2');
```

# Afficher tous les films et leur acteurs
```mysql
SELECT 
film.nom AS film,
acteur.prenom,
acteur.nom
FROM film
INNER JOIN film_has_acteur  ON film.id = film_has_acteur.film_id
INNER JOIN acteur ON acteur.id = film_has_acteur.acteur_id
```
# Reprendre la base du module 06

## 1 - Afficher tous les films de Léonardo DI CAPRIO 
 | film | acteur_prenom | acteur_nom |
|--- |--- |--- |
|Once Upon the time |  Leonardo | DICAPRIO |
|Fight Club |  Leonardo | DICAPRIO |

## 2 - Afficher le nombre de films par acteur 
| acteur_prenom | acteur_nom |  nb_films | 
|--- |--- |--- |
|  Leonardo | DICAPRIO | 1|
| Brad | PITT | 2 |

## 3 - Ajouter un film :TITANIC   
## 4 - Trouver le film qui n'a pas d'acteur
| film | 
|--- |
|  TITANIC |


##  1 - Afficher tous les films Léonardo
```mysql
SELECT 
film.nom AS film,
acteur.prenom,
acteur.nom
FROM film
INNER JOIN film_has_acteur  ON film.id = film_has_acteur.film_id
INNER JOIN acteur ON acteur.id = film_has_acteur.acteur_id
WHERE acteur_id=2
```
# 2 - Afficher le nombre de films par acteur
```mysql
SELECT 
COUNT(film.id) AS nb_films,
acteur.prenom,
acteur.nom
FROM film
INNER JOIN film_has_acteur  ON film.id = film_has_acteur.film_id
INNER JOIN acteur ON acteur.id = film_has_acteur.acteur_id
GROUP BY (acteur.id);
```

# 3 - Ajouter un film TITANIC
```sql
INSERT INTO film (nom) VALUES ('TITANIC');
```
# 4 - Trouver le film qui n'a pas d'acteur
```sql
SELECT 
film.nom, 
acteur_id
FROM film
LEFT JOIN film_has_acteur on film.id=film_has_acteur.film_id
WHERE acteur_id IS NULL
```