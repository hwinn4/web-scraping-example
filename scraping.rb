require 'nokogiri' # parse a site's source
require 'open-uri' # gives you return value of source code
require 'pry'

puts 'What song would you like to play?'

song_name = gets.chomp


# ruby will store this as a File object
# there are many methods you can call on a File object, including .read
document = open("https://www.youtube.com/results?search_query=#{song_name}").read 


# nokogiri can take an ugly file and make it more useful
# by formatting the data as hashes and arrays
noko_document = Nokogiri::HTML(document)

first_hit = noko_document.search('h3.yt-lockup-title a.yt-uix-sessionlink')

hits_link = first_hit.attr('href')

system("open https://www.youtube.com#{hits_link}")





