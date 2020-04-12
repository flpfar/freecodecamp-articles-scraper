# freeCodeCamp Articles Scraper

> This is a [freeCodeCamp.org](https://www.freecodecamp.org/news/) articles scraper, created to practice data mining from websites in Ruby.

![screenshot](/images/screenshot.png)

This Scraper gets data from first pages of freeCodeCamp.org, loading every articles title, author and tag. This data is manipulated to obtain information like authors that published more articles recently and most used tags.

## Built With

- Ruby
- HTTParty (requests)
- Nokogiri (html parsing)
- Byebug (debugging)
- RSpec (tests)
- Rubocop (linter)

## Getting started

### Prerequisites
- To run this project, you must have **Ruby** installed (you can get it [here](https://www.ruby-lang.org/pt/documentation/installation/)).
- To test the methods you need to install **RSpec**: `$ gem install rspec`

### Setup
- Clone this repository to your local machine or download the files.
- Run `$ bundle install` to install gem dependencies.

### Usage
- Navigate to the project folder.
- Run the following command on terminal:
   ```
   $ ./bin/main.rb
   ```

- To run the specs for this project, use the following command.
   ```
   $ rspec -f d
   ```

- To adjust the number of pages for scraping, change the argument in `Scraper.scrap(numberOfPagesToScrap)`. The current value is 20 (which gets the 500 latest articles), and if there is no argument, the default value is 10. PS: Try not to insert a big value here, it is not cool to overload freecodecamp.org with our requests.
   ```
   articles = Scraper.scrap(20)  # line 20 of main.rb
   ```

- To change the number of results filtered, change the argument value when calling methods from Filter class. If there is no second argument, it returns all results.

### User Interface
- After runing the application, choose one of the options displayed in the panel. It loops until 'Exit' option is taken.

   ```
    [=====================( Options Available )======================]

    1. List top 10 cover tags from articles
    2. List top 10 most published authors
    3. List last 25 articles
    4. List all cover tags from articles
    5. List all loaded articles title
    6. Exit

    >> Choose an option: 
   ``` 

## 👤 Author 

- Github: [@flpfar](https://github.com/flpfar)
- Twitter: [@flpfar](https://twitter.com/flpfar)
- Linkedin: [Felipe Augusto Rosa](https://www.linkedin.com/in/felipe-augusto-rosa-7b96a4b1)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!
Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

All data gathered here came from [freeCodeCamp.org](https://www.freecodecamp.org/news/) website and is used only for study. When using this project, please avoid creating many requests on their server.