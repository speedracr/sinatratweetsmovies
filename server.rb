require 'sinatra'
require 'sinatra/reloader'
require_relative './twittertools'
require_relative './500pxtools'
require_relative './moviedbtools'

set :server, 'webrick'

# display form
get '/' do
	erb :entry
end


# take formresults
get '/results' do

	# get movie information: ID, title and backdrop from TMDb
	@img_id 	= get_movie_id(params[:movietitle])
	@movietitle = get_title_from_search(params[:movietitle])
	@img_url 	= get_backdrop_from_search(params[:movietitle])

	# take title as basis for twitter search
	@tweet 	= get_tweets_for_search(@movietitle.to_s)

	# query Rotten Tomatoes for rating

	erb :results
end

# route static template
get '/test' do
	erb :test
end