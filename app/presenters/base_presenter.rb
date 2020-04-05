class BasePresenter
  attr_reader :resource, :current_user

  def initialize(resource, current_user = nil)
    @resource = resource
    @current_user = current_user
  end

  private

  def localize_date(date)
    date&.strftime('%d/%m/%Y')
  end

  def localize_datetime(date)
    date&.strftime('%d/%m/%Y, %H:%M')
  end
end
