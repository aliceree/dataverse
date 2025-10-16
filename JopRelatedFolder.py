class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight < 20:
            return 159
        else:
            return 359

    def get_info(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg, cena za jeho dopravu je {self.delivery_price()} a momentálně je ve stavu {self.state}."
    
balik = Package("Krakovksá 583/9, Praha", 11, "doručen")
balik2 = Package("Vinohradská 1234/45, Praha", 2.5, "nedoručen")
print(balik.get_info())