require 'themoviedb'

Tmdb::Api.key("32a27634469553764d23ed05404d3135")

# Configuration for image file path
configuration = Tmdb::Configuration.new
$base_url = configuration.base_url
$poster_size = configuration.backdrop_sizes.last

# Construct the image url by passing in filepath
def createurl(filepath)
	url = base_url + "original" + filepath
	puts url
end

# Look up movie by title and return tmdb ID
def get_movie_id(searchterm)
	@search 	= Tmdb::Search.new
	@search.resource('movie') # determines type of resource
	@search.query(searchterm) # the query to search against
	result 		= @search.fetch # makes request
	movie_id 	= result.first['id']
	puts movie_id
	movie_id
end


# Rewrite function as separate items
def tmdbfirstresult(searchterm)
	@search 	= Tmdb::Search.new
	@search.resource('movie') # determines type of resource
	@search.query(searchterm) # the query to search against
	result 		= @search.fetch # makes request
	firstresult = result.first
end

def get_id_from_search(searchterm)
	movie_id 	= tmdbfirstresult(searchterm)['id']
	puts movie_id
end

def get_title_from_search(searchterm)
	movie_title = tmdbfirstresult(searchterm)['title']
end

def get_backdrop_from_search(searchterm)
	movie_backdroppath = tmdbfirstresult(searchterm)['backdrop_path']
	backdropurl = $base_url + "original" + movie_backdroppath
end	

# redundant
# def get_url_from_search(searchterm)
# 	backdrop_path 	= get_backdrop_from_search(searchterm)
# 	url 			= createurl(backdrop_path)
# 	puts url
# end	