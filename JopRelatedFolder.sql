SELECT logo
FROM manufacturer;

SELECT zip, units, revenue
FROM sales;

--vyber všechny sloupce z tab. product
SELECT *
FROM product;

--vyber sloupce produktid a product z tab. product
SELECT productid, product
FROM product;

--produkt, currency a prince do češtiny
SELECT product AS 'Produkt', price AS 'Cena', currency AS 'Měna'
FROM product;

-- vypíše pouze jedinečné záznamy
SELECT DISTINCT category
FROM product;

--vypiš prvních 10 záznamů z tabulky sales
SELECT *
FROM sales
LIMIT 10;

-- první 3 výrobci ze seznamu výrobců
SELECT manufacturer
FROM manufacturer
LIMIT 3;

-- vybrat výrobce a seřadit je sestupně
SELECT manufacturer
FROM manufacturer
ORDER BY manufacturer DESC;

-- výrobce od A po Z
SELECT manufacturer
FROM manufacturer
ORDER BY manufacturer;

/*Vyber jedinečné Regiony z tabulky Country (aby tam žádný region
nebyl dvakrát) a zobraz pouze první záznam.*/
SELECT DISTINCT region
FROM country
LIMIT 1;

/*Vyber všechny sloupce z tabulky Sales a seřaď výsledky sestupně
dle výše Revenue. V předcházejícím dotazu omez výsledek na pouze 5 řádků.*/
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 5;

-- všechny výrobky id 428
SELECT *
FROM product
WHERE productid = 428;

-- AND
SELECT *
FROM product
WHERE category = 'Urban' AND pricenew > 1000;

-- OR
SELECT *
FROM product
WHERE category = 'Urban' OR pricenew > 1000;

-- cena mezi 1000 - 1200 (BETWEEN)
SELECT *
FROM product
WHERE pricenew BETWEEN 1000 AND 1200;

-- výrobce Abbas
SELECT *
FROM manufacturer
WHERE manufacturer = 'Abbas';

-- LIKE
SELECT *
FROM product
WHERE product LIKE 'abbas MA___';

-- prodeje za leden 2013 (2012-01% - 2013-01-__)
SELECT *
FROM sales
WHERE date LIKE '2013-01%';

-- přejmenuj:
-- productid na kód produktu
-- product na nazve produktu
-- price new na cena
-- vybrat produkty nad 400$, jen 50 záznamů
SELECT productid AS 'Kód produktu', product AS 'Název produktu', pricenew AS 'Cena'
FROM product
WHERE pricenew > 400
LIMIT 50;

-- Co všechno jsme prodali (Sales) za rok 2014 (řádky tabulky Sales)?
-- výsledky seřaďte sestupně podle data prodeje (sloupec Date)
SELECT *
FROM sales
WHERE date LIKE '2014%'
ORDER BY date DESC;

--zjistit rok a jméno měsíce
----kdy rok je mezi 2013 a 2015
----měsíc začíná na písmeno 'J' nebo obsahuje písmeno 'a'.
--pracovat s tabulkou date
SELECT DISTINCT Year, MonthName
FROM Date
WHERE Year BETWEEN 2013 AND 2015
	AND (MonthName LIKE 'J%' OR MonthName LIKE '%a%');

-- pokračování v GitHubu

--součet pricenew
SELECT SUM(pricenew)
FROM product;

--součet cen za kategorie
SELECT category, SUM(pricenew)
FROM product
GROUP BY category;

--celkové tržby za rok 2014
SELECT SUM(revenue)
FROM sales
WHERE date LIKE '2014%';

--průměrná tržba za 1 prodej v lichých letech
SELECT AVG(revenue)
from sales 
where date like '2013%' OR date like '2015%'; --WHERE date >: '2013-01-01' AND < '2014-01-01') OR (date >='2015-01-01' AND < '2016-01-01')

--Který produkt (Productid) měl v roce 2014 největší tržby?
SELECT ProductID, SUM(Revenue)
FROM Sales
WHERE Date >= '2014-01-01' AND Date < '2015-01-01'
GROUP BY ProductID
ORDER BY SUM(Revenue) DESC;

--Kolik máme produktů v kategorii Rural? Výsledný sloupec přejmenujte na „ProductCount“.
SELECT COUNT(productid) AS ProductCount
FROM product
WHERE category = 'Rural'

--Průměrná cena (výsledek přejmenujte na „Prum_cena“) za kategorii?
--Zajímají nás pouze ceny větší jak 0 a kategorie Mix a Urban.
SELECT category, AVG(pricenew) AS Prum_cena
FROM product
WHERE pricenew > 0 AND category IN ('Mix', 'Urban')
GROUP BY category;

--HAVING
-- produkty, jejichž celkové tržby přesáhli 10 miliónů
SELECT productid, sum(revenue) AS 'Trzby'
from sales
GROUP by productid
having Trzby > 10000000
ORDER by Trzby DESC;

--bez aliasu
seleCT productid, sum(revenue)
from sales
GROUP by productid
having sum(revenue) > 10000000
ORDER by sum(revenue) DESC;

--Čeho jsme prodali v roce 2013 nejvíc - počet kusů.
--Zajímají nás produkty, kterých jsme prodali více jak 5000.
SELECT ProductID, SUM(Units) AS Pocet_kusu
FROM Sales
WHERE date LIKE '2013%'
GROUP BY ProductID
HAVING SUM(Units) > 5000
ORDER BY Pocet_kusu DESC;

--Kterých 10 výrobců má nejvíce různorodých kategorií výrobků?
SELECT manufacturerid, COUNT(DISTINCT category) AS 'Pocet_kategorii'
from product
group by manufacturerid
ORDER by Pocet_kategorii DESC
LIMIT 10;

