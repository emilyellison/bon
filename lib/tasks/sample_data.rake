namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    admin = User.create!( name: 'Pickle Bean',
                          email: 'pickle@bean.com',
                          password: 'knuckle',
                          password_confirmation: 'knuckle' )
    admin.toggle!(admin)
      
    
  end
end