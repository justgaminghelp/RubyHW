# Get My Number Game
# Written by me!

puts "Welcome to 'Get My Number!'"
print "What's your name ? "
input = gets
player_name = input.chomp
puts "Welcome, #{player_name}!"

# Сохранение случайного числа
puts "I've got a random number between 1 and 100."
puts "Can you guess it?"
target = rand(100) + 1

# Признак продолжения игры.
guessed_it = false

# Подсчет попыток
num_guesses = 0

until num_guesses == 10 || guessed_it

  puts "You've got #{10 - num_guesses} guesses left."

  #Угадаешь число?
  puts "Make a guess?"
  guess = gets.to_i
  num_guesses += 1

  # Сравнение числа
  if guess < target
    puts "Oops. Your number was LOW."
  elsif guess > target
    puts "Oops. Your number was HIGH."
  elsif guess == target
    puts "Good job, #{player_name}"
    puts "You guessed my number in #{num_guesses} guesses!"
    guessed_it = true
  end
end
# Если попытки кончились
unless guessed_it
  puts "Sorry. You didn't get my number. (It was #{target}.)"
end
