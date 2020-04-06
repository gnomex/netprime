class ErrorsController < ApplicationController
  layout false

  skip_before_action :authenticate_user!

  def not_found
    redirect_to root_path, alert: t("messages.not_found")
  end

  def server_error
    redirect_to root_path, alert: t("messages.server_error")
  end
end
