require_relative '../lib/stringpainter'

def option_valid?(option)
  return false unless option.to_i.between?(1, 6)

  @option = option
  true
end

puts '=================================================================='.reverse_color.bold
puts '===========< Welcome to FreeCodeCamp Articles Scraper >==========='.reverse_color.bold
puts '=================================================================='.reverse_color.bold
puts "\n"
puts 'Loading the lastest articles, please wait...'
puts "\n"
puts "Loading completed! Articles loaded: #{225.to_s.reverse_color}".green.bold
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
print 'Invalid option. Try again: ' until option_valid?(gets.chomp)
