require 'railsyard-backend/dsl/edit'
require 'railsyard-backend/dsl/edit_group'
require 'railsyard-backend/config/nested_edit'
require 'railsyard-backend/config/edit_field'

module Railsyard::Gallery
  module DslExtension

    def image(name, options = {})
      image_association(name, options)
    end

    def image_gallery(name, options = {})
      image_association(name, options)
    end

    private

    def image_association(name, options)
      options.symbolize_keys!
      options.assert_valid_keys(:fields, :components)
      options.reverse_merge!(fields: [:title, :image, :alt])

      nested_edit = Railsyard::Backend::Config::NestedEdit.new(name)
      config.send(add_nested_image_method, nested_edit)

      Array(options[:fields]).each do |field_name|
        field = Railsyard::Backend::Config::EditField.new(field_name)
        if field_name == :image && defined?(Railsyard::Dragonfly)
          field.field_type = :dragonfly
          if options[:components].present?
            field.input_options = { components: Array(options[:components]) }
          end
        end
        nested_edit.add_field_to_default_group(field)
      end
    end

  end
end

module Railsyard::Backend::Dsl
  class Edit
    include Railsyard::Gallery::DslExtension

    private
    def add_nested_image_method
      :add_nested_to_default_group
    end
  end
end

module Railsyard::Backend::Dsl
  class EditGroup
    include Railsyard::Gallery::DslExtension

    private
    def add_nested_image_method
      :add_nested
    end
  end
end
