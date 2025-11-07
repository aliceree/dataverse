import math

class Locality: # lokalita
    def __init__(self, locality, locality_coefficient):
        self.locality = locality
        self.locality_coefficient = locality_coefficient

class Property(Locality): # nemovitost
    def __init__(self, locality, locality_coefficient):
        super().__init__(locality, locality_coefficient)

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
        estate_tax = self.area * self.locality_coefficient * self.estate_types[self.estate_type]
        return math.ceil(estate_tax)


class Residence(Property): # byt, dům
    def __init__(self, locality, locality_coefficient, commercial, area):
        super().__init__(locality, locality_coefficient)
        self.area = area
        self.commercial = commercial

    def calculate_tax(self):
        resience_tax = self.area * self.locality_coefficient * 15
        if self.commercial==True:
            resience_tax *= 2
        return math.ceil(resience_tax)

farmland = Estate("Manětín", 0.8, "land", 900)
house = Residence("Manětín", 0.8, False, 120)
office = Residence("Brno", 3, True, 90)

print(farmland.calculate_tax())
print(house.calculate_tax())
print(office.calculate_tax())