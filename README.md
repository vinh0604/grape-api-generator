# Grape API Generators

A collection all Rails generator scripts for Grape.

## Getting started

Add this line to your Rails application's Gemfile:

```ruby
gem 'grape-api-generator'
```

Then run `bundle` command to install it.

After you installed the gem, you could run the install generator to generate basic `MyApp` API structure:

    rails generate grape:install my_app

You could also specify the API version and authentication model in the generator:

    rails generate grape:install my_app --version 2 --model_name customer

## Scaffolding new resource

To scaffold a resource API, e.g. `Post`

    rails generate grape:scaffold my_app post

It will create the resource API, entity and spec/test files.

You could also specify list of attributes for the resource API:

    rails generate grape:scaffold my_app post title:string:r content published_at:date_time

It will expose `tilte`, `content` and `published_at` in the entity as well as define the params list as following:

```ruby
requires :title, type: String
optional :content, type: String
optional :published_at, type: DateTime
```


## Contributing

1. Fork it ( https://github.com/vinh0604/grape-api-generator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
