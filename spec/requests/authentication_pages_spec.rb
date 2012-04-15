require 'spec_helper'

describe 'authentication' do
  subject { page }
  
  describe 'sign-in page' do
    before { visit signin_path }
    
    it { should have_selector('h1',     text: 'Sign In') }
    it { should have_selector('title',  text: 'Sign In') }
  end
  
  describe 'sign-in' do
    before { visit signin_path }
    
    describe 'with invalid information' do
      before { click_button 'Sign In' }
      
      it { should have_selector('title', text: 'Sign In') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      
      describe 'after visiting another page' do
        before { click_link 'Home' }
        it { should_not have_selector('div.alert.alert-error', text: 'Invalid') }
      end
    end
    
    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before do
         fill_in 'E-mail', with: user.email
         fill_in 'Password', with: user.password
         click_button 'Sign In' 
      end
      
      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      
      describe 'followed by signout' do
        before { click_link 'Sign Out' }
        it { should have_link 'Sign In' }
        it { should have_selector('div.alert.alert-success', text: 'Come back when you need another beer.') }
      end
    end
  end
end
