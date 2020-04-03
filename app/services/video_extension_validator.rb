require 'uri'

class VideoExtensionValidator
  def initialize(url)
    @url = url
  end

  def self.validate(url)
    new(url).validate
  end

  def validate
    valid_url? && allowed_extension?
  end

  private

  attr_reader :url

  def valid_url?
    (uri ||= URI.parse(url)) && uri.host.present? rescue false
  end

  def allowed_extension?
    url =~ /^(.)+(.m3u8)$/
  end
end
