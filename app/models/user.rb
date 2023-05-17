# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :full_name, :user_name, presence: true
end
