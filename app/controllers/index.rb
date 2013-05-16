get '/' do
  erb :index
end

post '/login' do
  email = params[:email].downcase
  password = params[:password]
  user = User.find_or_create_by_email_and_password(email, password)
  session[:id] = user.id
  redirect '/blog'
end

get '/blog/:username' do
  user = User.where("email like ?", "#{params[:username]}%")
  @user_posts = Post.where(:user_id => user[0].id)
  erb :user_posts
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/blog' do
  redirect '/' if session[:id].nil?
  @user = User.find_by_id(session[:id])
  p @posts = Post.where(:user_id => session[:id])
  erb :blog
end

get "/all_blogs" do
  redirect '/' if session[:id].nil?
  @all_posts = Post.all
  erb :all_posts
end

get "/post" do
  redirect '/' if session[:id].nil?
  erb :post
end

post "/post" do
  user = User.find_by_id(session[:id])
  Post.create(:title => params[:title], :body => params[:body], :author => user.email, :user_id => session[:id] )
  redirect "/blog"
end
