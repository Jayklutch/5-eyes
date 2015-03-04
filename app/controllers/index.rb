enable :sessions

get '/' do
  #homepage
  erb :index
end

get '/login' do
  # show logged in page
  erb :login
end

get '/sign_up' do
  #stuff for signing up
  erb :sign_up
end

post '/sign_up' do
  #stuff for signing up
  end

post '/login' do
  # send logged in data to DB and confirm
end

post '/blink' do
  # sends a blink message to the DB and back.
  redirect '/login'
end

post '/wink' do
  # winks at a user
end

post '/logout' do
  session.clear
end
