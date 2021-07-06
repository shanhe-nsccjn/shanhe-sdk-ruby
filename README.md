# ShanHe::SDK

[![Build Status](https://travis-ci.org/yunify/qingcloud-sdk-ruby.svg?branch=master)](https://travis-ci.org/yunify/qingcloud-sdk-ruby)
[![Gem Version](https://badge.fury.io/rb/qingcloud-sdk.svg)](http://badge.fury.io/rb/qingcloud-sdk)
[![API Reference](http://img.shields.io/badge/api-reference-green.svg)](https://docsv3.shanhe.com/)
[![License](http://img.shields.io/badge/license-apache%20v2-blue.svg)](https://github.com/shanhe-nsccjn/shanhe-sdk-ruby/blob/master/LICENSE)

The official ShanHe SDK for Ruby programming language.

## Installation

This Gem uses Ruby's _keyword arguments_ feature, thus Ruby v2.1.5 or higher is
required.  See [this article](https://robots.thoughtbot.com/ruby-2-keyword-arguments)
for more details about _keyword arguments_.

### Install with Bundler

Specify `shanhe-sdk` as dependency in your application's Gemfile:

``` ruby
gem 'shanhe-sdk'
```

Ensure `shanhe-sdk` is installed as dependency with `bundle install`:

``` bash
$ bundle install
```

### Install from Source Code

Get code from GitHub:

``` bash
$ git clone git@github.com:shanhe-nsccjn/shanhe-sdk-ruby.git
```

Build and install with bundler:

``` bash
$ cd shanhe-sdk-ruby
$ bundle install
$ bundle exec rake install
```

### Uninstall

``` bash
$ gem uninstall shanhe-sdk
```

## Usage

### Notice
* API action name was mapped to ruby method.
* API parameter name was mapped to ruby method parameter.
* API optional parameter can be ignored when call ruby method.

___Example:___

``` ruby
Action: "DescribeInstances" -> "describe_instances"
Parameter: "zone" -> "zone: 'pek3a'"
Array Parameter: "instances.n" -> "instances: ['i-xxxxxxxx', ...]"
Map Parameter: "statics.n.static_type" -> "statics: [{val1: '', ...}, ...]"
```

### Prepare

Before your start, please go to [ShanHe Console](https://console.shanhe.com/access_keys/) to create a pair of ShanHe API keys.

___API AccessKey Example:___

``` yaml
qy_access_key_id: 'ACCESS_KEY_ID_EXAMPLE'
qy_secret_access_key: 'SECRET_ACCESS_KEY_EXAMPLE'
```

### Code Example

```ruby
require 'shanhe/sdk'

# Create a configuration from AccessKeyID and SecretAccessKey
config = ShanHe::SDK::Config.init ENV['ENV_ACCESS_KEY_ID'],
                                     ENV['ENV_SECRET_ACCESS_KEY']

# Initialize a ShanHe service with a configuration
shanhe_service = ShanHe::SDK::ShanHeService.new config

# Initialize service of Instance
instance = shanhe_service.instance 'pek3a'

# DescribeInstances
result = instance.describe_instances verbose: 1,
                                     limit:   5
# Print instances count
puts result[:total_count]

# RunInstances
result = instance.run_instances image_id:      'centos7x64b',
                                cpu:           1,
                                memory:        1024,
                                login_mode:    'keypair',
                                login_keypair: 'kp-xxxxxxxx'
# Print the job ID
puts result[:job_id]
```

### More Configuration

Except for AccessKeyID and SecretAccessKey, you can also configure the API servers for private cloud usage.

___Code Example:___

``` ruby
require 'shanhe/sdk'

# Load default configuration
config = ShanHe::SDK::Config.new.load_default_config

# Create with default value
config = ShanHe::SDK::Config.new({
  host:      'api.shanhe.dev',
  log_level: 'debug',
})

# Create a configuration from AccessKeyID and SecretAccessKey
config = ShanHe::SDK::Config.init ENV['ENV_ACCESS_KEY_ID'],
                                     ENV['ENV_SECRET_ACCESS_KEY']

# Load configuration from config file
config = ShanHe::SDK::Config.new
config = config.load_config_from_file '~/shanhe/config.yaml'

# Create configuration from AccessKey
config = ShanHe::SDK::Config.init 'ACCESS_KEY_ID',
                                     'SECRET_ACCESS_KEY'

# Change API server
config.update({host: 'api.shanhe.dev'})
```

___Default Configuration File:___

``` yaml
# ShanHe services configuration

qy_access_key_id: 'ACCESS_KEY_ID'
qy_secret_access_key: 'SECRET_ACCESS_KEY'

host: 'api.shanhe.com'
port: 443
protocol: 'https'
uri: '/iaas'
connection_retries: 3

# Valid log levels are "debug", "info", "warn", "error", and "fatal".
log_level: 'warn'
```

## Change Log
All notable changes to ShanHe SDK for Ruby will be documented here.

### 2.0.0-alpha.1 - 2017-03-05

#### Added

- ShanHe SDK for the Ruby programming language.

## Reference Documentations

- [ShanHe Documentation Overview](https://docsv3.shanhe.com)
- [ShanHe API](https://docsv3.shanhe.com/api/index.html)

## Contributing

1. Fork it ( https://github.com/shanhe-nsccjn/shanhe-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes (`git commit -asm 'Add some feature'`)
4. Push to the branch (`git push origin new-feature`)
5. Create a new Pull Request

## LICENSE

The Apache License (Version 2.0, January 2004).
