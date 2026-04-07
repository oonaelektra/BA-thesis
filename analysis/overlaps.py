de = []
sv = []
fi = []

path_to_de = "./data/traindata/de.yml"
path_to_sv = "./data/traindata/sv.yml"
path_to_fi = "./data/traindata/fi.yml"

with open(path_to_de, "r", encoding="utf-8") as yml:
    for line in yml:
        line = line.strip()
        token = line.split(":",1)[0]
        de.append(token)

    
with open(path_to_sv, "r", encoding="utf-8") as yml:
    for line in yml:
        line = line.strip()
        token = line.split(":",1)[0]
        sv.append(token) 

with open(path_to_fi, "r", encoding="utf-8") as yml:
    for line in yml:
        line = line.strip()
        token = line.split(":",1)[0]
        fi.append(token)


de_set = set(de)
sv_set = set(sv)
fi_set = set(fi)

desv = de_set.intersection(sv_set)

defi = de_set.intersection(fi_set)

desv_defi = desv.intersection(defi)

with open("desv_defi_tokens.txt", "w", encoding="utf-8") as file:
   for token in desv_defi:
       file.write(token + "\n")

desv_not_in_defi = []
for token in desv:
    if token not in defi:
        desv_not_in_defi.append(token)

defi_not_in_desv = []
for token in defi:
    if token not in desv:
        defi_not_in_desv.append(token)

with open("desv_notindefi_tokens.txt", "w", encoding="utf-8") as file:
    for token in desv_not_in_defi:
        file.write(token + "\n")

with open("defi_notindesv_tokens.txt", "w", encoding="utf-8") as file:
    for token in defi_not_in_desv:
        file.write(token + "\n")
