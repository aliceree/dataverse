-- prozkoumávání dat
SELECT COUNT(*) AS TotalStudents -- kolik je studentů v datasetu
    FROM student_performance;

SELECT -- základní statistiky o výsledcích zkoušek
    MIN(Exam_Score) AS MinimumExamScore,
    MAX(Exam_Score) AS MaximumExamScore,
    AVG(Exam_Score) AS AverageExamScore
FROM student_performance;

-- analýza faktorů ovlivňujících výkon studentů
SELECT -- rozdělení studemtů podle úspešnsoti
    CASE -- podmínkový výraz (něco jako if-else)
        WHEN Exam_Score < 60 THEN 'nízký výsledek (pod 60 bodů)'
        WHEN Exam_Score BETWEEN 60 AND 69 THEN 'průměrný výsledek (60-69 bodů)'
        WHEN Exam_Score BETWEEN 70 AND 79 THEN 'dobrý výsledek (70-79 bodů)'
        ELSE 'vynikající výsledek (nad 80 bodů)'
    END AS uroven_vysledku, -- konec CASE + název sloupce
    COUNT(*) AS pocet_studentu, -- agregační funkce, která spočítá kolik je v té skupině řádků (= počet studentů)
    ROUND(AVG(Exam_Score)) AS prumerne_skore -- průměrné skóre v dané skupině zaokrouhlené na 2 desetinná místa
FROM student_performance
GROUP BY uroven_vysledku -- seskupení podle úrovně výsledků
ORDER BY pocet_studentu DESC; -- řazení podle počtu studentů sestupně

SELECT -- jak souvisí množství hodin věnovaných studiu s výsledkem
    CASE
        WHEN Hours_Studied BETWEEN 0 AND 5 THEN '0-5 hodin'
        WHEN Hours_Studied BETWEEN 6 AND 10 THEN '6-10 hodin'
        WHEN Hours_Studied BETWEEN 11 AND 15 THEN '11-15 hodin'
        ELSE '16 a více hodin'
    END AS studijni_cas,
    COUNT(*) AS pocet_studentu,
    ROUND(AVG(Exam_Score), 2) AS prumerne_skore
FROM student_performance
GROUP BY studijni_cas
ORDER BY prumerne_skore DESC;

SELECT -- jak souvisí docházka s výsledkem
    CASE
        WHEN Attendance < 74 THEN 'nízká docházka (pod 74%)'
        WHEN Attendance BETWEEN 75 AND 85 THEN 'průměrná docházka (75-85%)'
        ELSE 'výborná docházka (86% a více)'
    END AS dochazka,
    COUNT(*) AS pocet_studentu,
    ROUND(AVG(Exam_Score), 2) AS prumerne_skore
FROM student_performance
GROUP BY dochazka
ORDER BY prumerne_skore DESC;