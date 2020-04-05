class HomeController < ApplicationController
  layout 'home'

  skip_before_action :authenticate_user!, only: [:index]
  before_action :collection

  def index
    @collection = collection if user_signed_in?
  end

  private

  def collection
    Video.all
  end
end
