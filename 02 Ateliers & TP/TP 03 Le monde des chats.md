# TP 3 Le monde des chats - partie 2
<img src="../img/num/three.webp" width="100"> 
Prise en main des commandes :  
  
<code>INSERT INTO</code>    
<code>SELECT</code>    
   
| id | nom | yeux | age |
|---|---|---|---|
| 1 | Maine coon | marron | 20 |
| 2 | Siamois | bleu | 15 |
| 3 | Bengal | marron | 18 |
| 4 | Scottish Fold | marron | 10 |
  
![maincoon](../img/tp/tp1/maincoon.webp)
![siamois](../img/tp/tp1/siamois.webp)
![bengal](../img/tp/tp1/bengal.webp)
![scottish](../img/tp/tp1/scottish.webp)

## Pour rappel voici la structure de la table
```sql
DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE zoo;

CREATE TABLE IF NOT EXISTS chat(
 id INT NOT NULL AUTO_INCREMENT,
 nom VARCHAR(50) NOT NULL,
 yeux VARCHAR(20) NOT NULL,
 age INT NOT NULL,
 CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=INNODB;
```

:one: - Ajouter les données  
:two: - Afficher le chat avec l'id :2  
:three: - Trier les chats par nom et par age  
:four: - Afficher les chats qui vive entre 11 et 19 ans  
:five: - Afficher le ou les chats dont le nom contient 'sia'  
:six: - Afficher le ou les chats dont le nom contient 'a'  
:seven: - Afficher la moyenne d'age des chats  
:eight: - Afficher le nombre de chats dans la table   
:nine: - Afficher le nombre de chat avec couleur d'yeux marron  
**10** - Afficher le chat avec la plus petite durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>     
**11** - Afficher le chat avec la longue petite durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>     
**12** - Afficher le nombre de chat par couleur des yeux    $\color{red}{\text{[BONUS]}}$    :cactus::cactus: 
**13** - Ajouter les données à partir d'un fichier excel   $\color{red}{\text{[BONUS]}}$ :cactus::cactus::cactus:   

# Résultats attendus
:two: - Afficher le chat avec l'id :2 
| id | nom | yeux | age |
|---|---|---|---|
| 2 | Siamois | bleu | 15 |
  
:three: - Trier les chats par nom et par age  

| id | nom | yeux | age |
|---|---|---|---|
| 3 | Bengal | marron | 18 |
| 1 | Maine coon | marron | 20 |
| 4 | Scottish Fold | marron | 10 |
| 2 | Siamois | bleu | 15 |

:four: - Afficher les chats qui vive entre 11 et 19 ans  
| id | nom | yeux | age |
|---|---|---|---|
| 3 | Bengal | marron | 18 |
| 2 | Siamois | bleu | 15 |

:five: - Afficher le ou les chats dont le nom contient 'sia'
| id | nom | yeux | age |
|---|---|---|---|
| 2 | Siamois | bleu | 15 |  

:six: - Afficher le ou les chats dont le nom contient 'a'
| id | nom | yeux | age |
|---|---|---|---|
| 1 | Maine coon | marron | 20 |
| 2 | Siamois | bleu | 15 |
| 3 | Bengal | marron | 18 |

:seven: - Afficher la moyenne d'age des chats 
| age_moyen |
|---|
| 15.7500 |

:eight: - Afficher le nombre de chats dans la table
| nb_chat |
|---|
| 4 |   

:nine: - Afficher le nombre de chat avec la couleur des yeux marron
| couleur | nb_chat |
|---|---|
| marron | 3 |

**10** - Afficher le chat avec la plus petite durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>    
| id | nom | yeux | age |
|---|---|---|---|
| 4 | Scottish Fold | marron | 10 |
    
**11** - Afficher le chat avec la longue petite durée de vie avec <code>LIMIT</code> & <code>ORDER BY</code>      
| id | nom | yeux | age |
|---|---|---|---|
| 1 | Maine coon | marron | 20 |


**12** - Afficher le nombre de chat par couleur des yeux
| couleur | nb_chat |
|---|---|
| marron | 3 |
| bleu | 1 |





