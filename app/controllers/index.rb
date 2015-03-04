enable :sessions

get '/' do
  #homepage
  erb :index
end

get '/login' do
  # show logged in page
  erb :login
end

post '/login' do
  # send logged in data to DB and confirm
end

post '/blink' do
  # sends a blink message to the DB and back.
  redirect '/login'
end

post '/logout' do
  # logs a user out.
end

post '/wink' do
  # winks at a user
end
