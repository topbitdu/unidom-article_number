##
# VIN (Vehicle Identification Number) 是车辆识别码。
# https://en.wikipedia.org/wiki/Vehicle_identification_number
# GB 16735-2004

class Unidom::ArticleNumber::VehicleIdentificationNumber < Unidom::ArticleNumber::ApplicationRecord

  self.table_name = 'unidom_vehicle_identification_numbers'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::ArticleNumber::Concerns::AsBarcode

  validates :code,                          uniqueness: true, 'unidom/article_number/vehicle_identification_number': true
  validates :world_manufacturer_identifier, presence:   true, length: { is: columns_hash['world_manufacturer_identifier'].limit }
  validates :vehicle_descriptor_section,    presence:   true, length: { is: columns_hash['vehicle_descriptor_section'].limit    }
  validates :check_digit,                   presence:   true, length: { is: columns_hash['check_digit'].limit                   }
  validates :vehicle_identifier_section,    presence:   true, length: { is: columns_hash['vehicle_identifier_section'].limit    }

  def code=(code)
    code = code.to_s
    write_attribute :code, code
    if code.present?
      write_attribute :world_manufacturer_identifier, code[0..2]
      write_attribute :vehicle_descriptor_section,    code[3..7]
      write_attribute :check_digit,                   code[8]
      write_attribute :vehicle_identifier_section,    code[9..16]
    end
  end

end
