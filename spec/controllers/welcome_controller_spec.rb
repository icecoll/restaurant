require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'index' do
    it 'should content login/register link if user not login' do
      get :index
      expect(response).to be_success
    end
  end
end
