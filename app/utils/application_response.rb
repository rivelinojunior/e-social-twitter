# frozen_string_literal: true

class ApplicationResponse
  attr_reader :success, :data, :errors

  def initialize(success:, data: nil, errors: nil)
    self.success = success
    self.data = data
    self.errors = errors
  end

  private

  attr_writer :success, :data, :errors
end
