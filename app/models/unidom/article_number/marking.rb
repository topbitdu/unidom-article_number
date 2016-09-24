# Marking 是条码和物品的标记关系。

class Unidom::ArticleNumber::Marking < ActiveRecord::Base

  self.table_name = 'unidom_markings'

  include Unidom::Common::Concerns::ModelExtension

  belongs_to :barcode, polymorphic: true
  belongs_to :marked,  polymorphic: true
  belongs_to :marker,  polymorphic: true

  scope :barcode_is, ->(barcode) { where barcode: barcode }
  scope :marked_by,  ->(marker)  { where marker:  marker  }
  scope :marked_is,  ->(marked)  { where marked:  marked  }

  def self.mark!(barcode: nil, marked: nil, marker: nil, opened_at: Time.now)

    raise ArgumentError.new('The barcode argument is required.'  ) if barcode.blank?
    raise ArgumentError.new('The marked argument is required.'   ) if marked.blank?
    raise ArgumentError.new('The opened_at argument is required.') if opened_at.blank?

    query    = barcode_is(barcode).marked_is(marked).valid_at.alive
    creation = { opened_at: opened_at }
    if marker.present? && marker.respond_to?(:id)
      creation[:marker] = marker
    else
      creation[:marker_id]   = Unidom::Common::NULL_UUID
      creation[:marker_type] = ''
    end
    query.first_or_create! creation

  end

end
