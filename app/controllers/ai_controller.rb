require_relative "../models/user"
require_relative "../models/question"
require "openai"
require 'dotenv'
Dotenv.load

class AiController

  def chat(user_id)
    user = User.find_by(id: user_id)
    if user.nil?
      user = User.create(id: user_id)
    end
    puts "What's your question?"
    question_content = gets.chomp
    question = Question.create(user: user, content: question_content)
    answer = fetch_ai(question_content, user)
    question.update(answer: answer)
    p user
  end

  private

  def fetch_ai(question_content, user)
    openAI_key = ENV['OPENAI_KEY']
    client = OpenAI::Client.new(access_token: openAI_key)
    if user.questions.nil?
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", 
          messages: [{ role: "user", content: question_content}],
          temperature: 1.5,
          max_tokens: 500
      })
    response.dig("choices", 0, "message", "content")
    else
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", 
            messages: [{ role: "user", content: question_content}],
            temperature: 0.2,
            max_tokens: 100
        })
      response.dig("choices", 0, "message", "content")
    end
  end
end