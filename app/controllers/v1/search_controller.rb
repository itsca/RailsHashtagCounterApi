class V1::SearchController < ApplicationController
  def index
  end

  def show
    $twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = "k3AicykpMHfQuPmzThYuQWFwu"
      config.consumer_secret     = "b5hX14m8nLZkA9uCqy0qhXfZmHawHChJ8i50kcl95LLL58SaHs"
      config.access_token        = "95383237-0t7iM1EJourD89Bfod4LTfBWyRhGd8h8qfCDxqKq6"
      config.access_token_secret = "tI2bTZs8JE3Ia7bJDwbwsG59y9fyGBF89DZnBcsYklVxC"
    end
    @hashtagName = params[:id]
    @searchResults = []
    #@searchResults = $twitter.search("#" + @hashtagName + " -rt")
    @searchResults = $twitter.search("#" + @hashtagName).take(5001)
    render json: @searchResults.count(), status: :ok
  end
end
