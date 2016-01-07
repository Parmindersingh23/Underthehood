# get 'posts/:id/answers' do

# end

# get 'posts/:id/answers/new' do

# end

post '/posts/:id/answers' do
  if request.xhr?
    @answer = Answer.create(content: params[:description], post_id: params[:id])
  end
   erb :"answers/_show", layout: false
end
