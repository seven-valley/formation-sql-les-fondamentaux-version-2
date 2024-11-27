# Module 06 - Les jointures LEFT, RIGHT & INNER

<a href="../00 Les fichiers PDF - Supports de cours/06 Les jointures.pdf">
  <img src="../img/06/m6.png" width="300">
</a>  
<br>
<a href="../00 Les fichiers PDF - Supports de cours/06 Les jointures.pdf">
06 Les jointures
</a> 

   <br><br> 
    
<img src="../img/05/fruit.svg" width="600">
  
<img src="../img/10/salade.png" width="600">
  
  
https://www.w3schools.com/mysql/mysql_join_inner.asp
  
![inner](/img/08/inner.png)  
<img src="../img/06/inner.png" width="800">  



```sql
SELECT fruit.nom,couleur.nom 
FROM fruit
INNER JOIN couleur on fruit.couleur_id = couleur.id;
```


```sql
SELECT f.nom AS fruit,c.nom AS couleur
FROM fruit AS f
INNER JOIN couleur AS c on f.couleur_id = c.id;
```
![inner2](/img/08/inner2.png)  
  
## le LEFT JOIN
![left](/img/08/left.png)  
https://www.w3schools.com/sql/sql_join_left.asp

```mysql
SELECT f.nom AS fruit,c.nom AS couleur
FROM fruit AS f
LEFT JOIN couleur AS c on f.couleur_id = c.id;
```
![left2](/img/08/left2.png) 

# le RIGHT JOIN 
![right](/img/08/right.png)  
https://www.w3schools.com/sql/sql_join_right.asp

```mysql
SELECT f.nom AS fruit,c.nom AS couleur
FROM fruit AS f
RIGHT JOIN couleur AS c on f.couleur_id = c.id;
```
![right2](/img/08/right2.png)  

# Les jointures sur 3 tables
![ville](/img/09/3-table.png) 

![data](/img/09/3-data.png)

**code dbDiagram**
https://dbdiagram.io/
```


Table pays {
  id int [pk, not null, increment]
  nom VARCHAR(255) [not null]
}

Table region {
  id int [pk, not null, increment]
  nom VARCHAR(255) [not null]
  pays_id int [not null]
}

Table ville {
  id int [pk, not null, increment]
  nom VARCHAR(255) [not null]
  region_id int [not null]
}




Ref: "pays"."id" < "region"."pays_id"

Ref: "region"."id" < "ville"."region_id"
```

**la base de données**
```mysql
CREATE TABLE `pays` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL
)ENGINE=INNODB;

CREATE TABLE `region` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `pays_id` int NOT NULL
)ENGINE=INNODB;


CREATE TABLE `ville` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `region_id` int NOT NULL
)ENGINE=INNODB;


ALTER TABLE `region` ADD FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);

ALTER TABLE `ville` ADD FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);
```

**les données**
```mysql

INSERT INTO pays (id, nom) VALUES
(1, 'France'),
(2, 'belgique');

INSERT INTO region (id, nom, pays_id) VALUES
(2, 'Bretagne', 1);


INSERT INTO ville (id, nom, region_id) VALUES
(1, 'Rennes', 2),
(2, 'Brest', 2);

```

**la requète SELECT**
```mysql
-- afficher les ville avec la region et le pays

 SELECT 
 ville.nom AS ville,
 region.nom AS region,
 pays.nom AS pays 
 FROM ville 
 INNER JOIN region ON ville.region_id = region.id
 INNER JOIN pays ON region.pays_id= pays.id
```

```mysql
-- afficher le ville par pays
SELECT
pays.nom,
ville.nom
FROM pays
LEFT JOIN region ON pays.id = region.pays_id
LEFT JOIN ville ON region.id = ville.region_id;
```