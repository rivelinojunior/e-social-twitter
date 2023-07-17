# frozen_string_literal: true

module Users
  module UserQuery
    class << self
      delegate :count, to: ::User

      def last = ::User.last&.build_data
    end
  end
end
