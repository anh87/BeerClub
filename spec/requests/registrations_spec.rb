require 'rails_helper'

RSpec.describe API::Root::UserApi::Registrations, type: :request do

  describe 'POST api/users' do
    let(:url) { '/api/users' }

    context 'Create user' do
      it 'create user' do
        params = {
          user: {
            name: Faker::Name.name,
            email: Faker::Internet.email,
            password:  "password",
            password_confirmation: "password",
            admin_mode: true
          }
        }

        expect { post url, params: params }.to change { User.count }.from(0).to(1)
        expect(response).to have_http_status(:success)
        expect(User.last.admin?).to be true
        expect(User.last.present?).to be true
      end

      it 'create customer' do
        params = {
          user: {
            name: Faker::Name.name,
            email: Faker::Internet.email,
            password:  "password",
            password_confirmation: "password",
            admin_mode: false
          }
        }

        expect { post url, params: params }.to change { Customer.count }.from(0).to(1)
        expect(response).to have_http_status(:success)
        expect(Customer.last.present?).to be true
      end
    end
  end
end
