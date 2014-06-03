ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  ActiveRecord::Migration.check_pending!
end

module Capybara::Assertions
  def assert_title(*args)
    node, *args = prepare_args(args)
    assert(node.has_title?(*args),
           message { "Expected #{node.title.inspect} to include #{args.first.inspect}" })
  end

  def refute_title(*args)
    node, *args = prepare_args(args)
    assert(node.has_no_title?(*args),
           message { "Expected #{node.title.inspect} not to include #{args.first.inspect}" })
  end
  alias_method :assert_no_title, :refute_title
end
