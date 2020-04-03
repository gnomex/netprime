class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_save :create_slug

  def to_param
    slug
  end

  private

  def create_slug
    return unless self.respond_to?(:slug) && self.slug.blank?

    slug = SecureRandom.hex(4)

    while self.class.find_by(slug: slug)
      slug = SecureRandom.hex(4)
    end

    self.slug = slug
  end
end
