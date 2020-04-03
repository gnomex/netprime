require_relative 'boot'

require "rails/all"

Bundler.require(*Rails.groups)

module NetpriMe
  class Application < Rails::Application
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}')]

    config.i18n.available_locales = [:en, :"pt-BR"]
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = 'Brasilia'

    config.encoding = "utf-8"

    config.action_dispatch.default_headers = {
      'X-Download-Options' => 'noopen',
      'X-Permitted-Cross-Domain-Policies' => 'none'
    }

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
