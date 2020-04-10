require 'httparty'
require 'nokogiri'
require 'byebug'

class Scraper
  class << self
    def scrap
      @base_url = 'https://www.freecodecamp.org'
      url = @base_url + "/news/page/#{1}/"
      articles = []
      doc = HTTParty.get(url)
      parsed_html = Nokogiri::HTML(doc)
      articles_html = parsed_html.css('.post-card-content')
      articles += extract_from_html(articles_html)

      byebug
    end

    private

    def extract_from_html(articles_html)
      articles = []
      articles_html.each do |article_html|
        article = {}
        article[:title] = article_html.css('.post-card-title').text.strip
        article[:tag] = article_html.css('.post-card-tags').text.strip
        article[:author] = {
          name: article_html.css('a.meta-item').text.strip,
          link: @base_url + article_html.css('a.meta-item').attribute('href').value
        }
        articles.push(article)
      end
      articles
    end
  end
end

Scraper.scrap