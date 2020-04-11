class Filter
  class << self
    def filter_tags(articles, number_of_tags = nil)
      return [] if articles.size.zero?

      tags = Hash.new(0)
      articles.each do |article|
        tags[article[:tag].to_sym] += 1
      end
      number_of_tags = tags.size if number_of_tags.nil? || number_of_tags > tags.size
      Hash[tags.sort_by { |_key, value| -value }[0..number_of_tags - 1]]
    end

    def filter_authors(articles, number_of_authors = nil)
      return [] if articles.size.zero?

      authors = Hash.new { |hash, key| hash[key] = { profile: '', count: 0 } }
      articles.each do |article|
        author_name = article[:author][:name].to_sym
        authors[author_name][:count] += 1
        authors[author_name][:profile] = article[:author][:profile]
      end
      number_of_authors = articles.size if number_of_authors.nil? || number_of_authors > articles.size
      Hash[authors.sort_by { |_key, value| -value[:count] }[0..number_of_authors - 1]]
    end

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
