post '/posts/:post_id/comments' do
  if request.xhr?
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(content: params[:description])
    @comment.save
  end
  erb :"comments/_show", layout: false
end

# post '/answers/:answer_id/comments' do
#   p params
#   if request.xhr?
#     answer = Answer.find(params[:answer_id])
#     @answer_comment = answer.comments.build(content: params[:description])
#   end
# end

