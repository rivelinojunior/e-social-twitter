# frozen_string_literal: true

module Users
  module Commands
    class CreateCommonUser < ApplicationCommand
      def initialize(full_name:, user_name:, email:)
        self.full_name = full_name
        self.user_name = user_name
        self.email = email
      end

      def call
        user = Repository.create!(full_name:, user_name:, email:)

        success(data: user.to_h)
      rescue ActiveRecord::RecordInvalid => e
        failure(errors: e.record.errors.full_messages)
      end

      private

      attr_accessor :full_name, :user_name, :email
    end
  end
end
