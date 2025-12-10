--Lidé s vyšší fyzickou aktivitou mají delší spánek a lepší kvalitu spánku.

SELECT AVG(Physical_Activity_Level), AVG(Sleep_Duration), AVG(Quality_of_Sleep)
FROM sleep
GROUP BY Physical_Activity_Level
ORDER BY Physical_Activity_Level DESC;

--Lidé s fyzickou aktivitou na levelu do 85 skutečně čím více fyzické aktivity mají, tím více a lépe spí.
--Po překročení tohoto levelu již délka i kavlita spánku klesá.

/* ChatGPT říká:
Od hodnoty fyzické aktivity kolem 30–40 vidíme poměrně krátký spánek (5–6 hodin) a nízkou kvalitu spánku (kolem 5–6 bodů).
Jak se fyzická aktivita zvyšuje na 60–80, průměrná délka spánku i kvalita rostou — kolem 7,5–8 hodin a 8–9 bodů.
Ale u 90 dojde k poklesu, spánek má v průměru 6,96 h a kvalita spánku kolem 7,07, což je méně než u 80 nebo 85.

Délka a kvalita spánku rostou s mírou fyzické aktivity, ale při extrémní aktivitě může dojít k obrácení trendu.
*/