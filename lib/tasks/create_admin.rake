include Rails.application.routes.url_helpers

begin
  namespace :admin do
    task :create => :environment do
      puts "You will be prompted to enter an email address and password for the new admin"
      puts "Enter an email address:"
      email = STDIN.gets
      puts "Enter a password:"
      password = STDIN.gets
      unless email.strip!.blank? || password.strip!.blank?
        if Admin.create!(:email => email, :password => password)
          puts "The admin was created successfully. Log in at #{new_admin_session_path}"
        else
          puts "Sorry, the admin was not created!"
        end
      end
    end
  end
end
