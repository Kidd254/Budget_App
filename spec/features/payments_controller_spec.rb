require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe 'GET #new' do
    context 'when user is authenticated' do
      it 'renders the new template' do
        user = create(:user)
        sign_in user

        get :new

        expect(response).not_to render_template(:new)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign in page' do
        get :new

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let(:category) { create(:category) }
      let(:valid_params) { { payment: attributes_for(:payment, category_id: category.id) } }

      before { sign_in user }


      it 'redirects to the category page' do
        post :create, params: valid_params

        expect(response).not_to redirect_to(category_path(category))
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign in page' do
        post :create, params: { payment: attributes_for(:payment) }

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
