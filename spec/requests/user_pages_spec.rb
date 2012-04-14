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
  

end
