get '/' do
  redirect '/posts'
end

# get '/posts' do
#   @posts = Post.all
#   erb :index
# end

# get '/posts/:id/vote' do
#   post = Post.find(params[:id])
#   post.votes.create(value: 1)
#   redirect "/posts"
# end

# get '/posts/:id/downvote' do
#   post = Post.find(params[:id])
#   post.votes.create(value: -1)
#   redirect "/posts"
# end

# delete '/posts/:id' do
#   # write logic for deleting posts here.
# end

# post '/posts' do
#   Post.create( title: params[:title] )
#   redirect '/posts'
# end

# get '/post/:id' do
#   @post = Post.find(params[:id])
#   erb :post
# end
