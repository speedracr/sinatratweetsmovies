# need to disable OpenSSL verification for local machine / Win 7
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'twitter'

$twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "BnigFA98IcTCsMex99YUA"
  config.consumer_secret = "d911m2iqTbCc0ZjsPWElwHudS1OGC3ZAxtmdY0mVtwE"
end

# do a search
def twittersearch(searchterm)
	$twitter_client.search(searchterm, :result_type => "recent")
end

def twittersearchresults(searchterm)
	twittersearch(searchterm).take(10).map { |result| result.text }
end	 

#get a user's tweet
def usertimeline(username)
	$twitter_client.user_timeline(username)
end

# Expand the scope so that Sinatra can use the $twitter_client
$twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "BnigFA98IcTCsMex99YUA"
  config.consumer_secret = "d911m2iqTbCc0ZjsPWElwHudS1OGC3ZAxtmdY0mVtwE"
end


# User timeline functions
def get_timeline(username)
	$twitter_client.user_timeline(username)
end	

# Get user information
def get_user(username)
	$twitter_client.user(username)
end	


def get_tweet_for_username(username)
	get_timeline(username).first.text
end

def get_tweets(username)
	get_timeline(username).take(5).map do |result|
	result.text
	end
end

# Search term functions
def get_searchresults(searchterm)
	$twitter_client.search(searchterm, :result_type => "recent")
end

def get_tweets_for_search(searchterm)
	get_searchresults(searchterm).take(4).map { |result| result.text }
end