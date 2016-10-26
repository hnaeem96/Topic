require "net/http"
require "uri"

class TumblrPosts
  attr_reader searched_term

  def initialize

  end

  def get_posts
    posts_array = []
    tumblr_url = "https://api.tumblr.com/v2/tagged?tag=#{searched_term}&api_key=#{tumblr_consumer_key}"
    uri = URI.parse(tumblr_url)
    response = Net::HTTP.get_response(uri)
    body = response.body
    body["response"].each do |post|
      posts_array << post["post_url"]
    end
  end
end
