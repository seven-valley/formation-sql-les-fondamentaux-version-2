# 5 Extraire les données :heart_eyes:

### SELECT
La commande **SELECT** permet d'extraire tous les films
```mysql
SELECT * FROM film
```

Il préférable de cibler les champs :

```mysql
SELECT id,titre FROM film
```
### AS
je peux aussi créer des alias avec **as**
```mysql
SELECT 
id as numero,
titre as nom
FROM film
```
### WHERE
je peux aussi mettre une condition avec **WHERE**
```mysql
SELECT 
id,titre,sortie
FROM film
WHERE id=1
```

### AND
je peux filtre avec **WHERE** et **AND**  
```mysql
SELECT 
id,titre,sortie
FROM film
WHERE titre='STAR WARS'
AND id=1
```
### LIMIT
je peux aussi limiter le nombre de résultats avec **LIMIT** 
```mysql
SELECT 
id,titre,sortie
FROM film
LIMIT 2
```
### ORDER BY
Pour classer les film par date justilise **ORDER BY**
avec **ASC** ou **DESC**
```mysql
SELECT 
id,titre,sortie
FROM film
ORDER BY sortie DESC
```