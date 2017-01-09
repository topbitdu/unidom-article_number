# https://en.wikipedia.org/wiki/Vehicle_identification_number#Check-digit_calculation
# GB 16735-2004

class Unidom::ArticleNumber::VehicleIdentificationNumberValidator < ActiveModel::EachValidator

  WEIGHTS         = '8765432X098765432'.freeze
  TRANSLITERATION = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'.freeze
  CHECK_DIGITS    = '0123456789X'.freeze

  def validate_each(record, attribute, value)
    value = value.to_s.upcase
    if value.length>17
      record.errors[attribute] << (options[:message]||'The length should be 17')
    elsif value.match /I|O|Q/
      record.errors[attribute] << (options[:message]||'I, O, Q should be excluded')
    else
      record.errors[attribute] << (options[:message]||'is invalid') unless check_digit(value)==value[8]
    end
  end

  def check_digit(value)
    checksum = 0
    value.chars.each_with_index do |char, index| checksum += self.class::TRANSLITERATION.index(char)%10*self.class::CHECK_DIGITS.index(self.class::WEIGHTS.at(index)) end
    self.class::CHECK_DIGITS.at checksum%11
  end

  private :check_digit

end
