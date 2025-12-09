import json
import requests

response = requests.get("https://api.kodim.cz/python-data/people")
data = response.json()

print(len(data))
print(data[0].keys())

gender_count = {}
for item in data:
    gender_count[item["gender"]] = gender_count.get(item["gender"], 0) + 1
print(gender_count)