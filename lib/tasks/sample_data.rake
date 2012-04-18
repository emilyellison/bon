namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    admin = User.create!( name: 'Emily Ellison',
                          email: 'emilyellison986@gmail.com',
                          password: 'Code3Knuckl3',
                          password_confirmation: 'Code3Knuckl3' )
    admin.toggle!(admin)
      
    
  end
end