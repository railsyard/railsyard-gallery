# railsyard-gallery

[![Build Status](https://secure.travis-ci.org/cantierecreativo/railsyard-gallery.png)](http://travis-ci.org/cantierecreativo/railsyard-gallery)

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

Suppose you want a Page model with an image gallery. You can use the generator:

```
> rails g railsyard:editor Page album:image_gallery [...]
```

or add it manually. In `app/models/page.rb`:

```ruby
class Page < ActiveRecord::Base
  has_image_gallery :album
  accepts_nested_attributes_for :album
end
```

In your Railsyard editor file:

```ruby
Railsyard::Backend.define_editor_for Page do

  edit do
    image_gallery :album
  end

end
```

## Single image usage

Suppose you want a Page model with a single image. With the generator:

```
> rails g railsyard:editor Page album:image [...]
```

Manaully: in `app/models/page.rb`

```ruby
class Page < ActiveRecord::Base
  has_image :my_image
  accepts_nested_attributes_for :my_image
end
```

and in your Railsyard editor file:

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
