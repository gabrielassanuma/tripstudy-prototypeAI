require_relative "../models/user"
require_relative "../models/question"

class AiController

  def chat(user)
    puts "What's your question?"
    Question.create(user: user, content: gets.chomp)

    
  end
end