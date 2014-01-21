require 'rails'

module Plinth
  class Engine < Rails::Railtie
    require "modular-scale"
    initializer :append_assets_path, group: :all do |app|
      app.config.assets.paths.unshift("#{File.expand_path "../..", __FILE__}/../vendor/assets/javascripts")
      app.config.assets.paths.unshift("#{File.expand_path "../..", __FILE__}/../vendor/assets/stylesheets")
    end
  end
end
