require_relative '../lib/scraper.rb'

describe Scraper do
  before(:all) { @scraped_info = Scraper.scrap(2) }

  describe '.scrap' do
    it 'returns an array of hashes which all contain a key :title' do
      expect(@scraped_info).to all(have_key(:title))
    end

    it 'returns an array of hashes which all contain a key :tag' do
      expect(@scraped_info).to all(have_key(:tag))
    end

    it 'returns an array of hashes which all contain a key :author' do
      expect(@scraped_info).to all(have_key(:author))
    end
  end
end
