 get '/login' do
  erb :"sessions/login"
end

post '/login' do
  @login = User.authenticate(params[:username], params[:password])
  puts params
  if @login
    session[:user_id] = @login.id

    redirect "/profile"
  else
    @errors = "Your credentials don't match"
    erb :"/sessions/login"
  end
end


get '/logout' do
  session.clear
  redirect "/"
end
