# EAN-8 Barcode 是8位条形码。
# https://en.wikipedia.org/wiki/EAN-8

class Unidom::ArticleNumber::Ean8Barcode < Unidom::ArticleNumber::ApplicationRecord

  RESTRICTED_DISTRIBUTION_GS1_PREFIXES = (('020'..'029').to_a + ('040'..'049').to_a + ('200'..'299').to_a).freeze

  self.table_name = 'unidom_ean_8_barcodes'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::ArticleNumber::Concerns::AsBarcode

  validates :code,           uniqueness: true,                  numericality: { only_integer: true }
  validates :gs1_prefix,     presence: true, length: { is: 3 }, numericality: { only_integer: true }
  validates :item_reference, presence: true, length: { is: 4 }, numericality: { only_integer: true }
  validates :check_digit,    presence: true, length: { is: 1 }, numericality: { only_integer: true }

  def code=(code)
    code = code.to_s
    write_attribute :code, code
    if code.present?
      write_attribute :gs1_prefix,     code[0..2]
      write_attribute :item_reference, code[3..6]
      write_attribute :check_digit,    code[7]
    end
  end

  def restricted_distribution?
    self.class::RESTRICTED_DISTRIBUTION_GS1_PREFIXES.include? gs1_prefix
  end

end
