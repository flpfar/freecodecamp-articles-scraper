require_relative '../lib/scraper.rb'
require_relative '../lib/filter.rb'

describe Filter do
  before(:all) { @articles = Scraper.scrap(2) }

  describe '.filter_tags returns an array' do
    it 'with 10 items' do
      expect(Filter.filter_tags(@articles, 10).size).to eq(10)
    end

    it 'of hashes' do
      expect(Filter.filter_tags(@articles, 10)).to all(be_a(Hash))
    end
  end

  describe '.filter_authors returns an array' do
    it 'with 10 items' do
      expect(Filter.filter_authors(@articles, 10).size).to eq(10)
    end

    it 'of hashes' do
      expect(Filter.filter_authors(@articles, 10)).to all(be_a(Hash))
    end
  end

  describe '.filter_articles returns an array' do
    it 'with 10 items' do
      expect(Filter.filter_articles(@articles, 10).size).to eq(10)
    end

    it 'of Strings' do
      expect(Filter.filter_articles(@articles, 10)).to all(be_a(String))
    end
  end
end
