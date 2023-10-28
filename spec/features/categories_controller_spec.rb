require 'rails_helper'
require 'faker'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).not_to be_successful
      expect(response).not_to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).not_to be_successful
      expect(response).not_to render_template(:new)
    end
  end

  describe 'GET #show' do
    it 'assigns the correct category' do
      category = FactoryBot.create(:category)
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end
end
