# V rámci aplikace nejprve vytvoř třídu Locality, která označuje lokalitu, kde se nemovitost nachází. Třída bude mít atributy name (název katastru/obce) a locality_coefficient (tzv. místní koeficient, který se používá k výpočtu daně).


# Vytvoř třídu Property, která bude reprezentovat nějakou nemovitost. Třída bude mít atribut locality (lokalita, kde se pozemek nachází, bude to objekt třídy Locality).


# Dále vytvoř třídu Estate, která reprezentuje pozemek a je potomkem třídy Property. Třída bude mít atributy locality, estate_type (typ pozemku), area (plocha pozemku v metrech čtverečních).

# Dále přidej metodu calculate_tax(), která spočítá výši daně pro pozemek
# a vrátí hodnotu jak celé číslo (pro zaokrouhlení použij funkci ceil() z modulu math).
# Daň vypočítej pomocí vzorce: plocha pozemku * koeficient
# dle typu pozemku (atribut estate_type) * místní koeficient.
# U atributu estate_type následující hodnoty a koeficienty:

# - land (zemědělský pozemek) má koeficient 0.85.
# - building site (stavební pozemek) má koeficient 9.
# - forrest (les) má koeficient 0.35,
# - garden (zahrada) má koeficient 2. 

# Uvažujme tedy například lesní pozemek o ploše 500 metrů čtverečních v lokalitě s místním koeficientem 2. Potom je daň 500 * 0.35 * 2 = 350.


# Vytvoř třídu Residence`, která reprezentuje byt, dům či jinou stavbu a je potomkem třídy Property. Třída bude mít atributy locality, area (podlahová plocha bytu nebo domu) a commercial (pravdivostní hodnota, která určuje, zda se jedná o nemovitost používanou k podnikání). Dále přidej metodu calculate_tax(), která spočítá výši daně pro byt a vrátí hodnotu jako číslo. Daň vypočítej pomocí vzorce: podlahová plocha * koeficient lokality * 15. Pokud je hodnota parametru commercial True, tj. pokud jde o komerční nemovitost, vynásob celou daň číslem 2.

# Příklad výpočtu: Uvažujme tedy například byt (určený k bydlení) o ploše 60 metrů čtverečních v lokalitě s koeficientem 3. Potom je daň 60 * 3 * 15 = 2700. Pokud by stejný byt byl používán k podnikání, daň by byla 60 * 3 * 15 * 2 = 5400.


# Vyzkoušej svůj program pomocí následujících nemovitostí:

# - Zemědělský pozemek o ploše 900 metrů čtverečních v lokalitě Manětín s koeficientem 0.8. Daň z této nemovitosti je 900 * 0.85 * 0.8 = 612.
# - Dům s podlahovou plochou 120 metrů čtverečních v lokalitě Manětín s koeficientem 0.8. Daň z této nemovitosti je 120 * 0.8 * 15 = 1440.
# - Kancelář (tj. komerční nemovitost) s podlahovou plochou 90 metrů čtverečních v lokalitě Brno s koeficientem 3. Daň z této nemovitosti je 90 * 3 * 15 * 2 = 8100.

import math
class Locality: # lokalita
    def __init__(self, locality, locality_coefficient):
        self.locality = locality
        self.locality_coefficient = locality_coefficient

class Property: # nemovitost
    def __init__(self, locality):
        super.__init__(locality)

class Estate(Property): # pozemek
    estate_types = {
        "land": 0.85,
        "building site": 9,
        "forrest": 0.35,
        "garden": 2
    }

    def __init__(self, locality, locality_coefficient, estate_type, area):
        super().__init__(locality, locality_coefficient)
        self.estate_type = estate_type
        self.area = area

    def calculate_tax(self):
        tax = self.area * self.locality_coefficient
        pass

class Residence(Property): # byt, dům
    def __init__(self, locality, commercial, area):
        super().__init__(locality)
        self.area = area
        self.commercial = commercial

    def calculate_tax(self):
        pass

farmland = Estate("Manětín", 0.8, "land", 900) # Daň z této nemovitosti je 900 * 0.85 * 0.8 = 612.
house = Residence("Manětín", False, 120) # Daň z této nemovitosti je 120 * 0.8 * 15 = 1440.
office = Residence("Brno", True, 90) # Daň z této nemovitosti je 90 * 3 * 15 * 2 = 8100.