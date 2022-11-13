#encoding: utf-8

class RecursComp
  def compile(str)
    @str,@index = str,0
    compileF
  end

  private

  def compileF
    compileC
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
  def compileT
    compileC
    compileM
    return if @index >= @str.length
    cur = @str[@index].chr
    if cur == '*' or cur == '/' or cur =='%'
        @index += 1
        compileT
        print "#{cur} "
    end
  end
  def compileM
    compileC
    if @str[@index].chr == '(' or @str[@index].chr == '{' or @str[@index].chr == '['
      @index += 1
      compileF
      @index += 1
    else
      compileV
    end
  end

  def compileV
    print "#{@str[@index].chr} "
    @index += 1
    compileC
  end
end

def compileS
  if @str[@index] == ' '
    @index += 1
  end
end

def compileC
  compileS
  return if @index >= @str.length

  if @str[@index].chr == '/' && @str[@index+1].chr == '*'
    @index += 2
    while not(@str[@index-1].chr == '*' && @str[@index].chr == '/')
      @index += 1
    end
    @index += 1
  elsif @str[@index].chr == '/' && @str[@index + 1].chr == '/'
    while str[index] != nil
      @index += 1
    end
    compileS
  end

end

c = RecursComp.new
# while true
  print "Введите формулу: "
  str = readline.chomp.delete(' ')
  c.compile(str)
  print "\n"
# end
