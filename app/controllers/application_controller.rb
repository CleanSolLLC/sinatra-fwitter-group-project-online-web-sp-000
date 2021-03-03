require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'mission_impossible'
  end

  get '/' do
  	erb :'index'
  end

  helpers do
  	
  	def is_logged_in?(session)
  	  !!current_user(session)
  	end

  	def current_user(session)
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]	
  	end

  end

endlearneeeeee
