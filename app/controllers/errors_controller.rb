class ErrorsController < ApplicationController
  layout false

  skip_before_action :authenticate_user!

  def not_found
    render status: 404
  end

  def bad_request
    render status: 400
  end

  def server_error
    render status: 500
  end
end
