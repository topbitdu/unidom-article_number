# Code 128 条形码是高密度条形码符号。
# https://en.wikipedia.org/wiki/Code_128
# Code 128 A 条形码 code set: ASCII characters 00 to 95 (0-9, A-Z and control codes), special characters, and FNC 1-4.
# Code 128 B 条形码 code set: ASCII characters 32 to 127 (0-9, A-Z, a-z), special characters, and FNC 1-4.
# Code 128 C 条形码 code set: 00-99 (encodes each two digits with one code) and FNC1.

module Unidom::ArticleNumber::Concerns::Code128Barcode

  extend ActiveSupport::Concern

  self.included do |includer|

    validates :code, uniqueness: true
    validates :code, numericality: { only_integer: true }, if: Proc.new { |barcode| 'C'==barcode.code_set_code }

    has_many :markings, class_name: 'Unidom::ArticleNumber::Marking'

    include Unidom::Common::Concerns::ModelExtension

    #def weighted_modulo_103_checksum(codes)
    #  sum = 103
    #  codes.each_with_index do |char, index| sum += (char.unpack('C').first-32)*(index+1) end
    #  sum%103
    #end

  end

  module ClassMethods
  end

end
