# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#validations' do
    subject(:user) { build(:user) }

    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:user_name) }
  end
end
