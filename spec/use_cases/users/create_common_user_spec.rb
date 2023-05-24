#  frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CreateCommonUser do
  subject(:perform_usecase) { described_class.new(params).call }

  before { freeze_time }

  context 'when params is right' do
    let(:params) do
      {
        full_name: 'Rivelino Junior',
        user_name: 'rivelinojunior',
        email: 'rv.fernandes.junior@gmail.com'
      }
    end

    it 'returns data from user created' do
      response = perform_usecase

      expect(response.data).to eq(
        id: 1,
        created_at: Time.current,
        updated_at: Time.current,
        full_name: 'Rivelino Junior',
        user_name: 'rivelinojunior',
        email: 'rv.fernandes.junior@gmail.com'
      )
    end

    it 'increaces the number of users by 1' do
      expect { perform_usecase }.to change(Users::Query, :count).by(1)
    end
  end

  context 'when full_name is empty' do
    let(:params) do
      {
        full_name: '',
        user_name: 'rivelinojunior',
        email: 'rv.fernandes.junior@gmail.com'
      }
    end

    it 'returns error messages' do
      response = perform_usecase

      expect(response.errors).to eq(["Full name can't be blank"])
    end

    it 'does not increace the number of users by 1' do
      expect { perform_usecase }.not_to change(Users::Query, :count)
    end
  end

  context 'when user_name is empty' do
    let(:params) do
      {
        full_name: 'Rivelino Junior',
        user_name: '',
        email: 'rv.fernandes.junior@gmail.com'
      }
    end

    it 'returns error messages' do
      response = perform_usecase

      expect(response.errors).to eq(["User name can't be blank"])
    end

    it 'does not increace the number of users by 1' do
      expect { perform_usecase }.not_to change(Users::Query, :count)
    end
  end

  context 'when email is empty' do
    let(:params) do
      {
        full_name: 'Rivelino Junior',
        user_name: 'rivelinojunior',
        email: ''
      }
    end

    it 'returns error messages' do
      response = perform_usecase

      expect(response.errors).to eq(["Email can't be blank"])
    end

    it 'does not increace the number of users by 1' do
      expect { perform_usecase }.not_to change(Users::Query, :count)
    end
  end
end
