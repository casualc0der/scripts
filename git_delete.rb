# Grab your a token with `delete_repos` privileges from github
API_TOKEN = 'API_TOKEN_GOES_HERE'
# Add all the repos you want to delete here
# tip: use the githuib cli to get a list of repos easily!
repos = %w[
  githubusername/reponame
  githubusername/reponame
  githubusername/reponame
  githubusername/reponame
  githubusername/reponame
  githubusername/reponame
]                 

require 'net/http'
require 'uri'

repos.each do |repo_name|
  # I sleep for 1 seconds so as not to ping GH too quickly ❤️
  sleep 1
  uri = URI.parse("https://api.github.com/repos/#{repo_name}")
  request = Net::HTTP::Delete.new(uri)
  request["Authorization"] = "token #{API_TOKEN}"

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  puts response.code
end


