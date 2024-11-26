# 4  Insertion des données :outbox_tray:
![star](../img/04/star.webp)
![matrix](../img/04/matrix.webp)
![pulp](../img/04/pulp.webp)


Pour insérer les données dans une table :
```mysql
INSERT INTO film (...) VALUES (...);
```

Je précise les champs :
```mysql
INSERT INTO film (id,titre,sortie) VALUES (...);
```
Et puis je rentre les valeurs :
```mysql
INSERT INTO film (id,titre,sortie) VALUES (1,'STAR WARS','1977/05/25');
```

Je ne suis pas obligé de mettre l'ID
```mysql
INSERT INTO film (titre,sortie) VALUES ('STAR WARS','1977/05/25');
```

Il est possible d'enchaîner les commandes comme celà :

```mysql
INSERT INTO film (...) VALUES
(...),
(...),
(...);
```

```mysql
INSERT INTO film (id,titre,sortie) VALUES
(1,'STAR WARS','1977/05/25'),
(2,'THE MATRIX','1999/06/23'),
(3,'PULP FICTION','1994/10/26');
```
**ou bien sans les ID** :
```mysql
INSERT INTO film (titre,sortie) VALUES
('STAR WARS','1977/05/25'),
('THE MATRIX','1999/06/23'),
('PULP FICTION','1994/10/26');
```

:warning: **Penser à vider la table** :scream:  
Pour vider la table :
```mysql
DELETE FROM film;
```

Pour vider la table et rpartir à l'ID=1:
```mysql
TRUNCATE film;
```

Effacer un film  
Effacer un enregistrement
```mysql
DELETE FROM film WHERE id=2;
```
