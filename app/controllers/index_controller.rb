get '/articles' do
  @articles = Article.all
  erb :articles
end

post '/articles' do
  Article.create(params)
end

get '/articles/:id' do
  @article = Article.find(params[:id])
  redirect '/sessions/new' unless session[:user_id] == @article.user.id
  erb :article
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  
  session[:user_id] = @user.id if @user

  redirect '/articles'
end

