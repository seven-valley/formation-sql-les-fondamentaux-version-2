-- a
SELECT * FROM clients
WHERE nom LIKE 'D%';

-- b
SELECT nom, Prenom FROM clients;

-- c
SELECT noFic, etat, nom, prenom
FROM fiches f
JOIN clients c USING (noCli)
WHERE cpo LIKE '44%';

-- d
SELECT  f.noFic, nom, prenom, 
		a.refart, designation, depart, retour, prixJour,
        (DAY(retour)-DAY(depart)+1) * prixJour as Montant
FROM 
	fiches f
	JOIN clients c USING (noCli)
    JOIN lignesfic l ON f.noFic = l.noFic
    JOIN articles a ON l.refart=a.refart
    JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
    JOIN tarifs t ON g.codeTarif = t.codeTarif
WHERE f.noFic=1006;

-- e
SELECT g.libelle as Gamme, avg(prixJour) as TarifMoyen
FROM grilletarifs gt 
JOIN gammes g USING (codeGam)
JOIN tarifs t USING (codeTarif)
GROUP BY Gamme;

-- f
SELECT a.refart, a.Designation, Count(noLig) as nbLocation
FROM lignesfic l 
JOIN articles a USING (refart)
GROUP BY a.refart, a.Designation
HAVING (nbLocation>=3);

-- g
SELECT  f.noFic, nom, prenom, 
	a.refart, designation, depart, retour, prixJour,
	(DAY(retour)-DAY(depart)+1) * prixJour as Montant, Total
FROM 
	fiches f
	JOIN clients c USING (noCli)
	JOIN lignesfic l ON f.noFic = l.noFic
	JOIN articles a ON l.refart=a.refart
	JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
	JOIN tarifs t ON g.codeTarif = t.codeTarif
    JOIN (
		SELECT  l.noFic,
			SUM((DAY(retour)-DAY(depart)) * prixJour) as Total
		FROM 
			lignesfic l
			JOIN articles a ON l.refart=a.refart
			JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
			JOIN tarifs t ON g.codeTarif = t.codeTarif
            WHERE l.noFic=1006
            GROUP BY l.noFic ) ss ON ss.noFic = f.noFic;

-- h 
SELECT c.libelle, g.libelle, t.libelle, prixJour
FROM grilleTarifs gt
	JOIN gammes g USING (codeGam)
	JOIN categories c USING (codeCate)
	JOIN tarifs t USING (codeTarif);

-- i 
SELECT a.refart, designation, count(*) nbLocation
FROM lignesfic l 
JOIN articles a USING (refart)
WHERE a.codeCate='SURF'
GROUP by a.refart;


-- j 
SELECT AVG(nblignesParfiche) as nbLignesMoyenParFiche
FROM (
		SELECT count(noLig) nblignesParfiche
		FROM lignesfic l 
		GROUP BY noFic) ss;


-- k
SELECT c.libelle, count(*)
FROM lignesfic l 
JOIN articles a USING (refart)
JOIN categories c USING(codeCate)
WHERE c.Libelle IN ('Ski Alpin','Surf','Patinette')
GROUP BY c.libelle;


-- l
SELECT avg(MontantParFiche)
FROM (
	SELECT noFic, SUM((DAY(retour)-DAY(depart)+1) * prixJour) MontantParfiche
	FROM lignesfic l 
	JOIN articles a USING (refart)
	JOIN grilletarifs g ON (a.codeGam=g.codeGam AND a.codeCate=g.codeCate)
	JOIN tarifs t USING (codeTarif)
	GROUP BY noFic) ;