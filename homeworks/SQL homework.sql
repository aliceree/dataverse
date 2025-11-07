-- Zjistěte, kolik jednotlivých produktů
-- s jednotkovou cenou (cenou za 1 kus, sloupec Pricenew)
-- mezi 500 a 600 dolary (včetně 500 a 600 dolarů) se prodalo v roce 2014.
-- Ve výstupu uveďte ID produktu, jeho název, výrobce, jednotkovou cenu
-- a počet prodaných kusů daného výrobku. Výsledky seřaďte
-- podle počtu prodaných kusů od nejvíce prodaných po nejméně.

-- Správné řešení má 78 řádků.

SELECT p.productID, p.product, 