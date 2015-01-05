require 'sanitize'
require 'httparty'

initial_year = ARGV[0] || 1970
till = ARGV[1] || 2015 # Time.now.year
(initial_year..till).each do |year|
  puts "Jahr: #{year}"
  response = HTTParty.get "https://www.ris.bka.gv.at/GeltendeFassung.wxe?Abfrage=Bundesnormen&Gesetzesnummer=10000138&FassungVom=#{year}-01-01"
  content = Sanitize.clean(response.body)
  #puts content
  puts content.match(/(Artikel.7\..*?)\s*Art\.?(ikel)?.8/m)[1].strip
  puts "\n\n\n"
end

