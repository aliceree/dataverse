def month_of_birth(birth_number):
    month = int(str(birth_number)[2:4])
    if month > 50:
        month - 50
    return f'Month of birth is {month}.'

print(month_of_birth(9207054439))