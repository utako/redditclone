# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods

end

def sign_up(username)
  visit "/users/new"
  fill_in "Username", with: username
  fill_in "Password", with: 'abcdef'
  click_button 'Sign Up'
end

def sign_up_as_hello_world
  sign_up("hello_world")
end

def sign_in(username)
  visit "/session/new"
  fill_in "Username", with: username
  fill_in "Password", with: 'abcdef'
  click_button 'Sign In'
end

def create_new_sub_with_five_links
  sign_up_as_hello_world
  visit "/subs/new"
  fill_in "Name", with: 'awww'
  fill_in "Link0url", with: "http://www.reddit.com"
  fill_in "Link0title", with: "second best site ever"
  fill_in "Link0body", with: ""
  fill_in "Link1url", with: "http://www.goggle.com"
  fill_in "Link1title", with: "best site evevarrrrr"
  fill_in "Link1body", with: ""
  fill_in "Link2url", with: "http://www.animalplanet.com"
  fill_in "Link2title", with: "cute animals"
  fill_in "Link2body", with: "dogs cats and lions"
  fill_in "Link3url", with: "http://www.cashcats.biz"
  fill_in "Link3title", with: "Cats on Money"
  fill_in "Link3body", with: "sometimes with guns"
  fill_in "Link4url", with: "http://www.cats.com"
  fill_in "Link4title", with: "Cats"
  fill_in "Link4body", with: ""

  click_button "Create Sub"
end