RSpec.describe Unidom::ArticleNumber::VehicleIdentificationNumberValidator, type: :validator do

  valid_values = %w{
      LVHCU165XD5002138 LFVAA11A6X2075355 LSVXT25N7E2042597 WP0BB29987S755105
      LVSHJCAC0FE088928 LHGRU5740F2007518 LFBME3089AJB07904 LBVHZ1102HMG31396
      WBSGZ0109BL587599 VF1DZR969EE515428 SAJAA89P09SH30710 WA1BY74L17D070375
      WP0BB29987S755105
    }
  invalid_values = %w{
      LVHCU165XD5002137 LFVAA11A6X2075354 LSVXT25N7E2042596 WP0BB29987S755104
      LVSHJCAC0FE088927 LHGRU5740F2007517 LFBME3089AJB07903 LBVHZ1102HMG31395
      WBSGZ0109BL587598 VF1DZR969EE515427 SAJAA89P09SH30719 WA1BY74L17D070374
      WP0BB29987S755104
    }
  it_behaves_like 'ActiveModel::EachValidator', valid_values, invalid_values

end
