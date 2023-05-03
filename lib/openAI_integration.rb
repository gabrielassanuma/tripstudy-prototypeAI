require "openai"
require 'dotenv'
require_relative "student_questions"
Dotenv.load


answer = []
openAI_key = ENV['OPENAI_KEY']
client = OpenAI::Client.new(access_token: openAI_key)
STUDENT_QUESTIONS.each do |question|
  response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", 
          messages: [{ role: "user", content: question}],
          temperature: 0.2,
          max_tokens: 350
      })
  if response.dig("choices", 0, "message", "content") == nil
    answer << "Not processed by AI"
  else
    answer << response.dig("choices", 0, "message", "content")
  end
  sleep(20)
end


STUDENT_QUESTIONS.each_with_index do |question, index|
  puts "Question #{index + 1}: #{question.strip}"
  p "      Answer: #{answer[index]}"
  puts ""
end

puts "==" * 30
puts "Sent #{STUDENT_QUESTIONS.length} questions"
puts "Receivied #{answer.count("Not processed by AI")} fails"

