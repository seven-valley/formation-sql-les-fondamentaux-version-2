# :cocktail: TP 04 VIP Cocktail - partie 2
## :warning: La correction
<img src="../../img/c.webp" width="100">  

  
| id | prenom | nom | age | inscription | etat | statut | cv | salaire |
|---|---|---|---|---|---|---|---|---|
| 1 | Brad | PITT | 60 | 01/01/1970 | 1 | non membre | lorem ipsum | 2 000 000 |
| 2 | George | Cloney | 62 | 01/01/1999 | 1 | membre  | juste beau | 4 000 000 |
| 3 | Jean | DUJARDIN | 51 | 01/01/1994 | 0 | membre | brice de nice | 1 000 000 |
    
![brad](../../img/03/brad.webp)
![george](../../img/03/george.webp)
![jean](../../img/03/jean.webp)


# La correction :
:one: - Ajouter les données 
```sql
-- SELECTIONNER La base de données
USE invitation;
-- vider la table de ses données
TRUNCATE inv_personne;
-- inserer DATA données
INSERT INTO inv_personne 
    (prenom,nom,age,inscription,etat,statut,cv,salaire)  
VALUES
('Brad','PITT',	60,'1970-01-01',1,'non membre','lorem ipsum', 2000000),
('George','Cloney',62,'1999-01-01',1,'membre','juste beau',4000000),
('Jean','DUJARDIN',51,'1994-01-01',0,'membre','brice de nice',1000000);
```       

:two: - Afficher le plus gros salaire (avec MAX)  [doc max w3](https://www.w3schools.com/sql/func_mysql_max.asp)    
  
| plus_gros_salaire |
|---|
| 4000000 |
```sql
SELECT 
    MAX(salaire) AS plus_gros_salaire 
FROM inv_personne;
```
  
:three: - Afficher le plus petit chiffre d'affaire (avec MIN)  [doc min w3](https://www.w3schools.com/sql/func_mysql_min.asp) 
   
| plus_petit_salaire |
|---|
| 1000000 |
```sql
SELECT 
    MIN(salaire) AS plus_petit_salaire 
FROM inv_personne;
```
  
:four: - Afficher le nom de l'acteur (et son salaire) qui a le plus petit salaire avec <code>LIMIT</code> & <code>ORDER BY</code>
    
| prenom | nom | salaire |
|---|---|---|
| Jean | DUJARDIN | 1000000 |
  
```sql
SELECT 
prenom,nom,salaire
FROM inv_personne 
ORDER BY salaire DESC
LIMIT 1;
```

:five: - Afficher le nom de l'acteur (et son salaire) qui a le plus gros salaire avec <code>LIMIT</code> & <code>ORDER BY</code>
  
| prenom | nom | salaire |
|---|---|---|
| Jean | DUJARDIN | 1000000 |
  
```sql
SELECT 
prenom,nom,salaire
FROM inv_personne 
ORDER BY salaire ASC
LIMIT 1;
```     
:six: - Afficher le salaire moyen
  
| salaire_moyen |
|---|
| 2333333.3333 |   
  
:seven: - Afficher le nombre de personnes  
  
| nb_personnes |
|---|
| 3 | 
  
:eight: - Afficher les acteurs avec un salaire entre 1 000 000 et 4 000 000 avec <code>BETWEEN</code>
  
| id | prenom | nom | salaire |
|---|---|---|---|
| 1 | Brad | PITT | 2 000 000 |
  
:nine: Proposer une requete avec  <code>UPPER()</code> & <code>LOWER()</code> 
  
| id | prenom | nom |
|---|---|---|
| 1 | Brad | pitt | 


| id | prenom | nom |
|---|---|---|
| 1 | BRAD | pitt | 


10 - Afficher les personnes dont le prenom contient 'bra'  
  
| id | prenom | nom | salaire |
|---|---|---|---|
| 1 | Brad | PITT | 2 000 000 |
   
12 - Trier par age les membres 
   
| prenom | nom | age |
|---|---|---|
| Jean | DUJARDIN | 51 |
| George | Cloney | 62 |
  
13 - Afficher le nombre d'acteur "membre" 
  
| nb_membres |
|---|
| 2 | 
  
14 - Afficher le nombre des membres et  d'acteur "non membre"
   
| membre | nb_acteur| 
|---|---|
| membre | 2 |  
| non membre | 1 | 



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