require 'rubygems'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

#establish connection

get '/' do
  erb :home
end

get '/see_contacts' do
  db = PG.connect(:dbname => 'address_book', :host => 'localhost')
  sql = "SELECT * FROM contacts"
  @contacts = db.exec(sql)

  db.close
  erb :list_of_contacts
end

