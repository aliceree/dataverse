# agregační funkce

- GROUP BY
Seskupování řádků podle vybraných sloupců umožňuje lépe analyzovat data a získávat souhrnná data v rámci jednoho dotazu. Seskupování se provádí pomocí klauzule GROUP BY společně s názvem sloupce, podle kterého chceme seskupovat.

```sql
SELECT category
FROM product
GROUP BY category;
```

## Agregační funkce

Funkce pro získávání některých souhrnných údajů:  
- v dotazu umožní spočítat výsledek dle zvolené funkce  

| Funkce             | Význam                    |
|--------------------|---------------------------|
| `AVG(sloupec)`     | Průměr hodnot sloupce     |
| `MAX(sloupec)`     | Maximální hodnota sloupce |
| `MIN(sloupec)`     | Minimální hodnota sloupce |
| `SUM(sloupec)`     | Součet hodnot sloupce     |
| `COUNT(sloupec)`   | Počet hodnot v tabulce    |

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
