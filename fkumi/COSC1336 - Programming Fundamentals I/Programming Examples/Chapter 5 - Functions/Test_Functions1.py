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
    # End of findDiscount function

