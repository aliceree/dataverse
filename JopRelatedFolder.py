class Book:
    def __init__(self, title, pages, price, sold, costs):
        self.title = title
        self.pages = pages
        self.price = price
        self.sold = sold
        self.costs = costs
    
    def get_info(self):
        return f"Kniha {self.title} má {self.pages} stran a lze ji zakoupit za {self.price} Kč."
    
    def profit(self):
        book_profit = self.sold * (self.price - self.costs)
        return f"Zisk z knihy {self.title} je {book_profit} Kč."
    
    def rating(self):
        sales = int(input("Kolik výtisků se prodalo? "))
        if sales < 50000:
            return "Tak to je propadák."
        elif sales < 500000:
            return "Tak to je průměr."
        else:
            return "Tak to je bestseller!"

        
kniha = Book("Nesnesitelná lehkost bytí", 342, 343, 53000, 132)
print(kniha.profit())
print(kniha.rating())