module Calculator
  class App
    def initialize(arg1 : Int64, arg2 : Int64)
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
