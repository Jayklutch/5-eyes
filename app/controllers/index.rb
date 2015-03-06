enable :sessions

get '/' do
  @session = check_session(session)
  if @session
    @wall_of_blinks = Blink.all.to_a
    @eyes = User.all.to_a

    # show logged in page
    erb :login
  else
  #homepage
  erb :index
  end
end

get '/login' do
  @session = check_session(session)
  @wall_of_blinks = Blink.all
  @eyes = User.all.to_a
  # show logged in page
  erb :login
end

get '/sign_up' do
  @status = "Sign your life away below"
  @session = check_session(session)
  #stuff for signing up
  erb :sign_up
end

post '/sign_up' do
  @session = check_session(session)
  @user=User.create(username: params[:wanted_name], password: params[:access_code])
  if @user.valid?
    @user.save!
    redirect '/'
  else
    if @user.errors.messages[:username][0].include?("taken")
      @status = "Sorry someone has already claimed that identity"
    else
      @status = "You don't appear to be a country"
    end
    erb :sign_up
     redirect '/'
  end
end

post '/login' do
  @session = check_session(session)
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
  @session = check_session(session)
  @blink = Blink.create!(blink_text: params[:new_blink], user_id: session[:user_id])
  if params[:new_blink] == '#purge#'
    Blink.delete_all
  end# sends a blink message to the DB and back.
  redirect '/login'
end

post '/wink' do
  @session = check_session(session)
  # winks at a user
end

post '/logout' do
  @session = check_session(session)
  session.clear
  redirect '/'
end

def check_session(session)
  session[:user_id]
end

