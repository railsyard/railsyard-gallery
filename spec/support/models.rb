class Page < ActiveRecord::Base
  has_image :first_image
  has_image :second_image
  has_image_gallery :first_gallery
  has_image_gallery :second_gallery

  accepts_nested_attributes_for :first_gallery
  accepts_nested_attributes_for :first_image
end


