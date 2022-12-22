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
kup = gets.split.map(&:to_i)
five.amount = kup[0]
ten.amount = kup[1]
fifty.amount = kup[2]
hundread.amount = kup[3]

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
      continue
    elsif amount_to_issue > atm.balance
      puts 'Запрошенная сумма больше суммы на счёте.'
      continue
    end

    # Процесс расчёта купюр
    while amount_to_issue.positive?
      if amount_to_issue % 5 == 0 && atm.balance >= amount_to_issue
        while amount_to_issue >= 100 && handread.amount > 0
          d = amount_to_issue / 100
          while handread.amount - d < 0
              d -= 1
          end
          if handread.amount - d >= 0
              handread.amount -= d
              atm.balance -= d * 100
              amount_to_issue -= d * 100
          end
        end
        while amount_to_issue >= 50 && fifty.amount > 0
          fx = amount_to_issue / 50
          while fifty.amount - fx < 0
              fx -= 1
          end
          if fifty.amount - fx >= 0
              fifty.amount -= fx
              atm.balance -= fx * 50
              amount_to_issue -= fx * 50
          end
        end
        while amount_to_issue >= 10 && ten.amount > 0
          t = amount_to_issue / 10
          while ten.amount - t < 0
            t -=1
          end
          if ten.amount - t >= 0
            ten.amount -= t
            atm.balance -= t * 10
            amount_to_issue -= t * 10
          end
        end
        while amount_to_issue >= 5 && five.amount > 0
          f = amount_to_issue / 5
          while five.amount - f < 0
            f -= 1
          end
          if five.amount - f >= 0
            five.amount -= f
            atm.balance -= f * 5
            amount_to_issue -= f * 5
          end
        end
        if amount_to_issue > 0
          atm.balance += f * 5
          atm.balance += t * 10
          atm.balance += fx * 50
          atm.balance += d * 100
          five.amount += f
          ten.amount += t
          fifty.amount += fx
          handread.amount += d
          puts "В банкомате недостаточно купюр."
        end
        puts "Ваш баланс #{atm.balance}."
      elsif amount_to_issue % 5 == 0 && atm.balance < amount_to_issue
        puts "На балансе недостаточно средств."
      end
    end
  end
end
