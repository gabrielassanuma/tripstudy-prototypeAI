require "openai"
require 'dotenv'
Dotenv.load

openAI_key = ENV['OPENAI_KEY']
puts openAI_key
client = OpenAI::Client.new(access_token: openAI_key)

response = client.chat(
    parameters: {
        model: "text-ada-001", # Required.
        messages: [{ role: "user", content: "Describe how is the weather in Portugal"}]
    })
puts response
