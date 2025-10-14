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

balik = Package ("V jircharich 13", 25.0, "nedorucen")
print(balik)
print(balik.deliver())
print(balik)
print(balik.deliver())
print(balik)