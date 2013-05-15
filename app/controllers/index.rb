

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/urls' do
  @url = Url.create(:long_url => params[:long_url])
   if @url.valid?
     redirect "/url/#{@url.id}"
   else
    # p @url.errors[:long_url]
    # p @url.errors.messages[:long_url]
     @errors = @url.errors.messages[:long_url]
     erb :index
  end
end

get '/url/:url_id' do
  @url = Url.find_by_id(params[:url_id])
  erb :shortened_url
end

# e.g., /q6bda
get '/:short_url' do
  desired_destination = Url.find_by_short_url(params[:short_url])
  p desired_destination.counter
  @count = desired_destination.counter + 1
  desired_destination.update_attributes(:counter => @count)
  redirect "http://#{desired_destination.long_url}"
end






