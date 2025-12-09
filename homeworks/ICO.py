import requests

ico = input("Zadej IČO subjektu: ")

url = f"https://ares.gov.cz/ekonomicke-subjekty-v-be/rest/ekonomicke-subjekty/{ico}"

response = requests.get(url)

data = response.json()

obchodni_jmeno = data["obchodniJmeno"]
adresa_sidla = data["sidlo"]["textovaAdresa"]

print(obchodni_jmeno)
print(adresa_sidla)

nazev = input("Zadej název subjektu: ")

headers = {
    "accept": "application/json",
    "Content-Type": "application/json",
}

data = f'{{"obchodniJmeno": "{nazev}"}}'

res = requests.post(
    "https://ares.gov.cz/ekonomicke-subjekty-v-be/rest/ekonomicke-subjekty/vyhledat",
    headers=headers,
    data=data,
)

data = res.json()

print("Nalezeno subjektů:", data["pocetCelkem"])

for subjekt in data["ekonomickeSubjekty"]:
    print(subjekt["obchodniJmeno"] + ", " + subjekt["ico"])