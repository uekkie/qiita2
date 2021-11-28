require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Atiiq
  class Application < Rails::Application
    config.load_defaults 6.0

    config.time_zone = 'Tokyo'

    config.i18n.default_locale = :ja

    config.generators do |g|
      g.factory_bot false
      g.factory_bot dir: 'spec/factories'

      g.test_framework :rspec,
        view_specs: false,
        helper_spec: false,
        routing_specs: false
    end
  end
end
