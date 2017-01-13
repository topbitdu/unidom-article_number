##
# As EAN-8 Marked 是被 EAN-8 条形码标注的物品的领域逻辑关注点。

module Unidom::ArticleNumber::Concerns::AsEan8Marked

  extend ActiveSupport::Concern

  include Unidom::ArticleNumber::Concerns::AsMarked

  included do |includer|

    has_many :ean8_barcodes, through: :markings, source: :barcode, source_type: 'Unidom::ArticleNumber::Ean8Barcode'

  end

  module ClassMethods
  end

end
