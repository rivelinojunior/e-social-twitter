# frozen_string_literal: true

module Users
  class SignUpUserCommand < ApplicationCommand
    def initialize(params:)
      self.params = params
    end

    def call
      user = User.create!(
        full_name: params[:full_name],
        user_name: params[:user_name],
        email: params[:email]
      )

      success(data: user.build_data)
    rescue ActiveRecord::RecordInvalid => e
      failure(errors: e.record.errors.full_messages)
    end

    private

    attr_accessor :params
  end
end
