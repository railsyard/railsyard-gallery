ActiveRecord::Schema.define(:version => 0) do

  create_table :railsyard_gallery_images, :force => true do |t|
    t.string   :imageable_id
    t.string   :imageable_type
    t.string   :imageable_relation
    t.string   :alt
    t.string   :title
    t.string   :image_name
    t.string   :image_uid
  end

  create_table :pages, :force => true do |t|
    t.string   :title
  end

end
