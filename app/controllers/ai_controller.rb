require_relative "../views/view"
require_relative "../models/user"
require_relative "../models/question"

class AiController

  def initialize
    @view = View.new
  end
    
  def index
    puts "test"
  end
end