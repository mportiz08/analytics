# analytics

    export MYSQL_USERNAME="yourusername"
    export MYSQL_PASSWORD="yourpassword"
    bundle install --path=vendor/bundle
    rake db:create
    rake db:migrate
    rake db:seed
    rails server
