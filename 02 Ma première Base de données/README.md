# Ma première Base de données

## Dans PhpMyAdmin ouvrez le terminal SQL
  
   
- 1 cliquer sur l'onglet SQL  
- 2 Saisir le code SQL 
- 3 Cliquez sur GO  
  
    
![terminal](/img/02/terminal.webp)

## une documentation bien utile !
https://www.w3schools.com/mysql/default.asp

## Création d'une base de données &#x1F600;
Commande pour créer une base
```mysql
CREATE DATABASE ma_base;
```

Il est préférable de rajouter l'encodage **UTF8**:
```mysql
CREATE DATABASE videotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Je precise la base que j'utilise
```mysql
USE videotheque;
```

Il est possible d'éffacer sa base
:warning: **Attention toutes les tables et donnée seront éffacées !** :scream:
```mysql
DROP DATABASE ma_data_base
```
## Création de notre première table

Voici la commande pour créer une table :
```mysql
CREATE TABLE film(...);
```

Effacer une table :
:warning: **Attention toutes les données seront éffacées !** :sweat_smile:
```mysql
DROP TABLE film;
```

Il est recommandé de:  
Je peux preciser le **moteur de stockage** de ma table  
InnoDB est un moteur de stockage : **storage engine**    
Sinon par défault j'aurais **MylSAM** au lien de innoDB    
Celà sera problématique pour les contraintes de clefs étrangère    

```mysql
CREATE TABLE film (..) ENGINE=InnoDB; 
```


## Les type de champs : Data types
https://www.w3schools.com/mysql/mysql_datatypes.asp

Les principaux types de champs:

| Champs | Types | Valeurs |
|----|---|---|
| INT | entier | de -2 147 483 648 à **2 147 483 648**  |
| TINYINT(1)   | entier  | de -128 à 127 |
| VARCHAR(255)  | chaîne de caractères  | de 0 à 255 caractères  |
| TEXT | chaîne de caractères  | de 0 à 65 535 caractères  |
| DECIMAL(3,2) | réels | de -999.00 à 999.00 |


:watch: Les dates  :
| Champs | Informations |
|----|---|
| DATE | juste la date  |
| DATETIME | la date et l'heure |
| TIMESTAMP | la date et l'heure - nombres de secondes écoulées depuis le 1er janv 1970 |
| YEAR | juste l'année  |

Autres  :
| Champs | Informations |
|----|---|
| ENUM ('vert','rouge') | choix prédéfini  |


## :key: Mise en place d'une clé primaire sur notre table
la clef primaire : **primary key** ou **PK**  
    
Afin d'identifier une ligne de façon précise on définit une clef primaire    
La clef primaire peut être définit par MySQL **AI AUTO_INCREMENT**   
:lock: La contrainte de clef primaire impose d'avoir qu'un seul ID  
c'est à dire si je rentre le même ID MySQL me bloque  
Car je viole la contrainte de clef primaire  
  
Nous rajoutons aussi la **contrainte de nullité**    
Car notre id ne peut être null

```mysql
CREATE TABLE film (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY
);
```
## :movie_camera: Création des autres champs :
:warning: Chaque ligne est terminée par une **virgule**   
**sauf la dernière ligne**
```mysql
USE videotheque;
CREATE TABLE film (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) NOT NULL,
  sortie DATE NOT NULL
) ENGINE=InnoDB;
```

Il est aussi possible de définir la clef primaire à la fin :

```mysql
USE videotheque;
CREATE TABLE film (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) NOT NULL,
  sortie DATE NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;
```

je peux rajouter des commentaires avec **#** ou **--**

```mysql
-- je selectionne ma database : videotheque
USE videotheque;
# creation table film;
CREATE TABLE film (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) NOT NULL,
  sortie DATE NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;
```
