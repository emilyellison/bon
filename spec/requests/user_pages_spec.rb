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
    
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('example@test.com') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Congrats') }
        it { should have_link('Sign Out') }
      end      
    end
  end
  
  describe 'edit' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end
    
    describe 'edit page' do
      it { should have_selector('h1', text: 'Update Your Profile') }
      it { should have_selector('title', text: 'Update Your Profile') }
      it { should have_link('Change Image', href: 'http://gravatar.com/emails') }
    end
    
    describe 'with invalid information' do
      before { click_button 'Save Changes' }
      it { should have_content('error') }
    end
    
    describe 'with valid information' do
      let(:new_name) { "Test McExample" }
      let(:new_email) { "test@example.com" }
      before do
        fill_in 'Name',             with: new_name
        fill_in 'E-mail',           with: new_email
        fill_in 'Password',         with: user.password
        fill_in 'Confirm Password', with: user.password_confirmation
        click_button 'Save Changes'
      end
      
      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign Out', href: signout_path) }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
    end
  end  
  
  describe 'index' do
    let(:user) { FactoryGirl.create(:user) }
    
    before do
      sign_in user
      visit users_path
    end
    
    it { should have_selector('title', text: 'Members') }
    it { should have_selector('h1', text: 'Members') }
    
    describe 'pagination' do
      before(:all)  { 30.times { FactoryGirl.create(:user) } }
      after(:all)   { User.delete_all }
      
      it { should have_link('Next') }
      its(:html) { should match('>2</a>') }
      
      it 'should list each user' do
        User.all[0..2].each do |user|
          page.should have_selector('li', text: user.name)
        end
      end
    end
    
    describe 'delete links' do
      
      it { should_not have_link('Delete') }
      
      describe 'as an admin user' do
        let (:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end
        
        it { should have_link('Delete', href: user_path(User.first)) }
        it 'should be able to delete another user' do
          expect { click_link('Delete') }.to change(User, :count).by(-1)
        end
        it { should_not have_link('Delete', href: user_path(admin)) } 
      end
    end  
  end
end
