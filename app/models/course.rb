class Course < ActiveRecord::Base
  def self.all_metadata
    all.map do |course|
      {
        name: course.name,
        description: course.description,
        price: course.price,
        duration: course.duration,
        location: course.location
      }
    end
  end
end