# encoding: UTF-8

require 'simplecov'
require 'simplecov-rcov'

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/unit'
require 'minitest/autorun'

require 'mocha/setup'

require 'webmock/minitest'

class MiniTest::Unit::TestCase
  def after_teardown
    super
    Timecop.return
  end
end

require 'gds_api/test_helpers/json_client_helper'

def fixture_file(filename)
  File.expand_path("../fixtures/#{filename}", __FILE__)
end

def read_fixture_file(filename)
  File.read(fixture_file(filename))
end
