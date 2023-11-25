require "./calculator/app.cr"
require "./calculator/version.cr"
require "option_parser"

operand1 : Int32 = 0
operand2 : Int32 = 0
operator : String = "-"

version = false
run = false

parser = OptionParser.parse do |parser|
  parser.banner = "Usage: calculator [subcommands] [args]"
  parser.on("version", "Current version of CLI") do
    version = true
  end
  parser.on("run", "run the app") do
    run = true
    parser.on("-a OPERAND1", "--operand1=OPERAND1", "first operator") { |val| operand1 = val.to_i }
    parser.on("-b OPERAND2", "--operand2=OPERAND2", "second operator") { |val| operand2 = val.to_i }
    parser.on("-c OPERAND", "--operator2=OPERAND", "second operator") { |val| operand = val }
  end
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

if version
  result = Calculator::VERSION
elsif run
  result = Calculator::App.run(operand1, operand2, operator)
else
  result = parser
end

puts result
