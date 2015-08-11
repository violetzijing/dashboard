# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include(FactoryGirl::Syntax::Methods)

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryGirl.reload
    FactoryGirl.lint
  end

  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.clean
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.order = "random"
end
