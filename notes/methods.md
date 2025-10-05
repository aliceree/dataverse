# metody pro řetězce
= způsob analýzy řetězce

`print("martin".upper())` # všechna písmena verzálkama
`print("   martin   ".strip())` # odstraní mezery navíc
`print("po út st čt pá".split(" "))` # rozseká řetězec na kouskly dle zadaného oddělovače `sep`.
`print("+".join(["1", "2", "3", "4"]))` # spojí řetězce v seznamu `list` do jednoho velkého řetězce


- metoda `replace(old, new)` funguje jako "najít a nahradit"  
`text = "Kurz vede lektor Marek"`  
`novy_text = text.replace("Marek", "Martin")` # Vypíše Kurz vede lektor Martin
`print(novy_text)`


- metoda `append()` přidává novou položku na již existující seznam  
`guest_list = ["Jirka", "Klára", "Natálie"]`  
`print(guest_list[-1])` # vypíše Natálie  
`guest_list.append("Adéla")`  
`print(guest_list[-1])` # vypíše Adéla  
