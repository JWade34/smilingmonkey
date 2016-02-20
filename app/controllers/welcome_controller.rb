class WelcomeController < ApplicationController
  require 'httparty'

  def initialize
    @my_api_key = ENV["LYRICS_N_MUSIC_API_KEY"]
  end

  def index
    # artist = params[:artist]
    artist =     ["beyonce","jayz","metallica","adele","bieber","taylor%20swift","drake","michael%20jackson","james%20taylor","jimmy%20buffett"].sample
    url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}"
    @response = HTTParty.get(url)
    # @response.parsed_response[0..20].sample["snippet"][0..9]
    @lyrics = @response.parsed_response[0..10].sample
  end

end
