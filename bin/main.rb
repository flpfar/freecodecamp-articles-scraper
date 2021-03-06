#!/usr/bin/env ruby
require_relative '../lib/scraper'
require_relative '../lib/filter'
require_relative '../lib/outputformatter'
require_relative '../lib/stringpainter'

def option_valid?(option)
  return false unless option.between?(1, 6)

  @option = option
  true
end

puts '=================================================================='.reverse_color.bold
puts '===========< Welcome to FreeCodeCamp Articles Scraper >==========='.reverse_color.bold
puts '=================================================================='.reverse_color.bold
puts "\n"
puts 'Loading the lastest articles, please wait...'

articles = Scraper.scrap(20)

abort("\nWe couldn't load any article. Try again later.\n\n".bold + 'Application aborted.') if articles.size.zero?

puts "\n"
puts "Loading completed! Articles loaded: #{articles.size.to_s.reverse_color}".green.bold

loop do
  puts "\n"
  puts "\n"
  puts '[=====================( Options Available )======================]'.bold
  puts ''
  puts '1. List top 10 cover tags from articles'
  puts '2. List top 10 most published authors'
  puts '3. List last 25 articles'
  puts '4. List all cover tags from articles'
  puts '5. List all loaded articles title'
  puts '6. Exit'

  print "\n>> Choose an option: ".bold
  print 'Invalid option. Try again: ' until option_valid?(gets.chomp.to_i)

  case @option
  when 1 then results = Filter.filter_tags(articles, 10)
  when 2 then results = Filter.filter_authors(articles, 10)
  when 3 then results = Filter.filter_articles(articles, 25)
  when 4 then results = Filter.filter_tags(articles)
  when 5 then results = Filter.filter_articles(articles)
  when 6
    puts "\n\nClosing application... See you!"
    break
  end
  puts "\n" + OutputFormatter.format(results)

  print "\n>> Press 'Enter' to continue... ".bold
  gets.chomp
end
