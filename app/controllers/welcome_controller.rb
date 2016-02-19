class WelcomeController < ApplicationController
  require 'httparty'

  def initialize
    @my_api_key = ENV["LYRICS_N_MUSIC_API_KEY"]
  end

  def index
    url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=coldplay"
    @response = HTTParty.get(url)
    @response.parsed_response
  end

end
