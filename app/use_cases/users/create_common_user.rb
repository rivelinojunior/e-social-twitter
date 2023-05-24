# frozen_string_literal: true

module Users
  class CreateCommonUser
    def initialize(params)
      self.params = params
    end

    def call
      Users::Commands::CreateCommonUser.call(
        full_name: params[:full_name],
        user_name: params[:user_name],
        email: params[:email]
      )
    end

    private

    attr_accessor :params
  end
end
