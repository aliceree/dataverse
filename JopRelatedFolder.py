lines = [
    "2904,4",
    "7390,7",
    "6950,8",
    "3300,4",
    "10570,8",
    "1310,2",
    "9806,8"
]

avg_sales = []
for line in lines:
    line = line.split(",")
    avg = int(line[0]) / int(line[1])
    avg_sales.append(avg)

print(avg_sales)