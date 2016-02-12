class BookmarkManager < Sinatra::Base

  delete '/logout' do
    flash[:goodbye] = "Goodbye #{current_user.name}"
    session.clear
    redirect '/links'
  end

  get '/users/login' do
    erb :login
  end

  post '/users/login' do
    user = User.first(email: params[:email])
    session[:user_id] = user.authenticate(params[:password]) if user
    if session[:user_id]
      redirect('/links')
    else
      redirect('/users/login')
    end
  end

end
