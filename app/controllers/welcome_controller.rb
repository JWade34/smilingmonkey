class WelcomeController < ApplicationController
  require 'httparty'

  @my_api_key = @lyrics_api

  def index
    @lyrics_api = ENV["LYRICS_N_MUSIC_API_KEY"]

    url = 'To search for lyrics by all fields: http://api.lyricsnmusic.com/songs?api_key=[my_api_key]'
    @response = HTTParty.get(url)
    @response.parsed_response
  end

  def initialize(lyrics_api)
    @my_api_key = lyrics_api
  end

end
