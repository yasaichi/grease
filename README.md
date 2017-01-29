# Grease

[![Gem Version](https://badge.fury.io/rb/grease.svg)](http://badge.fury.io/rb/grease)
[![Build Status](https://travis-ci.org/yasaichi/grease.svg?branch=master)](https://travis-ci.org/yasaichi/grease)
[![Code Climate](https://codeclimate.com/github/yasaichi/grease/badges/gpa.svg)](https://codeclimate.com/github/yasaichi/grease)
[![Test Coverage](https://codeclimate.com/github/yasaichi/grease/badges/coverage.svg)](https://codeclimate.com/github/yasaichi/grease/coverage)

Grease provides an adapter to use Tilt as extension of Sprockets 3 or later.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "grease"
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install grease
```

## Usage

If you'd like to use `Tilt::HamlTemplate` in Sprockets, add code like this:

```ruby
register_mime_type "text/haml", extensions: %w(.haml .html.haml)
register_transformer "text/haml", "text/html", Grease.apply(Tilt::HamlTemplate)
```

It works because `Grease.apply` returns a "callable" object.

## Contributing

You should follow the steps below.

1. [Fork the repository](https://help.github.com/articles/fork-a-repo/)
2. Create a feature branch: `git checkout -b add-new-feature`
3. Commit your changes: `git commit -am 'add new feature'`
4. Push the branch: `git push origin add-new-feature`
4. [Send us a pull request](https://help.github.com/articles/using-pull-requests/)

We use [Appraisal](https://github.com/thoughtbot/appraisal) to test with different versions of Sprockets.

```shell
bundle install
appraisal install

# Run rspec with a specific version of Sprockets
appraisal sprockets4 rspec

# Run rspec with all versions of Sprockets
appraisal rspec
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

