require 'spec_helper'

describe 'user pages' do
  
  subject { page }
 
  describe 'profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('title', text: user.name ) }
    it { should have_selector('h1', text: user.name ) }
  end
   
  describe 'sign up page' do
    before { visit signup_path }  
    
    it { should have_selector('title', text: 'BeerOn | Sign Up') }
    it { should have_selector('h1', text: 'Sign Up') }
  end
  
  describe 'sign up' do
    before { visit signup_path }
    
    let(:submit) { 'Create BeerOn Account' }
    
    describe 'with invalid information' do
      it 'should not create a user' do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe 'error messages' do
        before { click_button submit }
        
        it { should have_selector('title', text: 'Sign Up') }
        it { should have_content('error') }
      end
    end
    
    describe 'with valid information' do
      before do
        fill_in 'Name',             with: 'Example McTest'
        fill_in 'E-mail',           with: 'example@test.com'
        fill_in 'Password',         with: 'foobar'
        fill_in 'Confirm Password', with: 'foobar'
      end
      
      it 'should create a new user' do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe 'after saving the user' do
        before { click_button submit }
        let(:user) {User.find_by_email('example@test.com') }
        
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Congrats') }
      end
    end
  end
end
