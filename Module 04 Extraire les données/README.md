# Module 04 - Extraire les données

<a href="../00 Les fichiers PDF - Supports de cours/04 Extraire les données.pdf">
  <img src="../img/04/m4.png" width="300">
</a>  
<br>
<a href="../00 Les fichiers PDF - Supports de cours/04 Extraire les données.pdf">
04 Extraire les données
</a> 
  
  
## SELECT
La commande **SELECT** permet d'extraire tous les films avec <code>*</code>
```sql
SELECT * FROM film
```
Cette commande affiche :  
| id | titre | sortie |
|---|---|---|
| 1 | STAR WARS | 1977/05/25 |
| 2 | THE MATRIX | 1999/06/23 |
| 3 | PULP FICTION | 1994/10/26 |

Il préférable de cibler les champs :
Chaque champ est séparé par une virgule <code>,</code>

```sql
SELECT id,titre FROM film
```
Cette commande affiche :  
| id | titre |
|---|---|
| 1 | STAR WARS |
| 2 | THE MATRIX |
| 3 | PULP FICTION |

## AS
je peux aussi créer des alias avec **AS**
```sql
SELECT 
id AS numero,
titre AS nom
FROM film
```
Cette commande affiche :  
| numero | nom |
|---|---|
| 1 | STAR WARS |
| 2 | THE MATRIX |
| 3 | PULP FICTION |
  
### WHERE
je peux aussi mettre une condition avec **WHERE**
```sql
SELECT 
id,titre,sortie
FROM film
WHERE id=1
```

### AND
je peux filtre avec **WHERE** et **AND**  
```sql
SELECT 
id,titre,sortie
FROM film
WHERE titre='STAR WARS'
AND id=1
```
### LIMIT
je peux aussi limiter le nombre de résultats avec **LIMIT** 
```sql
SELECT 
id,titre,sortie
FROM film
LIMIT 2
```
### ORDER BY
Pour classer les film par date justilise **ORDER BY**
avec **ASC** ou **DESC**
```sql
SELECT 
id,titre,sortie
FROM film
ORDER BY sortie DESC
```