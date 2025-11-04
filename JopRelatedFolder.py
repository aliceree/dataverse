class Employee:
    def __init__(self, name: str, position, holiday_entitlement, manager):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        self.manager = manager
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, manager, subordinates, car):
        super().__init__(name, position, holiday_entitlement, manager)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, None, 5, "Škoda Octavia 1.5 TSI")
marketa = Manager("Markéta Polková", "teamleader", 25, marian, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25, marketa)

print(frantisek.manager.name)
