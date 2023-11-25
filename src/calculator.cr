require "./calculator/app.cr"
require "./calculator/version.cr"
require "option_parser"

operand1 : Int32 = 0
operand2 : Int32 = 0
operator : String = "-"

parser = OptionParser.parse do |parser|
  parser.banner = "Usage: calculator [args]"
  parser.on("-o1 OPERAND1", "--operand1=OPERAND1", "first operator") { |val| operand1 = val.to_i }
  parser.on("-o2 OPERAND2", "--operand2=OPERAND2", "second operator") { |val| operand2 = val.to_i }
  parser.on("-op OPERAND", "--operator2=OPERAND", "second operator") { |val| operand = val }
  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit
  end

  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

parser.parse

puts Calculator::App.run(operand1: operand1, operand2: operand2, operator: operator)
