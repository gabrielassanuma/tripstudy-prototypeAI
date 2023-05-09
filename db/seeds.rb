require 'faker'

AU_STATES = [
  'New South Wales', 'Queensland', 'South Australia',
  'Tasmania', 'Victoria', 'Western Australia', 'Australian Capital Territory', 'Northern Territory'
]

# Helper method to generate a random duration between 2 and 5 years
def generate_duration
  "#{rand(2..5)} years"
end

# Helper method to generate a random price between $10,000 and $32,000 AUD
def generate_price
  rand(10000..32000)
end

# Create 10 sample courses with random data
30.times do
  Course.create!(
    name: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    price: generate_price,
    duration: generate_duration,
    location: AU_STATES.sample
  )
end