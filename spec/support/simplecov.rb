# frozen_string_literal: true

if ENV['COVERAGE'] == 'on'
  require 'simplecov'

  SimpleCov.start 'rails' do
    add_group 'Use Cases', 'app/use_cases'
  end
end
