ENV['FOOD2FORK_KEY'] = "9eebd917c0af467c012a00b6338a1ddc"
class Recipe
	include HTTParty

	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: ENV['FOOD2FORK_KEY']
	format :json

	def Recipe.for term
		get("/search", query: {q: term})["recipes"]
	end
end