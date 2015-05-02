module AuthenticationHelpers
  def stub_authorize_user!
    ApplicationController.any_instance.stub(:authorize_user!) { true }
  end
end
