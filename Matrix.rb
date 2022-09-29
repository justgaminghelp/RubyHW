class Matrix_
  def row=(row)
    @row = row.to_i
  end

  def str=(str)
    @str = str.to_i
  end
  attr_reader :row, :str

  def matrix_init
    @arg = Array.new(row) { Array.new(str) }
    puts 'Введите на разных строках элементы матрицы по столбцам через пробел:'
    @arg.size.times do |i|
      @arg[i] = readline.split.map(&:to_i)
    end
  end
  attr_reader :arg
end

matrix1 = Matrix_.new
matrix2 = Matrix_.new

puts 'Введите количество столбцов в первой матрице и количество строк в ней на одной строке через пробел:'
matrix1.row, matrix1.str = readline.split
puts 'Теперь для второй:'
matrix2.row, matrix2.str = readline.split
matrix1.matrix_init
matrix2.matrix_init

def matrix_composition(m1, m2)

  raise 'Данные матрицы нельзя перемножить' if m1[0].size != m2.size
  Array.new(m1.size) do |i|
    Array.new(m2[0].size) do |j|
      m2.size.times.inject(0) { |acc, k| acc + m1[i][k] * m2[k][j] }
    end
  end
end
print matrix_composition(matrix1.arg, matrix2.arg)
