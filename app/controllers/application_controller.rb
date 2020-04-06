class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale
  before_action :default_format_html

  private

  def page
    params[:page]
  end

  def per_page
    params[:per_page]
  end

  def set_locale
    I18n.locale = params[:locale] || current_user&.locale ||
      request_locale || I18n.default_locale
  rescue I18n::InvalidLocale
    I18n.locale = I18n.default_locale
  end

  def request_locale
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end

  def default_format_html
    request.format = "html"
  end

  def go_back
    redirect_back(
      fallback_location: root_path,
      alert: "Ops, o vídeo não está mais disponível"
    )
  end

  def ensure_owner
    return if account_params == current_user.slug

    redirect_to account_path(current_user), alert: "Ops, não é possível acessar"
  end

  def account_params
    params[:slug]
  end
end
