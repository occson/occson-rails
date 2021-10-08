# OCCSON

Store, manage and deploy Rails configuration securely with Occson.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'occson-rails'
```

And then execute:
```bash
$ bundle
```

## Usage
Use occson rails engine in two simple steps:

1. Define application version in `config/application.rb`

```ruby
module Dummy
  VERSION = "0.1.0"

  class Application < Rails::Application
  end
end
```

2. Create `.env` file with occson related environment variables

```
OCCSON_ACCESS_TOKEN=[ACCESS_TOKEN]
OCCSON_PASSPHRASE=[PASSPHRASE]
```

You can create `.env` file by environment eg.:

```
.env
.env.development
.env.development.local
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
