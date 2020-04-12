require_relative '../lib/scraper.rb'
require_relative '../lib/filter.rb'
require 'byebug'

describe Filter do
  before(:all) { @articles = Scraper.scrap(2) }

  describe '.filter_tags returns a hash' do
    it 'with 10 items' do
      expect(Filter.filter_tags(@articles, 10).size).to eq(10)
    end

    it 'which all values are Integers' do
      expect(Filter.filter_tags(@articles, 10).values).to all(be_a(Integer))
    end
  end

  describe '.filter_authors returns a hash' do
    it 'with 10 items' do
      expect(Filter.filter_authors(@articles, 10).size).to eq(10)
    end

    it 'which all elements have a subhash with a :profile key' do
      expect(Filter.filter_authors(@articles, 10).values).to all(have_key(:profile))
    end

    it 'which all elements have a subhash with a :count key' do
      expect(Filter.filter_authors(@articles, 10).values).to all(have_key(:count))
    end
  end

  describe '.filter_articles returns an array' do
    it 'with 10 items' do
      expect(Filter.filter_articles(@articles, 10).size).to eq(10)
    end

    it 'which all elements are Strings' do
      expect(Filter.filter_articles(@articles, 10)).to all(be_a(String))
    end
  end
end
