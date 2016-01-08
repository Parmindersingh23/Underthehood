post '/posts/:post_id/answers' do
  if request.xhr?
    @answer = Answer.create(content: params[:description], post_id: params[:post_id])
  end
   erb :"answers/_show", layout: false
end


post '/posts/:post_id/answers/:answer_id/vote' do
  if request.xhr?
    answer_vote = Answer.find(params[:answer_id])
    answer_vote.votes.create(value: 1)
    @total = 0
    answer_vote.votes.each do |vote|
     @total += vote.value
    end
     {value: @total}.to_json
  end
end

post '/posts/:post_id/answers/:answer_id/downvote' do
  if request.xhr?
    answer_downvote = Answer.find(params[:answer_id])
    answer_downvote.votes.create(value: -1)
    @total = 0
    answer_downvote.votes.each do |vote|
     @total += vote.value
    end
    {value: @total}.to_json
  end
end
