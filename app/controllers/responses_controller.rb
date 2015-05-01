class ResponsesController < ApplicationController

  def new
    @response = Response.new
  end

  private

  def response_params
    params.require(:response).permit(:body)
  end

end