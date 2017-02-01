require 'rspec/models/unidom/article_number/marking_spec'                       unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::ArticleNumber::Marking'
require 'rspec/models/unidom/article_number/ean13_barcode_spec'                 unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::ArticleNumber::Ean13Barcode'
require 'rspec/models/unidom/article_number/ean8_barcode_spec'                  unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::ArticleNumber::Ean8Barcode'
require 'rspec/models/unidom/article_number/vehicle_identification_number_spec' unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::ArticleNumber::VehicleIdentificationNumber'
