require_relative '../config/application'
require_relative '../app/controllers/ai_controller'
require_relative '../config/router'

ai_controller = AiController.new

router = Router.new(ai_controller)

# Start the app
router.run