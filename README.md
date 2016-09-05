# StringObfuscator [![CircleCI](https://circleci.com/gh/wealthsimple/string-obfuscator.svg?style=svg)](https://circleci.com/gh/wealthsimple/string-obfuscator) [![](https://img.shields.io/gem/v/string-obfuscator.svg)](https://rubygems.org/gems/string-obfuscator)

Ruby utility for obfuscating strings, with no dependencies.

Example usage - obfuscating by length from the right:

```ruby
StringObfuscator.obfuscate("Hello? It's me, Danilo", length: 6, from: :right)
=> "Hello? It's me, ******"
```

Example usage - obfuscating by percent, custom obfuscation character:

```ruby
StringObfuscator.obfuscate("Hello? It's me, Danilo", percent: 50, obfuscation_character: "#")
=> "########### me, Danilo"
```

Example usage - custom obfuscation value:

```ruby
StringObfuscator.obfuscate("Hello? It's me, Danilo", percent: 20, obfuscation_value: "[obfuscated]")
=> "[obfuscated]? It's me, Danilo"
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

Bug reports and pull requests are welcome on GitHub at https://github.com/wealthsimple/string-obfuscator.
