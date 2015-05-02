module AuthenticationHelpers
  def stub_authorize_user!
    ApplicationController.any_instance.stub(:authorize_user!) { true }
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, :type => :feature
end