# AmazonBook

A handy class used to parse Amazon book links, extract normalized ISBN13 from them and decide whether they point to a book or some other content.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'amazon_book'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amazon_book

## Usage

```ruby
link = AmazonBook::Link.new('https://www.amazon.co.uk/dp/009957506X/')
# => #<AmazonBook::Link:0x007fd15515d7a8 @url="https://www.amazon.co.uk/dp/009957506X/">
link.book?
# => true
link.isbn13
# => "9780099575061"
```

### Long links are supported
```ruby
link = AmazonBook::Link.new('https://www.amazon.co.uk/Behave-Biology-Humans-Best-Worst-x/dp/009957506X/ref=sr_1_1?ie=UTF8&qid=150009226&sr=8-1&keywords=behave')
# => #<AmazonBook::Link:0x007fd15682c1f0 @url="https://www.amazon.co.uk/Behave-Biology-Humans-Best-Worst-x/dp/009957506X/ref=sr_1_1?ie=UTF8&qid=1502369566&sr=8-1&keywords=behave">
link.book?
# => true
link.isbn13
# => "9780099575061"
```

### Not a book
```ruby
link = AmazonBook::Link.new('https://www.amazon.co.uk/dp/B00JS905Z4')
# => #<AmazonBook::Link:0x007fd15682c1f0 @url="https://www.amazon.co.uk/dp/B00JS905Z4">
link.book?
# => false
```

### Different url type
```ruby
link = AmazonBook::Link.new('https://www.amazon.co.uk/o/ASIN/009957506X/')
# => #<AmazonBook::Link:0x007fd15682c1f0 @url="https://www.amazon.co.uk/o/ASIN/009957506X/">
link.book?
# => true
link.isbn13
# => "9780099575061"
```

### Different country
```ruby
link = AmazonBook::Link.new('https://www.amazon.co.jp/o/ASIN/009957506X/')
# => #<AmazonBook::Link:0x007fd15682c1f0 @url="https://www.amazon.co.jp/o/ASIN/009957506X/">
link.book?
# => true
link.isbn13
# => "9780099575061"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/altmetric/amazon_book.

## License

Copyright © 2017 Altmetric LLP

Distributed under the MIT License.
