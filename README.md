# BetterDig

Another kind of hash/array lookup you'll like

## Table of Context

* [Installation](#installation)
* [Usage](#usage)
* [Contributing](#contributing)
* [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'better_dig'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install better_dig

## Usage

```ruby
hash = { hello: 'world', nested: { hello: 'world' }, nested_array: ['hello', 'world'] }

hash.digg(:hello)  # => 'world'
hash.digg('hello') # => 'world'
hash.digg('nested', 'hello') # => 'world'
hash.digg('nested_array', 0) # => 'hello'

# Since `nil` will be returned for not found value instead of exception,
# we can use conditional block now without breaking the application

if hash.digg(:nested, :hello, :world) # => nil
  # DO SOMETHING
else
  # DO SOMETHING
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/berniechiu/better_dig.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
