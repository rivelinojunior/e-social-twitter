# frozen_string_literal: true

module Users
  module Repository
    class << self
      delegate :create!, to: ::User
    end
  end
end
