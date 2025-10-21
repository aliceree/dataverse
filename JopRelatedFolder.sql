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

--ve které kategorii je nejvíce výrobků
SELECT Category, COUNT(productid)
FROM product
GROUP BY Category
ORDER BY COUNT(productid) DESC
LIMIT 1;

SELECT productid, AVG(revenue)
from sales
GROUP by productid
ORDER by AVG(revenue) DESC;

SELECT productid, AVG(revenue)
FROM sales
WHERE date LIKE '2013%' AND units >=5
GROUP BY productid
ORDER BY sum(revenue) DESC
LIMIT 1;

--ve kterém segmentu působí nejvíce výrobců
SELECT Segment, COUNT(DISTINCT manufacturerid) AS pocet_vyrobcu
FROM product
GROUP BY Segment
ORDER BY pocet_vyrobcu DESC;

SELECT * FROM country
WHERE 1=1
AND (city LIKE '_t%' OR city LIKE '%stown%')
AND region IN ('East', 'Central')
AND (District LIKE '%District #05%')
ORDER BY city;

SELECT *
from country
WHERE (region = 'Central' OR region = 'East') 
AND (city LIKE '_t%' OR city LIKE '%stown%')
AND district = 'District #05'
ORDER by city;

--Vypište města a k nim ostatní údaje z tabulky Country,
--která jsou z východního nebo centrálního regionu,
--(a zároveň) jejichž název má druhé písmeno `t`
--nebo mají ve svém názvu `stown`,
--a (zároveň) jsou z oblasti (district) `District #05`.
--Výstup seřaďte podle názvu města vzestupně.
--Pozor, v řetězci `District #05` je mezi `t` a `#` mezera.

SELECT * FROM Country
WHERE (Region = 'East' OR Region = 'Central')
	AND (City LIKE '_t%'
		OR City LIKE '%stown%')
	AND District = 'District #05'
ORDER BY City ASC;

SELECT *
FROM sales AS S
INNER JOIN Country AS C ON s.Zip = c.Zip
LIMIT 10;

--Vyber produkty, kterých bylo prodáno najednou více jak 40 kusů,
--k tomuto datu toho prodeje a počet prodaných kusů
--a z tabulky Product vyberte odpovídající název produktu.
SELECT s.ProductID, p.Product, s.Date, s.Units
FROM sales AS s
JOIN product AS p ON s.ProductID = p.ProductID
WHERE Units > 40
ORDER BY s.Units DESC;

--Zjisti TOP 100 prodejů dle tržby
--a k nim náležící informace
--z tabulky Country.
SELECT *
FROM sales AS s
JOIN Country AS c ON s.zip = c.Zip
ORDER BY s.Revenue DESC
LIMIT 100;

--Ve kterých státech jsme měli největší tržby?
SELECT c.State, SUM(s.Revenue) AS 'trzby'
FROM Country AS c
JOIN Sales AS s ON c.Zip = s.Zip
ORDER BY trzby DESC;

--Který výrobce vyrábí nejvíce různých / jedinečných výrobků?
SELECT m.Manufacturer, COUNT(p.ProductID) AS Pocet_vyrobku
FROM Manufacturer AS m
JOIN Product AS p ON m.ManufacturerID = p.ManufacturerID
GROUP BY m.Manufacturer
ORDER BY Pocet_vyrobku DESC
LIMIT 10;

--vypište seznam prodktů (název, kategorie, název výrobce), u který byla jednorázová tržba
--větší než 10 000 dolarů a dále vypiště prodeje, kdy k tomu došlo
-- sales, product, manufacturer

SELECT p.product, p.category, m.manufacturer, s.date, s.revenue
from sales s 
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
where revenue > 10000
order by p.Product;

--Jaké jsou v jednotlivých regionech tržby za výrobky společnosti Currus?
--regiony = country
--tržby = sales
--výrobce = manufacturer
--product --> spojení s manufacturer

SELECT c.region, SUM(s.revenue)
from sales s 
JOIN country c on s.zip = c.Zip
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
WHERE manufacturer = 'Currus'
GROUP by c.Region
ORDER by SUM(s.revenue) DESC;

--Kteří výrobci jsou nejprodávanější dle počtu různých produktů v regionu east?
SELECT count(DISTINCT s.productid) AS PocetProduktu, m.manufacturer
from sales s
JOIN country c on s.zip = c.Zip
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
where region = 'East'
GROUP by m.manufacturer
ORDER by PocetProduktu DESC;

--Které výrobky výrobce VanARsdel se vůbec nepordaly?
SELECT m.manufacturer, p.product, s.units
from product p
left join sales s on p.ProductID = s.ProductID
JOIN manufacturer m on p.ManufacturerID = m.ManufacturerID
where m.Manufacturer = 'VanArsdel' AND s.units ISNULL;

--Jaká byla výše příjmů v roce 2015 v jednotlivých měsících?
--Zajímají nás všechny měsíce (i ty, kde nenastaly žádné příjmy).
--Výstup seřaďte podle měsíců v roce.

SELECT d.MonthName, SUM(s.Revenue) AS total_revenue
FROM date d
LEFT JOIN sales s ON s.Date = d.Date
WHERE d.Year = '2015'
GROUP BY d.MonthName
ORDER BY d.MonthNo;

--Kolik různorodých produktů se prodalo v každém z měst?
--Zobrazte i města, kde se neprodal žádný výrobek.

SELECT c.City, COUNT(DISTINCT s.ProductID) 
FROM Country c
LEFT JOIN Sales s ON c.Zip = s.Zip
GROUP BY c.City
ORDER BY COUNT(DISTINCT s.ProductID);

CREATE VIEW vwNeprodaneProdukty AS
SELECT p.ProductID, p.Product, S.Units
FROM Product p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.Units ISNULL;

SELECT *



