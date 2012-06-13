# railsyard-gallery

{<img src="https://secure.travis-ci.org/cantierecreativo/railsyard-gallery.png" alt="Build Status" />}[http://travis-ci.org/cantierecreativo/railsyard-gallery]

* [Homepage](https://github.com/cantierecreativo/railsyard-gallery#readme)
* [Issues](https://github.com/cantierecreativo/railsyard-gallery/issues)
* [Email](mailto:s.verna at cantierecreativo.net)

## Description

With railsyard-gallery, you are able to DRY up your models and freely associate images and galleries to your models.

## Installation

Add `railsyard-gallery` to your Gemfile:

```ruby
   gem 'railsyard-gallery', github: 'cantierecreativo/railsyard-gallery'
```

Run the generator that will create the images table, and migrate.

```
> rails g railsyard_gallery:install
> rake db:migrate
```

## Gallery usage

Suppose you have a Page model. You just need add the following to
`app/models/page.rb`:

```ruby
class Page < ActiveRecord::Base
  has_image_gallery :album
  accepts_nested_attributes_for :album
end
```

And tell the Railsyard editor to add some fields for it:

```ruby
Railsyard::Backend.define_editor_for Page do

  edit do
    image_gallery :album
  end

end
```

## Single image usage

Suppose you have a Page model. You just need add the following to
`app/models/page.rb`:

```ruby
class Page < ActiveRecord::Base
  has_image :my_image
  accepts_nested_attributes_for :my_image
end
```

And tell the Railsyard editor to add some fields for it:

```ruby
Railsyard::backend.define_editor_for page do

  # [...]

  edit do
    image :my_image
  end
end
```

## Customizations

On your editor you can adjust both the image fields to show:

```ruby
Railsyard::backend.define_editor_for page do

  # [...]

  edit do
    # default fields are [:title, :image, :alt]
    image :my_image, fields: [:image, :alt]
  end
end
```

And also the Dragonfly components for the image field:

```ruby
railsyard::backend.define_editor_for page do

  # [...]

  edit do
    image :my_image, components: [:preview, :upload, :remove]
  end
end
```

## Copyright

Copyright (c) 2012 Stefano Verna, Cantiere Creativo
See the file LICENSE.txt for details.
