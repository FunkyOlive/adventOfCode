with open('input.txt') as f:
    lines = f.readlines()

highestCard = len(lines)
cardCopyCounts = [1 for i in range(highestCard + 1)]
cardCopyCounts[0] = 0

for line in lines:
    cardNr = int(line[5:8])
    winningNrs = line[9:39].split()
    hadNrs = line[42:118].split()
    matches = list(set(winningNrs) & set(hadNrs))
    for i in range(len(matches)):
        cardNrToCopy = cardNr+i+1
        if cardNrToCopy <= highestCard:
            cardCopyCounts[cardNrToCopy] += cardCopyCounts[cardNr]

    print('card:', cardNr,'copies:', cardCopyCounts[cardNr],'matches:', len(matches))
    

print('sum of all card copies:',sum(cardCopyCounts))