require File.dirname(__FILE__) + '/../test_helper'
require 'opinion_controller'

class OpinionController; def rescue_action(e) raise e end; end

class OpinionControllerApiTest < Test::Unit::TestCase
  def setup
    @controller = OpinionController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end
end
