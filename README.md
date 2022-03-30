# BootstrapHelpers

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bootstrap_helpers`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bootstrap_helpers'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bootstrap_helpers

## Usage

TODO: Write usage instructions here

## Configuration

You can configure some settings in the usual way

```rb
BootstrapHelper.configure do |config|
  config.equivalents # see gem for example of structure
  config.sizes # array of bootstrap breakpoints to process
  config.excluded_attributes # attributes to exclude from option processing. Take great care
end
```
