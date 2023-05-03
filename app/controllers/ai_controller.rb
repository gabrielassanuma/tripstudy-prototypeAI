require_relative "../models/user"
require_relative "../models/question"
require "openai"
require 'dotenv'
Dotenv.load

class AiController

  def chat(user)
    puts "What's your question?"
    question = Question.create(user: user, content: gets.chomp)
    fetch_ai(question)
    p question
    
  end

  private

  def fetch_ai(question)
    openAI_key = ENV['OPENAI_KEY']
    client = OpenAI::Client.new(access_token: openAI_key)
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", 
          messages: [{ role: "user", content: question}],
          temperature: 0.2,
          max_tokens: 350
      })
    sleep(10)
    p response.dig("choices", 0, "message", "content")
    Question.update(answer: response.dig("choices", 0, "message", "content"))
  end
end