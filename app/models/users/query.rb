# frozen_string_literal: true

module Users
  module Query
    class << self
      delegate :count, to: ::User
    end
  end
end
