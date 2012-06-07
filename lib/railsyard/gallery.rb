require 'active_record'
require 'railsyard-backend'
require 'railsyard/gallery/active_record_extension'
require 'railsyard/gallery/engine'
require 'railsyard/gallery/dsl_extension'

ActiveRecord::Base.send :extend, Railsyard::Gallery::ActiveRecordExtension

