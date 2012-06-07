require 'yaml'
require 'erb'
require 'rspec'
require 'logger'
require 'active_support'
require 'active_model'
require 'active_record'
require 'action_controller'
require 'railsyard/gallery'
require 'railsyard/gallery/version'

plugin_test_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_test_dir + "/debug.log")

ActiveRecord::Base.configurations = YAML::load ERB.new(IO.read(plugin_test_dir + "/db/database.yml")).result
ActiveRecord::Base.establish_connection(ENV["DB"] || "sqlite3")
ActiveRecord::Migration.verbose = false

load File.join(plugin_test_dir, "db", "schema.rb")

require 'support/models'
require 'rspec/rails'

RSpec.configure do |config|
  config.fixture_path = "#{plugin_test_dir}/fixtures"
  config.use_transactional_fixtures = true
end
