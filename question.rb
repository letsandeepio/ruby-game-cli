# frozen_string_literal: true

# question class
class Question
  attr_reader :ask
  def initialize
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    @answer = @num1 + @num2
    @ask = "What does #{@num1} plus #{@num2} equals?"
  end

  def check_answer?(input)
    @answer == input.to_i
  end
end
