#!/bin/bash
file1="translations/desv.joint.decoded.en" 
file2="translations/desv.disjoint.decoded.en"
fileref="data/testdata/de-en.en"
paste "$file1" "$file2" "$fileref" | \
while IFS=$'\t' read -r sent1 sent2 sentref; do
        score1=$(echo "$sent1" | sacrebleu <(echo "$sentref") -m chrf --score-only)
        score2=$(echo "$sent2" | sacrebleu <(echo "$sentref") -m chrf --score-only)
        if [ "$score1" != "$score2" ]; then
                echo -e "$sentref\t$sent1\t$sent2\t$score1\t$score2"
        fi
done >> desv_sentences.tsv