def main():

   numPrices = 0     #counter
   totalPrice = 0.0  #accumulator
	
   #get the first price
   price = float(input('Enter the first price: '))

   while price >= 0.0:
      #update the counter and accumulator
      numPrices = numPrices + 1     
      totalPrice = totalPrice + price 

      price = float(input('Enter the next price or a negative to end: '))     
   # end of while

   #verify that a price was entered
   if numPrices > 0: 
      avgPrice = totalPrice / numPrices     
   else:
      avgPrice = 0.0 
   # end of if

   print('\n', numPrices, 'Prices entered.  The average is: ', format(avgPrice, '.2f'))

main()
