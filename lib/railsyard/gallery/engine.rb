module Railsyard::Gallery
  class Engine < ::Rails::Engine

    initializer "Automatic require of Dragonfly" do |app|
      begin
        require 'railsyard-dragonfly'
        require 'dragonfly/rails/images'
      rescue LoadError
        puts "WARNING: railsyard-gallery needs railsyard-dragonfly in order to properly work! Add it to your Gemfile!"
      end

      ActiveSupport.on_load(:active_record) do
        require 'railsyard/gallery/image'
      end

    end

  end
end
