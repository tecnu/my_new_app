require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) {User.create!(first_name: 'Peter', last_name: 'Parker', email: 'peter@example.com', password: '1234567890')} 

  describe 'GET #show' do
     context 'when a user is logged in' do
       before do
         sign_in user
       end
       
       it 'loads current user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
       end
     end

     context 'when a user is not logged in' do
       it 'redirects to login' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(new_user_session_path)
       end
     end
     
     context 'user tries to access another users page' do
       let(:user2) {User.create!(first_name: 'Mary', last_name: 'Watson', email: 'mary@example.com', password: '0834567885')} 
        before do
         sign_in user
       end
       
       it 'redirects to index' do
        get :show, params: {id: user2.id}
        expect(response).to have_http_status 302
        expect(response).to redirect_to(root_path)
      end
     end
     
  end

end