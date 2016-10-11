def beat_the_box(box, deck)
  ended = false
  until ended
    guess = evaluate_statistics(box, deck)
    unless test_guess(box, deck, guess)
      box[guess.first] = "X"
    end
    if box.select{ |card| card == "X" }.length == 9 || deck.length == 0
      ended = true
    end
  end
  deck.count == 0 ? true : false
end

def evaluate_statistics(box, deck)
  statistics = {}
  num_remaining = deck.length.to_f
  box.each_with_index do |card, index|
    unless card == "X" 
      probabilities = {}
      probabilities["lower"] = deck.select{ |remaining_card| remaining_card < card }.length/num_remaining
      probabilities["same"] = deck.select{ |remaining_card| remaining_card == card }.length/num_remaining
      probabilities["higher"] = deck.select{ |remaining_card| remaining_card > card }.length/num_remaining
      statistics[index] = probabilities.sort_by { |key, value| value }.last
    end
  end
  choice = statistics.sort_by { |key, value| value[1] }.last
  card_index = choice.first
  guess_direction = choice.last.first
  return [card_index, guess_direction]
end

def test_guess(box, deck, guess)
  guess_number = box[guess.first]
  box[guess.first] = deck.pop
  if guess.last == "lower"
    return true if box[guess.first] < guess_number
  elsif guess.last == "same"
    return true if box[guess.first] == guess_number
  else
    return true if box[guess.first] > guess_number
  end
  false
end

wins = 0
losses = 0

10000.times do
  deck = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 13, 13, 13, 13, 14, 14, 14, 14].shuffle
  box = []
  9.times do
    box << deck.pop
  end
  beat_the_box(box, deck) ? wins += 1 : losses += 1
end

puts "Percent won: #{wins.to_f/10000 * 100}%"
puts "Percent lost: #{losses.to_f/10000 * 100}%"