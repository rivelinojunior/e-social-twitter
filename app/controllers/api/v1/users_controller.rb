# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        response = ::Users::SignUpUser.new(user_params).call

        if response.success
          render json: { user: response.data }, status: :created
        else
          render json: { errors: response.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:full_name, :user_name, :email).to_h.deep_symbolize_keys
      end
    end
  end
end
