class Book:
    def __init__(self, title, pages, price):
        self.title = title
        self.pages = pages
        self.price = price
    
    def get_info(self):
        return f"Kniha {self.title} má {self.pages} stran a lze ji zakoupit za {self.price} Kč."
    
    def get_time_to_read(self, minutes_per_page=4):
        time_hours = self.pages * minutes_per_page / 60
        return f"Čtením této knihy strávíte {time_hours} hodin."
    
kniha = Book("Nesnesitelná lehkost bytí", 342, 343)
print(kniha.get_info())
print(kniha.get_time_to_read())
print(f"Při pomalejším čtení za {kniha.get_time_to_read(5)} hodin.")