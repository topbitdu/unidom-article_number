# Unidom Article Number 物品编码领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-article_number.svg)](https://badge.fury.io/rb/unidom-article_number)
[![Build Status](https://travis-ci.org/topbitdu/unidom-article_number.svg?branch=master)](https://travis-ci.org/topbitdu/unidom-article_number)
[![Build status](https://ci.appveyor.com/api/projects/status/fayn35r72oy5na3u?svg=true)](https://ci.appveyor.com/project/topbitdu/unidom-article-number)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Article Number domain model engine includes EAN-13, EAN-8, and IMEI models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。物品编码领域模型引擎包括EAN-13、EAN-8和IMEI的模型。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Usage in Gemfile
```ruby
gem 'unidom-article_number'
```

## Run the Database Migration
```shell
rake db:migrate
```
The migration versions start with 200201.

## Call the Model
```ruby
ean_13_barcode = Unidom::ArticleNumber::Ean13Barcode.create code: '1234567890123'
ean_8_barcode  = Unidom::ArticleNumber::Ean8Barcode.create  code: '12345678'
marked  = Product.create name: 'Chocolate'
marker  = Person.create  name: 'John'
ean_13_marking = Unidom::ArticleNumber::Marking.barcode_is(ean_13_barcode).marked_is(marked).first_or_create marker: marker, opened_at: Time.now
ean_8_marking = Unidom::ArticleNumber::Marking.barcode_is(ean_8_barcode).marked_is(marked).first_or_create marker: marker, opened_at: Time.now
```

## Include the Concern
```ruby
include Unidom::ArticleNumber::Concerns::AsBarcode
include Unidom::ArticleNumber::Concerns::AsMarked
```

### As Barcode concern
The As Barcode concern do the following tasks for the includer automatically:
1. Define the Has Many macro as: ``has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :barcode``

### As Marked concern
The As Marked concern do the following tasks for the includer automatically:
1. Define the Has Many macro as: ``has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :marked``
