class Employee:
    def __init__(self, name, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
    def get_info(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."
    def take_holiday(self, days):
        self.holiday_entitlement = self.holiday_entitlement - days
frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klára Nová", "konstruktérka", 25)
print(frantisek.holiday_entitlement)
frantisek.take_holiday(5)
print(frantisek.holiday_entitlement)