# frozen_string_literal: true

class ApplicationCommand
  def self.call(**args) = new(**args).call

  def call = raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"

  private_class_method :new

  private

  def success(data: nil)
    ApplicationResponse.new(success: true, data:)
  end

  def failure(data: nil, errors: nil)
    ApplicationResponse.new(success: false, data:, errors:)
  end
end
