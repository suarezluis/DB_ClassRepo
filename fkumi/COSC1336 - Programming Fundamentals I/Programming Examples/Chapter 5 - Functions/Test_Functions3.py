RETAIL = 99.00      # Normal retail price per unit before discount

def main():
    units = float(input('How many units are being purchased? '))

    discount, a, b = findDiscount(units)
    
    print('Number of units purchased is     %.2f ' % units)
    print('Discount applied is                ',  format(discount, 'd'), '%', sep='')
    print('Total savings due to discount     $%.2f' % b)
    print('The total cost of the purchase is $%.2f' % a)

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
       
    # Calculate total cost and savings
    totalCost = unitsPurchased * RETAIL * (1 - discount/100)
    totalSavings = (unitsPurchased * RETAIL) - totalCost       

    return discount, totalCost, totalSavings

main()
