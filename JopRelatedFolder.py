class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
   
    def __str__(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."
   
    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return "Schváleno"
        else:
            return "Na tolik dní nemáš nárok"
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

    def __str__(self):
        text = super().__str__()
        return f"{text} Má {self.subordinates} podřízené."

frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klára Nová", "konstruktérka", 25)
marian = Manager("Marian Přísný", "vedoucí", 25, 2, "Škoda Octavia")
print(marian)