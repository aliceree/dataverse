a = int(input("Největší hodnota je: "))
b = int(input("Nejmenší hodnota je: "))
result = a - b

if result < 0:
    print("Chyba: Největší hodnota musí být větší než nejmenší hodnota.")
else:
    print("Rozpětí je: ", result)