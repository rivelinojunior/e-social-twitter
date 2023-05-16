# frozen_string_literal: true

if ENV['COVERAGE'] == 'on'
  require 'simplecov'

  SimpleCov.start 'rails'
end
