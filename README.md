# StringObfuscator [![CircleCI](https://circleci.com/gh/wealthsimple/string-obfuscator.svg?style=svg)](https://circleci.com/gh/wealthsimple/string-obfuscator)

Ruby utility for obfuscating strings, with no dependencies.

Example usage (default settings):

```ruby
StringObfuscator.obfuscate_by_percent("Hello? It's me, Danilo")
=> "*********** me, Danilo"
```

Example usage (with params):

```ruby
StringObfuscator.obfuscate_by_percent("Hello? It's me, Danilo",
  percent: 25,
  from: :right,
  obfuscation_character: "$",
)
=> "Hello? It's me, $$$$$$"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string-obfuscator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string-obfuscator

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/string-obfuscator.
