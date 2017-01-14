##
# As EAN-13 Marked 是被 EAN-13 条形码标注的物品的领域逻辑关注点。

module Unidom::ArticleNumber::Concerns::AsEan13Marked

  extend ActiveSupport::Concern

  include Unidom::ArticleNumber::Concerns::AsMarked

  included do |includer|

    has_many :ean13_barcodes, through: :markings, source: :barcode, source_type: 'Unidom::ArticleNumber::Ean13Barcode'

  end

  module ClassMethods
  end

end
