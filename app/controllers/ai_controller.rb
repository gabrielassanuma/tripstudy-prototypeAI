require_relative "../models/user"
require_relative "../models/question"
require "openai"
require 'dotenv'
Dotenv.load

class AiController

  def chat(user)
    puts "What's your question?"
    question_content = gets.chomp
    question = Question.create(user: user, content: question_content)
    answer = fetch_ai(question_content, user)
    question.update(answer: answer)
  end

  private

  def fetch_ai(question_content, user)
    openAI_key = ENV['OPENAI_KEY']
    client = OpenAI::Client.new(access_token: openAI_key)

    messages = [{ role: "user", content: question_content }]
    previous_questions = Question.where(user: user).where.not(answer: nil)
    previous_questions.each do |question|
      messages << { role: "user", content: question.content }
      messages << { role: "ai", content: question.answer }
    end

    if user.questions.nil?
      temperature = 1.5
      max_tokens = 700
    elsif user.questions.size <= 2
      temperature = 1.0
      max_tokens = 400
    elsif user.questions.size <= 4
      temperature = 0.8
      max_tokens = 300
    elsif user.questions.size <= 16
      temperature = 0.6
      max_tokens = 200
    else
      temperature = 0.4
      max_tokens = 100
    end

    p messages
    p temperature
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", 
        messages: [{ role: "user", content: question_content }],
        temperature: temperature,
        max_tokens: max_tokens
      })

    response.dig("choices", 0, "message", "content")
  end
end