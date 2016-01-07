get '/posts' do
  @posts = Post.all
  erb :index
end

get '/posts/new' do
  erb :'/posts/new'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

#parminder/alicia created this
post '/new' do
  @post = Post.create(title: params[:title], content: params[:content], user_id: session[:user_id])
  redirect '/posts'
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/posts'

end

get '/posts/:id/vote' do
  post = Post.find(params[:id])
  post.votes.create(value: 1)
  redirect "/posts"
end

get '/posts/:id/downvote' do
  post = Post.find(params[:id])
  post.votes.create(value: -1)
  redirect "/posts"
end
