post '/posts/:id/answers' do
  if request.xhr?
    @answer = Answer.create(content: params[:description], post_id: params[:id])
  end
   erb :"answers/_show", layout: false
end


post '/posts/:post_id/answers/:answer_id/vote' do
  if request.xhr?
  @answer_vote = Answer.find(params[:answer_id])
  @answer_vote.votes.build(value: 1)
  @answer_vote.save
  end
    erb :"votes/_vote", layout: false

end

post '/posts/:post_id/answers/:answer_id/downvote' do
  if request.xhr?
  @answer_downvote = Answer.find(params[:answer_id])
  @answer_downvote.votes.build(value: -1)
  @answer_downvote.save
  end
    erb :"votes/_downvote", layout: false
end
