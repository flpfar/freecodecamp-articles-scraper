require_relative '../lib/typetester.rb'

describe TypeTester do
  describe '.get_type' do
    context 'when the argument is a hash' do
      it 'returns :tag when all keys have an Integer as value' do
        tags = { "#Javascript": 5, "#Ruby": 3 }
        expect(TypeTester.get_type(tags)).to eq(:tag)
      end
      it 'returns :author when all elements have a subhash with :profile key' do
        authors = { "Daniel Wesego": { profile: 'https://www.freecodecamp.org/news/404/', count: 1 } }
        authors.merge({ "Maya Domste": { profile: 'https://www.freecodecamp.org/news/author/maya-domste/', count: 2 } })
        expect(TypeTester.get_type(authors)).to eq(:author)
      end
      it 'returns :invalid when type is not defined' do
        hash = { a: 'hey', b: 'you' }
        expect(TypeTester.get_type(hash)).to eq(:invalid)
      end
    end
    context 'when the argument is an Array' do
      it 'returns :article when all elements are Strings' do
        articles = ['How to Add JavaScript to Your Rails 6 App', 'How to Solve a System of Linear Equations']
        expect(TypeTester.get_type(articles)).to eq(:article)
      end
      it 'returns :invalid when type is not defined' do
        array = [1, 2, 3, 4, 5]
        expect(TypeTester.get_type(array)).to eq(:invalid)
      end
    end
    it 'returns :invalid when the argument is not an Array nor a Hash' do
      argument = 'Hello'
      expect(TypeTester.get_type(argument)).to eq(:invalid)
    end
  end
end
