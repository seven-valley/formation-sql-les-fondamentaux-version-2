# TP 12 - SITE E-commerce
## :warning: La correction

<img src="../../img/c.webp" width="100">  <img src="../../img/ten.webp" width="100">


<img src="../../img/05/e-commerce.svg" width="800">

<img src="../../img/15/c.png" width="300">


:one: Afficher la commande de Brad
```sql
SELECT 
client.prenom AS prenom,
client.nom AS nom,
commande.date_achat as date_achat,
article.nom AS nom,
ligne.prix AS prix,
ligne.nombre AS nb,
ligne.prix*ligne.nombre AS total
FROM
commande
INNER JOIN ligne ON commande.id = ligne.commande_id
INNER JOIN article ON article_id= article.id
INNER JOIN client ON client.id = commande.client_id
WHERE commande_id=1;

-- le TOTAL
SELECT 
 SUM(ligne.prix*ligne.nombre) AS total_ht,
 SUM(ligne.prix*ligne.nombre*0.2) AS total_tva,
 SUM(ligne.prix*ligne.nombre*1.2) AS total_ttc
FROM
commande
INNER JOIN ligne ON commande.id = ligne.commande_id
WHERE commande_id=1;
```
