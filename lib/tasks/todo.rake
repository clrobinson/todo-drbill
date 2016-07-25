namespace :todo do
  desc "Deploy the app to Heroku"
  task deploy: :environment do
    Bundler.with_clean_env do
      puts "Setting production environment variables on Heroku..."
      puts `figaro heroku:set -e production`
      puts "Migrating Heroku DB..."
      puts `heroku run rake db:migrate`
      puts "Deploying app..."
      puts `git push heroku master`
      puts "Done!"
    end
  end

end
