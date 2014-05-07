module Kata
  module_function

  def snail_sort(array)
    result = []

    max_x = array[0].size
    max_y = array.size

    array.each do |outer|
      [0..max_x].each do |item|
        # NO!!!!!!!!!!!!!!
      end
    end
  end

  def palindrome?(string)
    new_string = string.gsub(/([,!: ])/, '').upcase
    new_string == new_string.reverse
  end

  class Calc
    @@number_names = %w(
      zero
      one
      two
      three
      four
      five
      six
      seven
      eight
      nine
      ten
      eleven
      twelve
      thirteen
      fourteen
      fifteen
      sixteen
      seventeen
      eighteen
      nineteen
      twenty
    )

    def initialize
      @stack = []
    end

    @@number_names.each do |number_name|
      define_method(number_name) do
        number = @@number_names.index(number_name)
        @stack << number
        if @stack.size >= 2
          do_calculation
        else
          self
        end
      end
    end

    def plus
      @stack << '+'
      self
    end

    def minus
      @stack << '-'
      self
    end

    def times
      @stack << '*'
      self
    end

    def divided_by
      @stack << '/'
      self
    end

    def do_calculation
      operand_1, operator, operand_2 = @stack
      operand_1.send(operator, operand_2)
    end
  end

end
