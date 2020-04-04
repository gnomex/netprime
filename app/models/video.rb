class Video < ApplicationRecord
  belongs_to :user

  validates :name, :url, presence: true
  validate :valid_url

  scope :default_order, -> { order(view_count: :desc) }
  scope :by_user, ->(user) { where(user: user) }

  def up_count
    update(view_count: self.view_count += 1)
  end

  private

  def valid_url
    return if VideoExtensionValidator.validate(url)

    errors.add(:url, :invalid)
  end
end
