filteredpairs = []
with open("defi_sentences.tsv", "r") as file:
    for line in file:
            ref, joint, disjoint, score1, score2 = line.strip().split("\t")

            difference = float(score1) - float(score2)

            if difference > 40:
                filteredpairs.append((ref, joint, score1, disjoint, score2))

with open("defi_sentences_filtered.txt", "w") as ofile:
    for ref, joint, s1, disjoint, s2 in filteredpairs:
        ofile.write(ref + "\n")
        ofile.write(joint + "\n")
        ofile.write(s1 + "\n")
        ofile.write(disjoint + "\n")
        ofile.write(s2 + "\n")
