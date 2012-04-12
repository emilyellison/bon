require 'spec_helper'

describe 'static pages' do

  describe 'home page' do
    before { visit root_path }
    subject { page }
    
    it { should have_selector('title', text: 'BeerOn') }  
    it { should have_selector('h1', text: 'BeerOn') }
    it { page.should_not have_selector('title', text: '| Home') }
    
  end
  
  describe 'help page' do
    before { visit help_path }
    subject { page }
    
    it { should have_selector('title', text: 'BeerOn | Help') }
    it { should have_selector('h1', text: 'Help') }
    
  end
  
  describe 'about page' do
    before { visit about_path }
    subject { page }
    it { should have_selector('title', text: 'BeerOn | About') }
    it { should have_selector('h1', text: 'About BeerOn') }

  end
end