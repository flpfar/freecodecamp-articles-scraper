require 'httparty'
require 'nokogiri'

class Scraper
  class << self
    def scrap(pages = 10)
      @base_url = 'https://www.freecodecamp.org'
      articles = []
      page = 1

      pages.times do
        url = @base_url + "/news/page/#{page}/"
        doc = HTTParty.get(url)
        break unless doc.code == 200 && !doc.body.nil? && !doc.body.empty?

        parsed_html = Nokogiri::HTML(doc)
        articles_html = parsed_html.css('.post-card-content')
        articles += extract_from_html(articles_html)
        page += 1
      end
    end

    private

    def extract_from_html(articles_html)
      articles = []
      articles_html.each do |article_html|
        author_name = article_html.css('a.meta-item').text.strip
        author_profile = author_name == '' ? '' : @base_url + article_html.css('a.meta-item').attribute('href').value

        article = {
          title: article_html.css('.post-card-title').text.strip,
          tag: article_html.css('.post-card-tags').text.strip,
          author: {
            name: author_name,
            profile: author_profile
          }
        }

        articles.push(article)
      end
      articles
    end
  end
end
