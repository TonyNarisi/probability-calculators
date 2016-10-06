def factorial(num)
  return 1 if num == 1 || num == 0
  num * factorial(num - 1)
end

def singular_probability(prob, trial_count, success_count)
  (factorial(trial_count)/(factorial(success_count)*factorial(trial_count - success_count))) * (prob ** success_count) * ((1 - prob) ** (trial_count - success_count))
end

def at_least_x_in_n(prob, trial_count, min_successes)
  probability = 1.0000
  x = 0
  while x < min_successes
    probability -= singular_probability(prob, trial_count, x)
    x += 1
  end
  probability * 100
end

# Replace this statement with whatever probability that is being calculated, with
# the first argument being the probability of the event happening successfully in
# one trial, the second argument being the number of total trials that will be run,
# and the third argument being the minimum number of successes that is being looked
# for. For example, to calculate the odds of getting at least three heads from a coin
# being tossed ten times, the method would be 'at_least_x_in_n(0.5, 10, 3)'.

print at_least_x_in_n(0.1389, 4, 3)