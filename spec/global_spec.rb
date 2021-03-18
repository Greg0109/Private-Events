require 'rails_helper'

RSpec.describe 'Index', type: :request do
  describe 'Access website' do
    before { get root_path }
    it 'Allows access to website. Return code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Access login' do
    before { get users_log_in_path }
    it 'Allows access to login page. Return code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Access new user' do
    before { get users_new_path }
    it 'Allows access to new user page. Return code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
