# This program imports the simulation module and
# creates three instances of the Coin class.

import coin

def main():
    # Create three objects from the Coin class.
    coin1 = coin.Coin()
    coin2 = coin.Coin()
    coin3 = coin.Coin()

    # Display the side of each coin that is facing up.
    print('I have three coins with these sides up:')
    print(coin1.get_sideup())
    print(coin2.get_sideup())
    print(coin3.get_sideup())

    print("testVar - coin1 = ", coin1.testVar)
    print("testVar - coin2 = ", coin2.testVar)
    print("testVar - coin3 = ", coin3.testVar)

    coin.Coin.testVar += 1
    
    print("testVar - coin1 = ", coin1.testVar)
    print("testVar - coin2 = ", coin2.testVar)
    print("testVar - coin3 = ", coin3.testVar)
    
    # Toss the coin.
    print('I am tossing all three coins...')
    print()
    coin1.toss()
    coin2.toss()
    coin3.toss()

    # Display the side of each coin that is facing up.
    print('Now here are the sides that are up:')
    print(coin1.get_sideup())
    print(coin2.get_sideup())
    print(coin3.get_sideup())

# Call the main function.
main()
