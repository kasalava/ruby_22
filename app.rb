#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
erb :about
end

get '/visit' do
erb :visit
end 

	post '/visit' do
  		session[:identity] = params['username']
  		where_user_came_from = session[:previous_url] || '/'
  	redirect to where_user_came_from
	end

	get '/logout' do
  		session.delete(:identity)
  		erb "<div class='alert alert-message'>Logged out</div>"
	end

		get '/secure/place' do
  		erb 'This is a secret place that only <%=session[:identity]%> has access to!'
	end


get '/contacts' do
erb :contacts
end 