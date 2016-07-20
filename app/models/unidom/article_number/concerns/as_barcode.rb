module Unidom::ArticleNumber::Concerns::AsBarcode

  extend ActiveSupport::Concern

  self.included do |includer|

    has_many :markings,        class_name: 'Unidom::ArticleNumber::Marking', as:     :barcode
    has_many :marked_products, through:    :markings,                        source: :marked, source_type: 'Unidom::Product::Product'

  end

end
