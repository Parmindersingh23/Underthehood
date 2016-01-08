post '/posts/:id/comments' do
  if request.xhr?
    @post = Post.find(params[:id])
    @comment = @post.comments.build(content: params[:description])
    @comment.save
  end
  erb :"comments/_show", layout: false
end

# post '/answers/:id/comments' do
  # p params
  # if request.xhr?
  #   answer = Answer.find(params[:id])
  #   answer.comments.new(params[:comment])
  # end
# end

