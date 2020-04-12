require_relative '../lib/outputformatter.rb'

describe OutputFormatter do
  describe '.format' do
    it 'returns an empty string when the argument is invalid' do
      argument = 'Hello'
      expect(OutputFormatter.format(argument)).to eq('')
    end
    context 'when the argument is valid' do
      it 'returns a formatted string with all tags when argument is a hash of tags' do
        tags = { "#Javascript": 5, "#Ruby": 3, "#Beginner": 2 }
        result = "\e[1m\e[32m#  Tag                                               | Articles \e[0m\e[22m"
        result += "\n1. #Javascript                                       |    5    "
        result += "\n2. #Ruby                                             |    3    "
        result += "\n3. #Beginner                                         |    2    \n"
        expect(OutputFormatter.format(tags)).to eq(result)
      end
      it 'returns a formatted string with all authors when argument is a hash of authors' do
        authors = { "Daniel Wesego": { profile: 'https://www.freecodecamp.org/news/404/', count: 1 } }
        authors.merge!({ "Alexander": { profile: 'https://www.freecodecamp.org/news/author/alex/', count: 2 } })

        result = "\e[1m\e[32m#  Author                                            | Articles | Profile\e[0m\e[22m"
        result += "\n1. Daniel Wesego                                     |    1     | https://www.freecodecamp.org/news/404/"
        result += "\n2. Alexander                                         |    2     | "
        result += "https://www.freecodecamp.org/news/author/alex/\n"
        expect(OutputFormatter.format(authors)).to eq(result)
      end
      it 'returns a formatted string with all articles when argument is an array of articles' do
        articles = ['How to Add JavaScript to Your Rails 6 App', 'How to Solve a System of Linear Equations']
        result = "\e[1m\e[32m#  Articles\e[0m\e[22m"
        result += "\n1. How to Add JavaScript to Your Rails 6 App"
        result += "\n2. How to Solve a System of Linear Equations\n"
        expect(OutputFormatter.format(articles)).to eq(result)
      end
    end
  end
end
