# SQL

# operátory
| Operátor       | Datový typ      | Příklad zápisu                                                                 |
|----------------|-----------------|--------------------------------------------------------------------------------|
| * / + -        | number          | `... WHERE sloupec1 = hodnota1 * hodnota2`                                     |
| < <= > >=      | number          | `... WHERE sloupec >= hodnota`                                                 |
| =              | number, string  | `... WHERE sloupec = 'hodnota'`                                                |
| <>             | number, string  | `... WHERE sloupec <> 'hodnota'`                                               |
| LIKE           | number, string  | `... WHERE sloupec LIKE '%1'` <br> `... WHERE sloupec LIKE '1%'` <br> `... WHERE sloupec LIKE '%1%'` |
| BETWEEN        | number          | `... WHERE sloupec1 BETWEEN hodnota1 AND hodnota2` <br> (same as x >= y AND x <= z) |
| IN, NOT IN     | number, string  | `... WHERE sloupec1 IN ('hodnota1', 'hodnota2')`                               |
| IS NULL/IS NOT NULL | number, string | `... WHERE sloupec1 IS NULL`                                                |

# agregační funkce
- GROUP BY  
Seskupování řádků podle vybraných sloupců umožňuje lépe analyzovat data a získávat souhrnná data v rámci jednoho dotazu. Seskupování se provádí pomocí klauzule GROUP BY společně s názvem sloupce, podle kterého chceme seskupovat.

```sql
SELECT category
FROM product
GROUP BY category;
```

- funkce pro získávání některých souhrnných údajů:  
- v dotazu umožní spočítat výsledek dle zvolené funkce

| Funkce             | Význam                    |
|--------------------|---------------------------|
| `AVG(sloupec)`     | Průměr hodnot sloupce     |
| `MAX(sloupec)`     | Maximální hodnota sloupce |
| `MIN(sloupec)`     | Minimální hodnota sloupce |
| `SUM(sloupec)`     | Součet hodnot sloupce     |
| `COUNT(sloupec)`   | Počet hodnot v tabulce    |

- lze je použít samostatně i ve spojení s GROUP BY
- samostatně:
```sql
SELECT SUM(pricenew)
FROM product;
```
- ve spojení s GROUP BY:
```sql
SELECT category, SUM(pricenew)
FROM product
GROUP BY category;
```

## příklady

**Zadání 1**: Zjistit průměr, minimum, maximum, sumu a pocet pro cenu (Price) za kategorii (Category).

```sql
SELECT Category,
AVG(Price),
MIN(Price),
MAX(Price),
SUM(Price),
COUNT (Price)
FROM Product GROUP BY Category;
```

**Zadáná 2**: Jaké byli celkové tržby za rok 2014?
```sql
SELECT SUM(revenue)
FROM sales
WHERE date LIKE '2014%';
```

Zadání 3: Jaká byla průměrná tržba za 1 prodej v lichých letech?
```sql
SELECT AVG(revenue)
from sales 
where date like '2013%' OR date like '2015%'; --WHERE date >: '2013-01-01' AND < '2014-01-01') OR (date >='2015-01-01' AND < '2016-01-01')
```

Zadání 4: Který produkt (Productid) měl v roce 2014 největší tržby?
```sql
SELECT ProductID,SUM(Revenue)
FROM Sales
WHERE Date >= '2014-01-01' AND Date < '2015-01-01'
GROUP BY ProductID
ORDER BY SUM(Revenue) DESC;
```

Zadání 5: Kolik máme produktů v kategorii Rural? Výsledný sloupec přejmenujte na „ProductCount“.
```sql
SELECT COUNT(productid) AS ProductCount
FROM product
WHERE category = 'Rural'
```

Zadání 6: Průměrná cena (výsledek přejmenujte na „Prum_cena“) za kategorii? Zajímají nás pouze ceny větší jak 0 a kategorie Mix a Urban.
```sql
SELECT category, AVG(pricenew) AS Prum_cena
FROM product
WHERE pricenew > 0 AND category IN ('Mix', 'Urban')
GROUP BY category;
```
