require 'simplecov'
require 'codacy-coverage'

Codacy::Reporter.start

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Codacy::Formatter
])

SimpleCov.start :rails do
  add_filter "/app/controllers"
  add_filter "/app/helpers"
  add_filter "/app/mailers"
  add_filter "/lib"
end

SimpleCov.at_exit do
  SimpleCov.minimum_coverage 70
  SimpleCov.result.format!
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.disable_monkey_patching!
  config.order = :random
end
