class WelcomeController < ApplicationController
  require 'httparty'

  def initialize
    @my_api_key = ENV["LYRICS_N_MUSIC_API_KEY"]
  end

  def index
    artist = "jayz"
    url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}"
    @response = HTTParty.get(url)
    @response.parsed_response
  end

end
