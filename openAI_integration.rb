require "openai"
require 'dotenv'
Dotenv.load

openAI_key = ENV['OPENAI_KEY']
client = OpenAI::Client.new(access_token: openAI_key)

response = client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: "Describe how is the weather in Portugal"}]
    })
puts response.dig("choices", 0, "message", "content")
