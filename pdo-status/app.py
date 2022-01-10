import requests
import json
import csv

__INSERT_SECRET_HERE__

url = "https://api.trello.com/1/lists/"+pdoListId+"/cards?"+authStr
pdoCards = requests.request( "GET", url)
finalPrintArray = []

for card in json.loads(pdoCards.text):
    if card['id'] in pdoDictionary:
        totalFiles = card['badges']['checkItemsChecked'] + card['badges']['checkItems']
        completedFiles = card['badges']['checkItemsChecked']
        remainingFiles = card['badges']['checkItems']
        percentageCompleted = round((completedFiles / totalFiles) * 100, 2)
        nameOfVertical = pdoDictionary[card['id']]
        finalPrintArray.append({'name': nameOfVertical, 'total': totalFiles, 'completed': completedFiles, 'remaining': remainingFiles, 'percentage_completed': percentageCompleted})

with open('report.csv', 'w', newline='') as f:
    fields = ['name', 'total', 'completed', 'remaining', 'percentage_completed']
    writer = csv.DictWriter(f, fields)
    writer.writeheader()

    for row in finalPrintArray:
        writer.writerow(row)

