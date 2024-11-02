namespace :db do
    desc "Drop the production database"
    task drop_production: :environment do
      if Rails.env.production?
        puts "Dropping the production database..."
        ActiveRecord::Base.connection.drop_database(ActiveRecord::Base.connection.current_database)
        puts "Database dropped successfully."
      else
        puts "This task is only for production environment."
      end
    end
  end
  