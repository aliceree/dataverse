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
