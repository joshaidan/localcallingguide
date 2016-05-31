# Ruby Wrapper for Local Calling Guide

This gem is a Ruby Wrapper for [Local Calling Guide](http://www.localcallingguide.com), a website for retrieving information on local calling, area codes and telephone prefixes for North America and other countries.

This gem is currently in pre-release form and is subject to constant changes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'localcallingguide'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install localcallingguide

## Usage

```ruby
require 'localcallingguide'
require 'pp'

pp LocalCallingGuide::LocalPrefix.prefixes(250, 423)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joshaidan/localcallingguide. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

