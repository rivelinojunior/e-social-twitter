# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do
  subject(:perform_request) { post '/api/v1/users', params: user_params }

  context 'when user creation is successful' do
    let(:user_params) { { user: attributes_for(:user) } }

    it 'returns a success response with the created user' do
      perform_request

      user_created = Users::UserQuery.last

      expect(response.body).to eq({ user: user_created }.to_json)
    end

    it do
      perform_request

      expect(response).to have_http_status(:created)
    end
  end

  context 'when user creation fails' do
    let(:user_params) { { user: attributes_for(:user, full_name: '') } }

    it do
      perform_request

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error response with the validation errors' do
      perform_request

      expect(response.body).to eq({ errors: ["Full name can't be blank"] }.to_json)
    end
  end
end
