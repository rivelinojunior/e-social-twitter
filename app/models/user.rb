# frozen_string_literal: true

class User < ApplicationRecord
  Data = ::Data.define(:id, :email, :full_name, :user_name, :created_at, :updated_at)

  validates :email, :full_name, :user_name, presence: true

  def build_data
    Data.new(id:, email:, full_name:, user_name:, created_at:, updated_at:)
  end
end
