-- Zjistěte, kolik produktů s cenou za kus (princenew)
-- mezi 500 a 600 dolary (včetně 500 a 600 dolarů) se prodalo v roce 2014.
-- Ve výstupu uveďte ID produktu, jeho název, výrobce, jednotkovou cenu
-- a počet prodaných kusů daného výrobku. Výsledky seřaďte
-- podle počtu prodaných kusů od nejvíce prodaných po nejméně.

-- Správné řešení má 78 řádků.

SELECT p.productID, p.product, m.manufacturer, p.pricenew AS PriceUSD, SUM(s.units) AS TotalUnits
FROM product p
JOIN manufacturer m ON p.manufacturerID = m.manufacturerID
JOIN sales s ON p.productID = s.productID
WHERE p.pricenew BETWEEN 500 AND 600
AND s.date >= '2014-01-01'
AND s.date < '2015-01-01'
GROUP BY p.productID, p.product, m.manufacturer, p.pricenew
ORDER BY TotalUnits DESC;

-- Zpracujte přehled, které výrobky firmy Currus se v roce 2015
-- vůbec neprodávaly. Použijte pro přípravu dat pohled nebo CTE.

-- Správné řešení má 116 produktů.

CREATE VIEW vwCurrusSales AS
SELECT p.productID, p.product, p.pricenew
FROM Product p
JOIN Manufacturer m ON m.ManufacturerID = p.ManufacturerID
WHERE m.Manufacturer = 'Currus';

SELECT vw.productID, vw.product, vw.priceNew
FROM vwCurrusSales vw
LEFT JOIN sales s ON s.productID = vw.productID
LEFT JOIN "date" d ON d.date = s.date AND d.year = 2015
GROUP BY vw.ProductID, vw.Product, vw.PriceNew
HAVING COUNT(d.Year) = 0;

-- Zpracujte přehled výrobců, kteří měli v roce 2013
-- v regionu East celkové tržby větší než 4 000 000 dolarů.

-- Správné řešení má 6 výrobců.

SELECT m.manufacturer, SUM(s.revenue) AS total_revenue
FROM product p
JOIN manufacturer m ON m.manufacturerID = p.manufacturerID
JOIN sales s ON p.productID = s.productID
JOIN country c ON c.zip = s.zip
WHERE s.date >= '2013-01-01'
    AND s.date < '2014-01-01'
    AND c.region = 'East'
GROUP BY m.manufacturer
HAVING SUM(s.revenue) > 4000000