# Load the rails application
#ENV["GEM_PATH"]="/home/alejandr/ruby/gems:/usr/local/lib/ruby/gems/1.8:/home/alejandr/ruby/gems/bundler"

#ENV["GEM_PATH"]="/home/alejandr/ruby/gems"
#ENV["RAILS_ENV"]="production"
ENV["RAILS_ENV"]="development"

require File.expand_path('../application', __FILE__)
#Paperclip.options[:command_path] = "/opt/ImageMagick/bin"
# Initialize the rails application
Onlineshop::Application.initialize!
