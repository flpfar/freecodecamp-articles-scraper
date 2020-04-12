require_relative './stringpainter.rb'
require_relative './typetester.rb'
require 'byebug'
class OutputFormatter
  class << self
    def format(results)
      return [] if results.empty?

      type = TypeTester.get_type(results)
      case type
      when :tag
        formatted_output = format_tags(results)
      when :author
        formatted_output = format_authors(results)
      when :article
        formatted_output = format_articles(results)
      else
        Warning.warn "Invalid input (expects a list of tags, authors or articles)\n"
        formatted_output = ''
      end
      formatted_output
    end

    private

    def format_tags(results)
      formatted = '#    Tag                                               | Articles '.green.bold
      results.each_with_index do |result, index|
        formatted += "\n#{index + 1}.".ljust(6)
        formatted += result[0].to_s.ljust(50)
        formatted += '| ' + result[1].to_s.center(8)
      end
      formatted += "\n"
    end

    def format_authors(results)
      formatted = '#    Author                                            | Articles | Profile'.green.bold
      results.each_with_index do |result, index|
        name = result[0].to_s
        articles = result[1][:count].to_s
        profile = result[1][:profile]
        formatted += "\n#{index + 1}.".ljust(6)
        formatted += name.ljust(50)
        formatted += '| ' + articles.center(8) + ' '
        formatted += '| ' + profile
      end
      formatted += "\n"
    end

    def format_articles(results)
      formatted = '#    Articles'.green.bold
      results.each_with_index do |result, index|
        formatted += "\n#{index + 1}.".ljust(6)
        formatted += result
      end
      formatted += "\n"
    end
  end
end
