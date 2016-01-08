get '/posts' do
  @posts = Post.all
  erb :index
end

get '/posts/new' do
  erb :'/posts/new'
end

get '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  erb :'posts/show'
end

#parminder/alicia created this
post '/posts/new' do
  @post = Post.create(title: params[:title], content: params[:content], user_id: session[:user_id])
  redirect '/posts'
end

delete '/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @post.destroy
  redirect '/posts'

end

get '/posts/:post_id/vote' do
  post = Post.find(params[:post_id])
  post.votes.create(value: 1)
  redirect "/posts"
end

get '/posts/:post_id/downvote' do
  post = Post.find(params[:post_id])
  post.votes.create(value: -1)
  redirect "/posts"
end
