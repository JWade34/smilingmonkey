# require 'HTTParty'
#
# class FetchLyrics
#
#   def self.initialize
#     @my_api_key = ENV["LYRICS_N_MUSIC_API_KEY"]
#   end
#
#   def self.make_api_call
#     if params[:artist].present?
#       artist = params[:artist]
#       url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}"
#       @response = HTTParty.get(url)
#       @lyrics = @response.parsed_response[0..10].sample
#       # params[:artist] = ""
#     else
#       artist = ["beyonce","aretha%20franklin","beatles","adele","bieber","taylor%20swift","frank%20sinatra","michael%20jackson","james%20taylor","jimmy%20buffett"].sample
#       url = "http://api.lyricsnmusic.com/songs?api_key=#{ENV["LYRICS_N_MUSIC_API_KEY"]}&artist=#{artist}"
#       @response = HTTParty.get(url)
#       @lyrics = @response.parsed_response[0..10].sample
#     end
#
#   end
# end
