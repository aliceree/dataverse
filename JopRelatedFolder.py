class Car:
    def __init__(self, SPZ, car_brand, miles_driven, availability=True):
        self.SPZ = SPZ
        self.car_brand = car_brand
        self.miles_driven = miles_driven
        self.availability = availability
    
    def rent_car(self):
        if self.availability == True:
            self.availability = False
            return f"Potvrzuji zapůjčení vozidla."
        else:
            return f"Vozidlo není k dispozici."
        
    def __str__(self):
        return f"Automobil {self.car_brand} má SPZ {self.SPZ} a je {'k dispozici' if self.availability else 'nedostupný'}."
    
def user_input():
    if user_choice == Car1.car_brand:
        print(Car1.rent_car())
    elif user_choice == Car2.car_brand:
        print(Car2.rent_car())
    else:
        print("Taková značka není k dispozici.")
    
user_choice = input("Zadejte značku vozidla, které si přeješ vypůjčit: ")

Car1 = Car("4A2 3020", "Peugeot", 47534, True)
Car2 = Car("1P3 4747", "Škoda", 41253, True)

user_input()
print(Car2)
print(Car1)