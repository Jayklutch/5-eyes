enable :sessions

get '/' do
  @session = check_session(session)
  if @session
    @wall_of_blinks = Blink.all
    @eyes = User.all.to_a
    # show logged in page
    erb :login
  else
  #homepage
  erb :index
  end
end

get '/login' do
  @wall_of_blinks = Blink.all
  @eyes = User.all.to_a
  # show logged in page
  erb :login
end

get '/sign_up' do
  #stuff for signing up
  erb :sign_up
end

post '/sign_up' do
  User.create!(username: params[:wanted_name], password: params[:access_code])
  redirect '/'
  #stuff for signing up
  end

post '/login' do

  @user = User.authenticate(params[:user_name],params[:access_code])
  if @user.nil?
    redirect '/'
  else
    session[:user_id] = @user.id
    redirect '/'
  end
  #send logged in data to DB and confirm
end

post '/blink' do
  @blink = Blink.create!(blink_text: params[:new_blink], user_id: session[:user_id])
  # sends a blink message to the DB and back.
  redirect '/login'
end

post '/wink' do
  # winks at a user
end

post '/logout' do
  session.clear
  redirect '/'
end

def check_session(session)
  session[:user_id]
end

