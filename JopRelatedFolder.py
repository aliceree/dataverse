class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def __str__(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg je ve stavu {self.state}"
    
    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight <= 20:
            return 159
        else:
            return 359
        
    def deliver(self):
        if self.state == "dorucen":
            return "Balík již byl doručen"
        elif self.state == "nedorucen":
            self.state = "dorucen"
            return "Doručení uloženo"

class ValuablePackage(Package):
    def __init__(self, address, weight, state, value):
        super().__init__(address, weight, state)
        self.value = value

    def __str__(self):
        text = super().__str__()
        return f"{text} Cena tohoto balíku je {self.value} Kč."
    
    def delivery_price(self):
        price = super().delivery_price() * 1.05
        return f"Cena balíku s pojištěním je {price} Kč."

balik = Package ("U potoka 134/12", 25.0, "nedorucen")
lepsi_balik = ValuablePackage ("U potoka 134/12", 25.0, "nedorucen", 10)
print(lepsi_balik.delivery_price())
