get '/users/new' do
  erb :'users/new'
end

post '/users' do
  puts params
  @user = User.new(params[:user])
  if @user.save
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/profile' do
  @user = current_user
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  if @user.save
    @updated = true
    redirect '/profile'
  else
    @errors = @user.errors.full_messages
    erb :'users/edit'
  end
end
