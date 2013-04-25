require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :development)
require './main.rb'
app = MyApp.new
Rack::Handler::Thin.run(app, Port:9292)


