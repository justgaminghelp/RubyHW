class Animal
  attr_reader :name, :age

  def to_s
    "#{@name} the dog, age #{@age}"
  end

  def name=(name)
    name != '' ? @name = name : (raise 'Oops, name is wrong!')
  end

  def age=(age)
    age.positive? ? @age = age : (raise 'Oops, name is wrong!')
  end

  def talk
    puts "#{@name} says Bark!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end

  def report_age
    puts "#{@name} is #{@age} years old."
  end
end

class Dog < Animal
end

class Bird < Animal
  def talk
    puts "#{@name} says Chirp! Chirp!"
  end
end

class Cat < Animal
  def talk
    puts "#{@name} says Meow!"
  end
end

class Armadillo < Animal
  def move(destination)
    puts "#{@name} unrolls!"
    super
  end
end

dog = Dog.new
puts dog.move('bed')
