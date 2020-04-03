class Video < ApplicationRecord
  belongs_to :user

  validates :name, :url, presence: true
  validate :valid_url

  scope :by_user, ->(user) { where(user: user) }

  private

  def valid_url
    return if VideoExtensionValidator.validate(url)

    errors.add(:url, :invalid)
  end
end
