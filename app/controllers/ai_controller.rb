require_relative "../models/user"
require_relative "../models/question"
require "openai"
require 'dotenv'
Dotenv.load

class AiController

  def chat(user)
    if !user.questions? 
      puts "What's your question?"
      question_content = gets.chomp
      question = Question.create(user: user, content: question_content)
      answer = fetch_ai(question_content)
      question.update(answer: answer)
      puts question.answer
    else
      puts "More questions?"
      question_content = gets.chomp
    end
    
  end

  private

  def fetch_ai(question_content)
    openAI_key = ENV['OPENAI_KEY']
    client = OpenAI::Client.new(access_token: openAI_key)
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", 
          messages: [{ role: "user", content: question_content}],
          temperature: 0.2,
          max_tokens: 350
      })
    response.dig("choices", 0, "message", "content")
  end
end