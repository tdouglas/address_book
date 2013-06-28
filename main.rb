require 'rubygems'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
# require 'pg' #??

get '/' do
  erb :home
end

get '/see_contacts' do
  erb :list_of_contacts
end

post '/new_contacts' do
  if params[:name] != nil
  @name = params[:name]
  @phone = params[:phone_number]
  @email = params[:email_address]
  @insert_some_fields = "INSERT INTO contacts (name, phone, email)
  VALUES ('#{@name}', #{@phone}, #{@email})"
  redirect ('/see_contacts')
  else
  redirect ('/')
  end
end


# configure do
#   $global_movies = ['Red', 'Green', 'Blue', 'Purple', 'Orange']
# end

# post '/new_movie' do
#   # Because I've POSTed parameters here, I can access them in the params hash
#   # In the form on the /colors view, I said the name of the parameter is "color"
#   # All params pass as strings

#   # Instead of a global variable, I want to write a a file
#   # I want to ask the IMDB database for this info
#   $global_movies << params[:movie]

#   #I don't have a view on the POST.
#   # I have a redirect to a GET
#   redirect to('/movies')
# end