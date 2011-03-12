require_relative 'test_helper'

class RstatusTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods
  OmniAuth.config.test_mode = true

  def app() Rstatus end

  def test_hello_world
    get '/'
    assert last_response.ok?
    #assert_equal "Hello, world!", last_response.body
  end

  def login
    get '/auth/twitter'
    follow_redirect!
  end

  def test_login_with_twitter
    login
    assert_equal "You're now logged in.", last_response.body
  end


end
