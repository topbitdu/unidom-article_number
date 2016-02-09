# Unidom Article Number 物品编码领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-article_number.svg)](https://badge.fury.io/rb/unidom-article_number)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Article Number domain model engine includes EAN-13, EAN-8, and IMEI models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。物品编码领域模型引擎包括EAN-13、EAN-8和IMEI的模型。

## Usage in Gemfile:
```ruby
gem 'unidom-article_number'
```

## Run the Database Migration:
```shell
rake db:migrate
```

## Call the Model:
```ruby
Unidom::ArticleNumber::Ean13Barcode.coded_as('1234567890123').valid_at.alive.first.markings
```
