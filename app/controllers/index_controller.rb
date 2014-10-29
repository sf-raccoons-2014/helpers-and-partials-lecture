get '/articles' do
  
  @articles = Article.all
  erb :index
end

get '/articles/:id' do
  
end
