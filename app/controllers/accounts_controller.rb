class AccountsController < ApplicationController
  before_action :ensure_owner, only: [:show]
  before_action :resource, only: [:show]
  before_action :presenter, only: [:show]

  helper_method :presenter

  def show
  end

  private

  def resource
    @resource ||= current_user
  end

  def presenter
    @presenter ||= UserPresenter.new(resource, current_user)
  end
end
