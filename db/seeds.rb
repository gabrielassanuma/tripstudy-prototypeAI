require 'faker'

AU_STATES = [
  'New South Wales', 'Queensland', 'South Australia',
  'Tasmania', 'Victoria', 'Western Australia', 'Australian Capital Territory', 'Northern Territory'
]

PRICES = (10000..60000).step(10000).to_a

# Helper method to generate a random duration between 2 and 5 years
def generate_duration
  "#{rand(2..5)} years"
end

# Create 10 sample courses with random data
30.times do
  Course.create!(
    name: Faker::Educator.course_name,
    description: "Course description",
    price: PRICES.sample,
    duration: generate_duration,
    location: AU_STATES.sample
  )
end