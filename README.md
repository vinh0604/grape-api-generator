# Grape API Generators

A collection all Rails generator scripts for Grape.

## Getting started

Add this line to your Rails application's Gemfile:

```ruby
gem 'grape-api-generator'
```

Then run `bundle` command to install it.

After you installed the gem, you could run the generator to generate your Grape API skeleton:

    rails generate grape:install

You could also specify the API version and authentication model in the generator:

    rails generate grape:install --version 2 --model_name customer

## Todo

- Add generator for API resource (similar to Rails scaffolding).
- Generate test/spec files.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/grape-api-generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
