module Unidom::ArticleNumber::Concerns::AsEan8Marked

  extend ActiveSupport::Concern

  include Unidom::ArticleNumber::Concerns::AsMarked

  included do |includer|

    has_many :ean8_barcodes, through: :markings, source: :barcode, source_type: 'Unidom::ArticleNumber::Ean8Barcode'

  end

end
