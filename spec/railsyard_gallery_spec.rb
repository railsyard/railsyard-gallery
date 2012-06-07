require 'spec_helper'
require 'railsyard/gallery/image'

describe "RailsyardGallery" do

  describe "has_image" do
    it "allows to adds an image to the model" do
      page = Page.new
      page.first_image = Railsyard::Gallery::Image.new(title: 'foo')
      page.second_image = Railsyard::Gallery::Image.new(title: 'bar')
      page.save

      page.reload
      page.first_image.should be_an Railsyard::Gallery::Image
      page.first_image.title.should == 'foo'

      page.second_image.should be_an Railsyard::Gallery::Image
      page.second_image.title.should == 'bar'
    end

    it "supports nested attributes" do
      page = Page.create(first_image_attributes: { title: 'foo' })
      page.first_image.should be_an Railsyard::Gallery::Image
      page.first_image.title.should == 'foo'
    end
  end

  describe "has_image_gallery" do
    it "allows to adds an image gallery to the model" do
      page = Page.new
      page.first_gallery = [ Railsyard::Gallery::Image.new(title: 'foo') ]
      page.second_gallery = [ Railsyard::Gallery::Image.new(title: 'bar') ]
      page.save

      page.reload
      page.first_gallery.should have(1).image
      page.first_gallery.first.title.should == 'foo'

      page.second_gallery.should have(1).image
      page.second_gallery.first.title.should == 'bar'
    end

    it "supports nested attributes" do
      page = Page.create(first_gallery_attributes: [ { title: 'foo' } ])
      page.first_gallery.should have(1).image
      page.first_gallery.first.title.should == 'foo'
    end

    it "supports .build" do
      page = Page.create
      page.first_gallery.build(title: 'foo')
      page.save

      page.reload

      page.first_gallery.should have(1).image
      page.first_gallery.first.title.should == 'foo'
    end

    it "supports .create" do
      page = Page.create
      page.first_gallery.create(title: 'foo')

      page.reload

      page.first_gallery.should have(1).image
      page.first_gallery.first.title.should == 'foo'
    end
  end
end
