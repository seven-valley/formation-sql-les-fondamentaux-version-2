# TP 03 les chats

![terminal](/img/07/tableau.png)
  
![maincoon](/img/09/maincoon.webp)
![siamois](/img/09/siamois.webp)
![bengal](/img/09/bengal.webp)
![scottish](/img/09/scottish.webp)


```sql
USE zoo;

-- INSERTION DES DONNES
TRUNCATE chat;

INSERT INTO chat (nom,yeux,age)
VALUES
('maine coon','marron',20),
('siamois','bleu',15),
('bengal','marron',18),
('scottish Fold','marron',10);

-- Trier les chats par nom et par age
SELECT
id,nom,yeux,age
FROM chat
ORDER BY nom,age;

```

01 - Créer la data base **zoo**  
02 - Créer la table **chat**  
03 - Ajouter les données  
04 - Afficher le chat avec l'id :2  
05 - Trier les chats par nom et par age  
06 - Afficher les chats qui vive entre 11 et 19 ans  
07 - Afficher le ou les chats dont le nom contient 'sia'  
08 - Afficher la moyenne d'age des chats  
09 - Afficher le nombre de chats dans la table   
10 - Afficher le nombre de chat par couleur d'yeux
avec **COUNT()** et **GROUP BY()**  
marron : 3  
bleu : 1  
  
[BONUS] 11 - Ajouter les données à partir d'un fichier excel  

# Correction structure de la table

```mysql
-- CREATION DATA BASE
CREATE DATABASE IF NOT EXISTS zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE zoo;

-- SUPPRIMER LA TABLE
DROP TABLE IF EXISTS chat;

CREATE TABLE IF NOT EXISTS chat(
 id INT NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 yeux VARCHAR(20) NOT NULL,
 age INT NOT NULL,
 CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

-- INSERTION DES DONNES
TRUNCATE chat;

INSERT INTO chat (nom,yeux,age)
VALUES
('maine coon','marron',20),
('siamois','bleu',15),
('bengal','marron',18),
('scottish Fold','marron',10);

-- affiche 
SELECT * from chat;
```

```mysql
# 04 - Ajouter les données 
SELECT 
*
FROM chat  where id=2;
```

```mysql
# 05 - Afficher le chat avec l'id :2 
SELECT 
id, nom, yeux, age 
FROM chat 
WHERE id=2
```

```mysql
# 06 - Afficher les chats qui vive entre 11 et 19 ans 
SELECT 
nom, age 
FROM chat 
WHERE age >=11
AND age <=19
```
```mysql
# 07 - Afficher le ou les chats dont le nom contient 'sia'  
SELECT 
id, nom, yeux, age 
FROM chat 
WHERE nom LIKE 'sia%'
```
```mysql
# 08 - Afficher la moyenne d'age des chats  
SELECT 
AVG(age)
FROM chat 
```
```mysql
# 09 - Afficher le nombre de chats dans la table 
SELECT 
COUNT(id) AS nb_chat
FROM chat  
```

