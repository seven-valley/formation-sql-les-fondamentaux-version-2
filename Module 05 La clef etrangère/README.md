# Module 05 - La clef etrangère

<a href="../00 Les fichiers PDF - Supports de cours/05 La clef étrangère.pdf">
  <img src="../img/05/m5.png" width="300">
</a>  
<br>
<a href="../00 Les fichiers PDF - Supports de cours/05 La clef étrangère.pdf">
05 La clef étrangère
</a> 

<br>
<br>   
  
<img src="../img/05/fruit.svg" width="600">
  

![salade](/img/10/salade.png)


# pseudo code pour db diagram

https://dbdiagram.io/home  
prompt db diagram :
```
Table fruit {
  id INT [pk, not null]
  nom VARCHAR(30) [not null]
  couleur_id INT [not null]
}

Table couleur {
  id INT [pk, not null]
  nom VARCHAR(30) [not null]
}

Ref: "couleur"."id" < "fruit"."couleur_id"
```

## Une clef étrangère ?
- c'est la clef primaire d'une autre table
- mise en place d'un **contrainte d'intégrité** de clef étragère:
- je viens vérifier que l'id ajouter est un id de clef primaire  
- La clef étragère couleur_id de la table fruit doit correspondre à la clef primaire de couleur  

# relation clef étrangère :
**Many to One** et **One To many**
Un fruit à une seule couleur : **Many to One**  
Une couleur est posséder par plusieurs fruis **One to   Many** 



## Création des tables Version 1 :
```mysql
CREATE TABLE couleur (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(30) NOT NULL
)ENGINE=InnoDB;


-- ajout de la contrainte de clef etrangere foreign key
CREATE TABLE fruit (
  id INT PRIMARY  KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(30) NOT NULL,
  couleur_id INT  NULL,
    CONSTRAINT fk_couleur FOREIGN KEY (couleur_id) REFERENCES couleur(id)
)ENGINE=InnoDB;
```
## Création des tables Version 2 :
```mysql

CREATE TABLE couleur (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(30) NOT NULL
)ENGINE=InnoDB;


CREATE TABLE fruit (
  id INT PRIMARY  KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(30) NOT NULL,
  couleur_id INT  NULL    
)ENGINE=InnoDB;

-- ajout de la contrainte de clef etrangere foreign key
ALTER TABLE fruit ADD CONSTRAINT fk_couleur FOREIGN KEY fruit(couleur_id) REFERENCES couleur (id);
```
# Détail de la creation de la contrainte d'intégrité avec ALTER TABLE
```mysql
# ALTER TABLE "la table qui contient la clef etrangere" 
# ADD CONSTRAINT "le nom de l'etiquette de la clef etrangere" 
# FOREIGN KEY "la table qui contient la clef etrangere(le champ de la clef etranger)" 
# REFERENCES "la table qui contient la clef primaire(le champ de la clef primaire)
ALTER TABLE fruit 
ADD CONSTRAINT fk_couleur 
FOREIGN KEY fruit(couleur_id)
REFERENCES couleur(id)
```


# Ajouter les données
```mysql
INSERT INTO couleur (nom) VALUES ('rouge'),('vert'),('bleu');
INSERT INTO fruit (nom,couleur_id) VALUES ('pomme',1),('poire',2),('cerise',NULL);
```
