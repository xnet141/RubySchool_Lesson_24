
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/about' do
	@error = 'something wrong!'
	erb :about
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
end

get '/something' do
	erb :something
end

get '/login' do
	erb :login
end

post '/contacts' do
	@email = params[:email]
	@textarea     = params[:textarea]
	f = File.open 'public/contacts.txt', 'a' #режим 'а' значит append, то есть добавить в конец файла
	f.write "\nemail: #{@email}, message: #{@textarea}<br>"
	f.close
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone     = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	if @username.length > 0 && @phone.length > 0 && @datetime.length > 0 && @barber.length > 0 && @color.length > 0 

		f = File.open 'public/user.txt', 'a' #режим 'а' значит append, то есть добавить в конец файла
		f.write "\nUser: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Barber: #{@barber}, Color: #{@color}<br>"
		f.close
		erb :visit

	else

		@error = 'Заполните все поля!!'
		erb :visit
	end	
end

post '/login' do
	@userlogin = params[:userlogin]
	@password = params[:password]
	if @userlogin == 'admin' && @password == 'secret'
		erb :secret
	else
		erb :login
	end
end
