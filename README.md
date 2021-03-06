# Unidom Article Number 物品编码领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-article_number/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-article_number.svg)](https://badge.fury.io/rb/unidom-article_number)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-accession.svg)](https://gemnasium.com/github.com/topbitdu/unidom-accession)

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
ean_13_barcode = Unidom::ArticleNumber::Ean13Barcode.create! code: '1234567890123'
ean_8_barcode  = Unidom::ArticleNumber::Ean8Barcode.create!  code: '12345678'
marked         = Unidom::Product::Product.create! name: 'Chocolate', abbreviation: 'Choc', packing_norm: '12 blocks', measurement_unit: 'box'
marker         = Unidom::Party::Person.create!    name: 'John'
ean_13_marking = Unidom::ArticleNumber::Marking.mark! barcode: ean_13_barcode, marked: marked, marker: marker, opened_at: Time.now
ean_8_marking  = Unidom::ArticleNumber::Marking.mark! barcode: ean_8_barcode,  marked: marked, marker: marker, opened_at: Time.now

vin       = Unidom::ArticleNumber::VehicleIdentificationNumber.create! code: 'LVHCU165XD5002138'
# The Vehicle Identification Number Validator is enabled on the code field by default.
found_vin = Unidom::ArticleNumber::VehicleIdentificationNumber.coded_as('LVHCU165XD5002138').first
```



## Include the Concern

```ruby
include Unidom::ArticleNumber::Concerns::AsBarcode
include Unidom::ArticleNumber::Concerns::AsMarked
include Unidom::ArticleNumber::Concerns::AsEan13Marked
include Unidom::ArticleNumber::Concerns::AsEan8Marked
```

### As Barcode concern

The As Barcode concern do the following tasks for the includer automatically:
1. Define the has_many :markings macro as: ``has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :barcode``
2. Define the #mark! method as: ``mark!(marked, by: nil, at: Time.now)``
3. Define the #mark? mathod as: ``mark?(marked, at: Time.now)``

### As Marked concern

The As Marked concern do the following tasks for the includer automatically:
1. Define the has_many :markings macro as: ``has_many :markings, class_name: 'Unidom::ArticleNumber::Marking', as: :marked``
2. Define the #is_marked! method as: ``is_marked!(as: nil, by: nil, at: Time.now)``
3. Define the #is_marked? method as: ``is_marked?(as: nil, at: Time.now)``

### As EAN-13 Marked concern

The As EAN-13 Marked concern do the following tasks for the includer automatically:
1. Include the As Marked concern
2. Define the has_many :ean13_barcodes macro as: ``has_many :ean13_barcodes, through: :markings, source: :barcode, source_type: 'Unidom::ArticleNumber::Ean13Barcode'``

### As EAN-8 Marked concern

The As EAN-8 Marked concern do the following tasks for the includer automatically:
1. Include the As Marked concern
2. Define the has_many :ean8_barcodes macro as: ``has_many :ean8_barcodes, through: :markings, source: :barcode, source_type: 'Unidom::ArticleNumber::Ean8Barcode'``



## Validator

### Vehicle Identification Number validator

```ruby
validates :vin, presence: true, 'unidom/article_number/vehicle_identification_number': true
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::ArticleNumber
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/article_number/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/article_number/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/article_number/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# The Unidom::ArticleNumber::Ean13Barcode model, the Unidom::ArticleNumber::Ean8Barcode model, & the Unidom::ArticleNumber::VehicleIdentificationNumber model already include the Unidom::ArticleNumber::Concerns::AsBarcode concern

# app/models/your_barcode.rb
class YourBarcode < ActiveRecord::Base

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::ArticleNumber::Concerns::AsBarcode

end

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/article_number/rspec_shared_examples'

# spec/models/your_barcode_spec.rb
describe YourBarcode do

  model_attribtues = {
    code: 'AABBCCDDEEFF'
  }

  it_behaves_like 'Unidom::ArticleNumber::Concerns::AsBarcode', model_attribtues

end
```
