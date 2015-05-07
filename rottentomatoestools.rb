require 'badfruit'
$bf = BadFruit.new('54w74p3j3upe4a8qfqssnz8z')

# basic function
def get_movie_info(title)
	$movies = $bf.movies.search_by_name(title)
	$movie = $movies[0]	
	cast = $movie.full_cast
	reviews = $movie.reviews
	put $movie
end

# construct additional functions
def critics_score(title)
	critics_score = get_movie_info(title).scores.critics_score
	put critics_score
end

def get_movie(title)
	$movies = $bf.movies.search_by_name(title)
	$movie = $movies[0]
	put $movie
end	