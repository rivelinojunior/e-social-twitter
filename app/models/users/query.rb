# frozen_string_literal: true

module Users
  module Query
    class << self
      delegate :count, to: ::User

      def last = ::User.last&.to_h
    end
  end
end
