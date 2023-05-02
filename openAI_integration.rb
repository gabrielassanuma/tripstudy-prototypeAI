require "openai"
require 'dotenv'
require_relative 'students_questions.rb'
Dotenv.load

answer = []
students_questions = [
  "Qual é o visto de estudante necessário para estudar na Austrália?",
  "Qual é o processo de aplicação para um visto de estudante australiano?",
  "Quais são os requisitos para a obtenção de um visto de estudante australiano?",
  "Quais documentos são necessários para solicitar um visto de estudante australiano?",
  "Quanto tempo leva para processar um visto de estudante australiano?",
  "É possível trabalhar enquanto estudo com um visto de estudante australiano?",
  "Quais são as restrições de trabalho com um visto de estudante australiano?",
  "Posso renovar meu visto de estudante australiano?",
  "Quais são as taxas associadas ao visto de estudante australiano?",
  "Posso trazer minha família para a Austrália comigo com um visto de estudante?",
  "Preciso de um seguro de saúde para solicitar um visto de estudante australiano?",
  "Como faço para encontrar acomodação enquanto estudo na Austrália?",
  "É necessário fazer um exame médico para solicitar um visto de estudante australiano?",
  "Quais são as restrições de viagem com um visto de estudante australiano?",
  "Posso viajar para fora da Austrália com um visto de estudante australiano?",
  "Posso mudar de curso ou instituição enquanto estudo com um visto de estudante australiano?",
  "Preciso de um agente de imigração para me ajudar com o meu visto de estudante australiano?",
  "O que acontece se meu visto de estudante australiano for negado?",
  "Como faço para renovar meu visto de estudante australiano?",
]

openAI_key = ENV['OPENAI_KEY']
client = OpenAI::Client.new(access_token: openAI_key)
students_questions.each do |question|
  response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo", 
          messages: [{ role: "user", content: question}],
          temperature: 0.2,
          max_tokens: 200
      })
  answer << response.dig("choices", 0, "message", "content")
  sleep(5)
end

students_questions.each_with_index do |question, index|
  puts "Question #{index + 1}: #{question.strip}"
  p "      Answer: #{answer[index]}"
  puts ""
end