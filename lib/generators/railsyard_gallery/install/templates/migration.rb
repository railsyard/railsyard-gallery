class CreateRailsyardGalleryImages < ActiveRecord::Migration

  def change
    create_table :railsyard_gallery_images do |t|
      t.string   :imageable_id
      t.string   :imageable_type
      t.string   :imageable_relation
      t.string   :alt
      t.string   :title
<% if defined? Railsyard::Dragonfly -%>
      t.string   :image_name
      t.string   :image_uid
<% end -%>
    end
    add_index :railsyard_gallery_images, [:imageable_id, :imageable_type, :imageable_relation], name: 'railsyard_gallery_images_imageable'
  end

end
