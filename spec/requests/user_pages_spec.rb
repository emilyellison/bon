require 'spec_helper'

describe 'user pages' do
  describe 'sign up page' do
    before { visit signup_path }
    subject { page }
    
    it { should have_selector('title', text: 'BeerOn | Sign Up') }
    it { should have_selector('h1', text: 'Sign Up') }
  end
end
