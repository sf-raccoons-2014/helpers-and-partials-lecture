get '/articles' do
  
  @articles = Article.all
  erb :index
end
