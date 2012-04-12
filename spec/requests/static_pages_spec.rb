require 'spec_helper'

describe 'static pages' do

  describe 'home page' do

    it "should have the title 'BeerOn'" do
      visit '/static_pages/home'
      page.should have_selector('title', text: 'BeerOn')
    end
    
    it "should have the heading 'BeerOn'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'BeerOn')
    end
  end
  
  describe 'help page' do
    
    it "should have the title 'BeerOn | Help!'" do
      visit '/static_pages/help'
      page.should have_selector('title', text: 'BeerOn | Help!')
    end
    
    it "should have the heading 'Help! I\'ve fallen... and I can\'t find my beer!'" do
      visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help! I\'ve fallen... and I can\'t find my beer!')
    end
  end
  
  describe 'about page' do
    
    it "should have the title 'BeerOn | About'" do
      visit '/static_pages/about'
      page.should have_selector('title', text: 'BeerOn | About')
    end
    
    it "should have the heading 'About BeerOn'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About BeerOn')
    end
  end
end