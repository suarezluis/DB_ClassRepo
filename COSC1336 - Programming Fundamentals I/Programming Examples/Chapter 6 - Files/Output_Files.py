RETAIL = 99.00      # Normal retail price per unit before discount

def main():
    
    outFile = open('Test_File.txt', 'a')
    units = float(input('How many units are being purchased? '))

    discount = findDiscount(units)
    
    # Calculate total cost and savings
    totalCost = units * RETAIL * (1 - discount/100)
    totalSavings = (units * RETAIL) - totalCost       

    print('Number of units purchased is     %.2f ' % units)
    print('Discount applied is                ', format(discount, 'd'), '%', sep='')
    print('Total savings of the purchase is ', format(totalSavings, '.2f'))
    
    print('The total cost of the purchase is ', end = '')
    
    outFile.write(str(format(totalCost, '.2f')))
    
# End main()

def findDiscount(unitsPurchased):
    # Determine discount percentage
    if unitsPurchased < 10:
       discount = 0
    elif unitsPurchased <= 19:
       discount = 20
    elif unitsPurchased <= 49:
       discount = 30
    elif unitsPurchased <= 69:
       discount = 35
    elif unitsPurchased <= 99:
       discount = 40
    else:    # unitsPurchased was 100 or more
       discount = 50

    return discount

main()
