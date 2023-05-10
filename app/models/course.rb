class Course < ActiveRecord::Base

  def self.all_metadata
    all.map do |course|
      {
        role: "user",
        content: "We offer the #{course.name} it is located in #{course.location} the duration of this course is #{course.duration} the description of this course is #{course.description} and the price is #{course.price}"
      }
    end
  end
end