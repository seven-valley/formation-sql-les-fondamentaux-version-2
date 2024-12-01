# TP 08 - Les films avec catégories
## :warning: La correction

<img src="../../img/c.webp" width="100">  <img src="../../img/eight.webp" width="100"> 

<img src="../../img/05/film_categ.svg" width="600">



# Objectifs :
:one: Afficher tous les chats avec la couleur des yeux :
| id | titre | sortie | categorie |
|---|---|---|---|
| 1 | STAR WARS | 1977/05/25 | Sciences Fiction |
| 2 | THE MATRIX | 1999/06/23 | Sciences Fiction |
| 3 | PULP FICTION | 1994/10/26 | Thriller |

```sql
USE netflix;

SELECT 
film.titre as film,
film.sortie,
categ.nom as categ
FROM film
LEFT JOIN categ 
ON film.categ_id = categ.id;
```

:two: Afficher le nombre films par catégories
| categories | nb_films |
|---|---|
| Sciences Fiction | 2 |
| Thriller | 1 |
```sql
USE netflix;

SELECT 
categ.nom as categ,
COUNT(film.id) AS nb_film
FROM film
LEFT JOIN categ 
ON film.categ_id = categ.id
GROUP BY (categ.id);
```
:three: Faire le script pour supprimer les table <code>DROP TABLE</code>
```sql
USE netflix;

DROP TABLE film; # 1 en premier
DROP TABLE categ;
```