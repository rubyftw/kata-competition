
module Kata

  class Calc
    NUMBERS = %w{ one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen twenty %}

    OPERATORS = %w{ plus minus times divided_by }

    def initializ()
    end

    def self.setup
      NUMBERS.each do |number|
        self.send(:define_method, number.to_s) { set_number(number) }
      end

      OPERATORS.each do |operator|
        self.send(:define_method, operator.to_s) { set_operator(operator) }
      end

    end

    def set_operator(operator)
      @operator = operator
      return self
    end

    def set_number(number)
      
      if @first_number.nil?
        @first_number = number 
        return self
      end

      if @second_number.nil?
        @second_number = number
        return do_calculation
      end

    end

    def do_calculation
      #puts "#{@first_number} #{@operator} #{@second_number} " 
      
      first = NUMBERS.find_index( @first_number) + 1
      second = NUMBERS.find_index( @second_number) + 1

#      puts first
#      puts second

      return self.send("run_#{@operator}", first, second)
    end




    def run_add(first,second)
      first + second
    end
    def run_subtract(first,second)
      first - second
    end
    def run_times(first,second)
      first * second
    end
    def run_divided_by(first,second)
      first / second
    end

  end

  Kata::Calc.setup
end

#Kata::Calc.new.ten
puts Kata::Calc.new.three.times.five 
