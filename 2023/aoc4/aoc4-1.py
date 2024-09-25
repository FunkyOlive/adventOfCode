with open('input.txt') as f:
    content = f.readlines()

totalScore = 0
for line in content:
    cardNr = line[5:8]
    winningNrs = line[9:39].split()
    hadNrs = line[42:118].split()
    matches = list(set(winningNrs) & set(hadNrs))
    score = int(pow(2, len(matches) - 1))
    #print('card:', cardNr, 'matches:', len(matches), 'score:', score)
    totalScore += score

print(totalScore)