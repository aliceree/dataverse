from dataclasses import dataclass

@dataclass
class Employee:
    name: str
    position: str
    holiday_entitlement: int

    def __str__(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."
   
    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return "Schváleno"
        else:
            return "Na tolik dní nemáš nárok"

@dataclass        
class Manager(Employee):
    subordinates: int
    car: str

    def __str__(self):
        text = super().__str__()
        return f"{text} Má {self.subordinates} podřízené."

frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klára Nová", "konstruktérka", 25)
marian = Manager("Marian Přísný", "vedoucí", 25, 2, "Škoda Octavia")
print(frantisek.take_holiday(20))
print(marian)