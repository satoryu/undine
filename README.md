# Undine

[![Build Status](https://travis-ci.org/satoryu/undine.svg?branch=master)](https://travis-ci.org/satoryu/undine)

Undine is a gem to help your development experience: When an exception unrescued in your  code is raised, opens google search with the errror message in your browser.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'undine', group: :development
```

And then execute:

```sh
    bundle install
```

Or install it yourself as:

```sh
    gem install undine
```

## Usage

Just `require 'undine'` and `Undine.load`. That's it.

### Example

```ruby
require 'undine'

Undine.load

def something_function
  'hoge'.foo
rescue => e
  warn e.message
  raise e
end

something_function
```

`Undine.load` registers a post process to catch an unrescued exception and google its message.
In this code, `NoMethodError` raises as `String` does not have `foo` method.
As executing this code, you are going to see google search page with the error message: https://www.google.com/search?q=undefined+method+%60foo%27+for+%22hoge%22%3AString%0ADid+you+mean%3F++for

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satoryu/undine. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/satoryu/undine/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Undine project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/satoryu/undine/blob/master/CODE_OF_CONDUCT.md).
