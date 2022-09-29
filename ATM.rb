class ATM
  # Определяем  переменыне баланса и массив с количеством купюр разного номинала

  attr_accessor :balance, :cash

  def vichet(parity, amount_to_issue, cash_amount)
    return min(cash_amount, (amount_to_issue.div parity)) * parity
  end
end

class Cash
  attr_accessor :amount, :parity
end

five = Cash.new
five.parity = 5

ten = Cash.new
ten.parity = 100

fifty = Cash.new
fifty.parity = 50

hundread = Cash.new
hundread.parity = 100

atm = ATM.new

puts 'Введите баланс счёта:'
atm.balance = gets.to_i
if atm.balance.is_a?(String) || atm.balance.negative?
  raise 'Ошибка. На вход поступили некорректные данные. Попробуйте снова'
end

puts 'Введите последовательно количество купюр через пробел номиналом 5, 10, 50 и 100 у.е. в терминале:'
kup = gets.list.map(&:to_i)
five.amount = kup[0]
ten.amount = kup[1]
fifty.amount = kup[2]
hundread.amount = kup[3]

money = [[five.parity, five.amount], [ten.parity, ten.amount], [fifty.parity, fifty.amount], [hundread.parity, hundread.amount]]

while true
  puts "Выберите тип операции:\n1 - узнать баланс\n2 - внести наличные\n3 - снять наличные\n0 - завершить операцию"
  current_operation = gets.to_i
  case current_operation
  when 0 # Выход, на случай, если резко передумал
    puts 'Спасибо, что воспользовались нашими услугами!'
    break
  when 1 # Показ баланса
    puts atm.balance.to_s
    next
  when 2 # Внесение наличных
    loop do
      puts 'Внесите купюру в 5, 10, 50 или 100 у.е.:'
      nal = gets.to_i
      if [5, 10, 50, 100].include? nal
        case nal
        when 5
          five.amount += 1
        when 10
          ten.amount += 1
        when 50
          fifty.amount += 1
        when 100
          hundread.amount += 1
        end
        atm.balance += nal
      else
        puts 'Oops, купюра не того номинала, попробуйте снова..'
        next
      end
      puts 'Деньги внесены. Если хотите внести ещё нажмите 1, если хотите вернуться в главное меню нажмите 2'
      out = gets.to_i
      break if out == 2
    end
  when 3
    # Ввод самой суммы
    puts 'Введите сумму которую хотите снять (кратную 5):'
    amount_to_issue = gets.to_i
    if amount_to_issue.negative? || amount_to_issue.zero?
      raise 'Ошибка на вход переданы неверные данные'
    end

    # Ошибки при вводе суммы на выдачу
    if amount_to_issue % 5 != 0
      puts 'Неверно указанна сумма на выдачу, она должна быть кратна 5.'
    elsif amount_to_issue > atm.balance
      puts 'Запрошенная сумма больше суммы на счёте.'
    end

    # Процесс расчёта купюр
    i = 0
    while amount_to_issue.positive?
      amount_to_issue -= vichet(money[i][0], amount_to_issue, money[i][1])
      i += 1
    end

  end
end