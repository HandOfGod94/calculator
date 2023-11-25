module Calculator
  class App
    def self.run(operand1 : Int32, operand2 : Int32, operator : String)
      case operator
      when "+"
        new(operand1, operand2).add
      when "-"
        new(operand1, operand2).subtract
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
  end
end
