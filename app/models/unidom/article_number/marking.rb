# Marking 是条码和物品的标记关系。

class Unidom::ArticleNumber::Marking < ActiveRecord::Base

  self.table_name = 'unidom_markings'

  belongs_to :barcode, polymorphic: true
  belongs_to :marked,  polymorphic: true
  belongs_to :marker,  polymorphic: true

  scope :barcode_is, ->(barcode) { where barcode: barcode }
  scope :marked_by,  ->(marker)  { where marker:  marker  }
  scope :marked_is,  ->(marked)  { where marked:  marked  }

end
