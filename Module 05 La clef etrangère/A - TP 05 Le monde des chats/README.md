# TP 03 A Table de jointure

![chat](/img/09/chat.png)

![maincoon](/img/09/maincoon.webp)
![siamois](/img/09/siamois.webp)
![bengal](/img/09/bengal.webp)
![scottish](/img/09/scottish.webp)

<img src="../../img/05/chat_couleur.svg" width="600">

# objectif :
:one: - Création de la base de données **spa**  
:two: - Création de la table **chat**  
:three: - Creation de la table **couleur**  
:four: - Insérer  les données  

 

![alt text](image.webp)
## La structure
```sql

CREATE TABLE chat (
 id int NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 couleur_id int NOT NULL,
 CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;

CREATE TABLE couleur (
 id int NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 CONSTRAINT pk_couleur PRIMARY KEY (id)
)ENGINE=INNODB;

ALTER TABLE chat ADD CONSTRAINT fk_couleur FOREIGN KEY (couleur_id) REFERENCES couleur(id);
```

## Les data
```sql
INSERT INTO couleur (nom) VALUES
('marron'),
('bleu');



INSERT INTO chat (nom,couleur_id) VALUES
('maine coon',1),
('siaimois',2),
('bengal',1),
('Scottish Fold',1);
```

# BONUS Le prompt de dbDiagram
  
https://dbdiagram.io/home  
  
```
Table couleur{
  id int [pk,not null, increment]
  nom varchar(30) [not null]
}

Table chat{
  id int [pk,not null, increment]
  nom varchar(30) [not null]
  couleur_id int [not null]
}

Ref: "couleur"."id" < "chat"."couleur_id"
```

# AFFICHER 
```mysql
SELECT 
chat.nom as chat,
couleur.nom as couleur
FROM chat
INNER JOIN couleur 
ON chat.couleur_id = couleur.id
# la_table.le_champ
```