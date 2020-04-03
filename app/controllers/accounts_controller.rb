class AccountsController < ApplicationController
  # before_action :presenter
  before_action :resource, only: [:show]

  def index
    # @collection = Video.by_user(current_user)
  end

  def show
  end

  private

  def resource
    @resource ||= current_user
  end

  def presenter

  end
end
