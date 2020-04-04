class AccountsController < ApplicationController
  before_action :resource, only: [:show]

  def show
  end

  private

  def resource
    @resource ||= current_user
  end
end
