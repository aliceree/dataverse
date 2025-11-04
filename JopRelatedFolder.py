class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian", "vedoucí konstrukčního oddělení", 25, 5, "Škoda Octavia")
frantisek = Employee("František", "konstruktér", 20)

if isinstance(frantisek, Manager):
    print(f"{frantisek.name} pochází ze třídy Manager.")
else:
    print(f"{frantisek.name} nepochází ze třídy Manager.")