# frozen_string_literal: true

module Users
  class SignUpUser
    def initialize(params)
      self.params = params
    end

    def call
      Users::SignUpUserCommand.call(params:)
    end

    private

    attr_accessor :params
  end
end
