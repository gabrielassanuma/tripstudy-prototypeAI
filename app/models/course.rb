class Course < ActiveRecord::Base

  def self.all_metadata
    all.map do |course|
      {
        role: "assistant",
        content: [
          "Nome do curso: #{course.name}",
          "Localização: #{course.location}",
          "A duração do curso: #{course.duration}",
          "A descrição do curso: #{course.description}",
          "O preço é de: #{course.price}"
        ]
      }
    end
  end
end