#Собачка
class Dog
  attr_reader :name , :age
  def name=(name)
    if name != ''
      @name = name
    else
      raise 'Oops, name is wrong'
    end
  end

  def age=(age)
    if age > 0
      @age = age
    else
      raise 'Oops, age is wrong'
    end
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

dog = Dog.new
dog_Elizaveta = Dog.new
dog_Otec = Dog.new

dog.name = 'Mike'
dog_Elizaveta.name = 'Elizaveta'
dog_Otec.name = 'Otec'

dog.age = 2
dog_Elizaveta.age = 97
dog_Otec.age = 34

dog.talk
dog.report_age

dog_Elizaveta.talk
dog_Elizaveta.report_age

dog.move('bed')
dog_Elizaveta.move('Mike')