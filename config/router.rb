class Router

  def initialize(controller)
    @controller = controller
  end

  def run
    user = User.create
    loop do
      @controller.chat(user)
    end
  end

end