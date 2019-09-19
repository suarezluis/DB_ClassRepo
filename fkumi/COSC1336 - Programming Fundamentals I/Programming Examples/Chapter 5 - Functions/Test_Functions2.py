import Test_Functions1

RETAIL = 99.00      # Normal retail price per unit before discount

def main():
    units = float(input('How many units are being purchased? '))

    discount = Test_Functions1.findDiscount(units)
    
    # Calculate total cost and savings
    totalCost = units * RETAIL * (1 - discount/100)
    totalSavings = (units * RETAIL) - totalCost       

    print('Number of units purchased is     %.2f ' % units)
    print('Discount applied is                ',  format(discount, 'd'), '%', sep='')
    print('Total savings due to discount     $%.2f' % totalSavings)
    print('The total cost of the purchase is $%.2f' % totalCost)

    #End of Main
    
main()
