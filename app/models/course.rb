class Course < ActiveRecord::Base

  def self.all_metadata
    all.map do |course|
      {
        role: "assistant",
        content: "#{course.name} - localizado em #{course.location}/ a duração do curso é de  #{course.duration}/ a descrição do curso: #{course.description}/ preço é de: #{course.price}"
      }
    end
  end
end