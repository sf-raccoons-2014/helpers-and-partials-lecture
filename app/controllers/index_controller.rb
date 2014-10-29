get '/articles' do
  @articles = Article.all
  erb :articles
end

post '/articles' do
  Article.create(params)
end

get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :article 
end
