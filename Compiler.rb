#encoding: utf-8

class RecursComp
  def compile(str)
    @str,@index = str,0
    compileF
  end

  private

  def compileF # Обработка вторичных операций
    compileC # Комментарии
    compileT
    return if @index >= @str.length
    cur = @str[@index].chr
    if cur == '+' or cur == '-'
      @index += 1
      compileF
      print "#{cur} "
    end
    compileC
  end
  def compileT #Обработка первичных операций
    compileC #Комментарии
    compileM
    return if @index >= @str.length
    cur = @str[@index].chr
    if cur == '*' or cur == '/' or cur =='%'
        @index += 1
        compileT
        print "#{cur} "
    end
  end
  def compileM #Обработка скобок
    compileC #Комментарии
    if @str[@index].chr == '(' or @str[@index].chr == '{' or @str[@index].chr == '['
      @index += 1 #Перескакиваем на следующий от скобок символ
      compileF #Обработка содержимого скобок
      @index += 1 #Перескок через закрывающую скобку
    else
      compileV
    end
  end

  def compileV #Конечная обработка числа или переменной и возврат по древу операций назад
    print "#{@str[@index].chr} "
    @index += 1
    compileC
  end
end

def compileS #Обработка пробела и перевод на символ вперед
  if @str[@index] == ' '
    @index += 1
  end
end

def compileC #Обработка комментариев и граничащих пробелов
  compileS #Пробел
  return if @index >= @str.length

  if @str[@index].chr == '/' && @str[@index+1].chr == '*' #Прверка на наличие комментария
    @index += 2
    while not(@str[@index-1].chr == '*' && @str[@index].chr == '/')
      @index += 1
    end
    @index += 1
  elsif @str[@index].chr == '/' && @str[@index + 1].chr == '/'
    while str[index] != nil
      @index += 1
    end
    compileS #Пробел
  end

end

c = RecursComp.new
# while true
  print "Введите формулу: "
  str = readline.chomp.delete(' ')
  c.compile(str)
  print "\n"
# end
