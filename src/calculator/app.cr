module Calculator
  class InvalidOperatorException < Exception; end

  class App
    def self.run(operand1 : Int32, operand2 : Int32, operator : String)
      case operator
      when "+"
        new(operand1, operand2).add
      when "-"
        new(operand1, operand2).subtract
      when "*"
        new(operand1, operand2).multiply
      when "/"
        new(operand1, operand2).divide
      else
        raise InvalidOperatorException.new("Invalid operator: #{operator}")
      end
    end

    def initialize(arg1 : Int32, arg2 : Int32)
      @arg1 = arg1
      @arg2 = arg2
    end

    def add
      @arg1 + @arg2
    end

    def subtract
      @arg1 - @arg2
    end

    def multiply
      @arg1 * @arg2
    end

    def divide
      @arg1 / @arg2
    end
  end
end
