# EAN-13 Barcode 是13位条形码。
# https://en.wikipedia.org/wiki/EAN-13
# https://en.wikipedia.org/wiki/International_Article_Number_(EAN)

class Unidom::ArticleNumber::Ean13Barcode < ActiveRecord::Base

  RESTRICTED_DISTRIBUTION_GS1_PREFIXES = (('020'..'029').to_a + ('040'..'049').to_a + ('200'..'299').to_a).freeze

  self.table_name = 'unidom_ean_13_barcodes'

  #validates :code,           presence: true, length: { is: self.columns_hash['code'].limit  }, numericality: { only_integer: true }, uniqueness: true
  validates :code,           uniqueness: true,                  numericality: { only_integer: true }
  validates :gs1_prefix,     presence: true, length: { is: 3 }, numericality: { only_integer: true }
  validates :company_number, presence: true, length: { is: 4 }, numericality: { only_integer: true }
  validates :item_reference, presence: true, length: { is: 5 }, numericality: { only_integer: true }
  validates :check_digit,    presence: true, length: { is: 1 }, numericality: { only_integer: true }

  has_many :markings, class_name: 'Unidom::ArticleNumber::Marking'

  include ::Unidom::Common::ModelExtension

  def code=(code)
    code = code.to_s
    write_attribute :code, code
    if code.present?
      write_attribute :gs1_prefix,     code[0..2]
      write_attribute :company_number, code[3..6]
      write_attribute :item_reference, code[7..11]
      write_attribute :check_digit,    code[12]
    end
  end

  def restricted_distribution?
    self.class::RESTRICTED_DISTRIBUTION_GS1_PREFIXES.include? gs1_prefix
  end

end
