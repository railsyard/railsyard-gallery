module Railsyard::Gallery
  class Engine < ::Rails::Engine

    initializer "Automatic require of Dragonfly" do |app|

      begin
        # try to include dragonfly and railsyard-dragonfly
        require 'dragonfly'
        require 'railsyard-dragonfly'

        # check if someone already initialized Dragonfly
        # in this case we check if someone included dragonfly macros to ActiveRecord::Base
        already_extended = (class << ActiveRecord::Base; self; end).included_modules.include?(Dragonfly::ActiveModelExtensions)
        unless already_extended
          require 'dragonfly/rails/images'
        end

        # in any case we add the Dragonfly[:images] app as middleware
        app.config.middleware.insert 1, 'Dragonfly::Middleware', :images
      rescue LoadError
        puts "WARNING: railsyard-gallery needs railsyard-dragonfly in order to properly work! Add it to your Gemfile!"
      end

      ActiveSupport.on_load(:active_record) do
        require 'railsyard/gallery/image'
      end

      config.to_prepare do
        image_gallery_model_config = <<MODEL
  has_image_gallery :%{name}
  accepts_nested_attributes_for :%{name}
  attr_accessible :%{name}_attributes
MODEL
        image_model_config = <<MODEL
  has_image :%{name}
  accepts_nested_attributes_for :%{name}
  attr_accessible :%{name}_attributes
MODEL
        Railsyard::Backend.plugin_manager.add_plugin(:gallery) do
          name "Gallery"
          generator_editor_type(:image_gallery,
                                {},
                                "image_gallery :%{name}",
                                image_gallery_model_config)
          generator_editor_type(:image,
                                {},
                                "image :%{name}",
                                image_model_config)
        end
      end

    end

  end
end
