class Filter
  class << self
    def filter_tags(articles, number_of_articles); end

    def filter_authors(articles, number_of_articles); end

    def filter_articles(articles, number_of_articles = nil)
      return [] if articles.size.zero?

      number_of_articles = articles.size if number_of_articles.nil? || number_of_articles > articles.size
      filtered = []
      index = 0
      number_of_articles.times do
        filtered.push(articles[index][:title])
        index += 1
      end
      filtered
    end
  end
end
