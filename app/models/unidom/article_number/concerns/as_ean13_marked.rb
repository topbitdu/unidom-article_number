module Unidom::ArticleNumber::Concerns::AsEan13Marked

  extend ActiveSupport::Concern

  include Unidom::ArticleNumber::Concerns::AsMarked

  included do |includer|

    has_many :ean13_barcodes, through: :markings, source: :barcode, source_type: 'Unidom::ArticleNumber::Ean13Barcode'

  end

end
