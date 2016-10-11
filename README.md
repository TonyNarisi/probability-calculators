- at_least_x_in_n.rb
  
  This is a probability calculator used to determine the chances of one outcome or a set of outcomes 
  occurring a certain minimum number of times in a certain number of trials. It uses the following equation:
  
  P(X = i) = (<sup>n!</sup>/<sub>i!(n - i)!</sub>)p<sup>i</sup>(1 - p)<sup>n - i</sup>
  
  where i is the number of successful outcomes, n is the number of trials, and p is the probability of a
  successful outcome occurring in a single trial. To determine the probability of a minimum number of successes,
  this equation takes a 100% probability, and subtracts the probability of all cases below that minimum
  threshold. So, to determine the probability of a single face of a six-sided die (1/6 or 16.67% chance) coming
  up at least three times in five trials, the program would run the equation:
  
  1 - P(X = 0) - P(X = 1) - P(X = 2)
  
  with n being equal to five, and p being equal to 0.1667.

- beat-the-box.rb

  This is a game in which there is a three by three grid of playing cards, and each turn, the player or player
  needs to point to a card in the grid, and say higher, lower, or same. If the next card on the deck matches
  what the player guessed, they continue. If not, they flip that pile over and it is out of the game. The player
  wins if they get through the entire deck, and they lose if all nine piles get flipped over.
  
  This program plays the game based purely on whatever the best chance of guessing correctly on the board is. It
  plays the game 10,000 times, and prints out the percentage of games that it won and the percentage of games that
  it lost.
