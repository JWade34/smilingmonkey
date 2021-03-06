class WelcomeController < ApplicationController
  require 'httparty'

  before_action :get_artist

    def initialize
      @my_api_key = ENV["LYRICS_N_MUSIC_API_KEY"]
      @artist
      @title
      @details
    end

    def index
      url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{@artist}&track=#{@title}"
      @response = HTTParty.get(url)
      @lyrics = @response.parsed_response[0]
    end

    private

    def get_artist
      if params[:artist].present? && params[:title].present?
        @artist = params[:artist]
        @title = params[:title]
      elsif params[:artist].present?
        @artist = params[:artist]
        @title = ""
      elsif params[:title].present?
        @title = params[:title]
        @artist = ""
      else
        @artist = ["beyonce","aretha%20franklin","beatles","adele","bieber","taylor%20swift","frank%20sinatra","michael%20jackson","james%20taylor","jimmy%20buffett","drake","jayz"].sample
        @title = ""
      end
    end

  # def initialize
  #   @my_api_key = ENV["LYRICS_N_MUSIC_API_KEY"]
  # end
  #
  # def index
  #   if
  #     params[:artist].present? && params[:title].present?
  #     artist = params[:artist]
  #     title = params[:title]
  #     url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}&track=#{title}"
  #     @response = HTTParty.get(url)
  #     @lyrics = @response.parsed_response[0]
  #   elsif
  #     params[:artist].present?
  #     artist = params[:artist]
  #     url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}"
  #     @response = HTTParty.get(url)
  #     @lyrics = @response.parsed_response[0..10].sample
  #   elsif
  #     params[:title].present?
  #     title = params[:title]
  #     url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&track=#{title}"
  #     @response = HTTParty.get(url)
  #     @lyrics = @response.parsed_response[0]
  #   else
  #     artist = ["beyonce","aretha%20franklin","beatles","adele","bieber","taylor%20swift","frank%20sinatra","michael%20jackson","james%20taylor","jimmy%20buffett"].sample
  #     url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}"
  #     @response = HTTParty.get(url)
  #     @lyrics = @response.parsed_response[0..10].sample
  #   end

  # end
end
