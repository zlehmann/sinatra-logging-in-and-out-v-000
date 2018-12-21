require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params['username'], password: params['password'])
    if @user == nil
      erb :error
    else
      session[:user_id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do
    @user = Helpers.current_user
    @is_logged_in = Helpers.is_logged_in?
    if @is_logged_in == false
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
