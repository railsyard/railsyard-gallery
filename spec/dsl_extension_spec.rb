require 'spec_helper'
require 'railsyard/gallery/dsl_extension'

describe "Railsyard DSL extension" do

  context "with railsyard-dragonfly" do
    it "supports extensions" do

      module Railsyard::Dragonfly; end

      edit = Railsyard::Backend::Config::Edit.new do
        image :default_image
        image :image, fields: [:image, :alt]
        image_gallery :gallery, components: [:preview, :upload]
        group :group do
          image :secondary_image, fields: :image
          image_gallery :secondary_gallery, components: :preview
        end
      end

      main_group = edit.group(:main)

      main_group.field(:default_image).should be_a Railsyard::Backend::Config::NestedEdit
      main_group.field(:default_image).group(:main).fields.should have(3).fields

      main_group.field(:image).should be_a Railsyard::Backend::Config::NestedEdit
      main_group.field(:image).group(:main).fields.should have(2).fields

      main_group.field(:gallery).should be_a Railsyard::Backend::Config::NestedEdit
      main_group.field(:gallery).group(:main).field(:image).input_options.should == { components: [:preview, :upload] }

      group = edit.group(:group)

      group.field(:secondary_image).should be_a Railsyard::Backend::Config::NestedEdit
      group.field(:secondary_image).group(:main).fields.should have(1).field

      group.field(:secondary_gallery).should be_a Railsyard::Backend::Config::NestedEdit
      group.field(:secondary_gallery).group(:main).field(:image).input_options.should == { components: [:preview] }
    end
  end

end
