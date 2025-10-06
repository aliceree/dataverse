# fuknce month_of_birth s parametrem birth_number
# cílem je vrátit měsíc narození
# birth_number = 9207054439

def month_of_birth(birth_number):
    month = int(str(birth_number)[2:4])
    if month > 50:
        month - 50
    return month

print(month_of_birth(9207054439))